Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-JsonFile {
    param([Parameter(Mandatory)][string]$Path, [Parameter(Mandatory)]$Value)
    Set-Content -LiteralPath $Path -Value ($Value | ConvertTo-Json -Depth 30) -Encoding utf8NoBOM
}

function Add-AuditEvent {
    param([string]$RunDirectory, [System.Collections.IDictionary]$State, [string]$Event, [hashtable]$Data)
    $State.sequence = [int]$State.sequence + 1
    $entry = [ordered]@{ sequence=$State.sequence; timestamp=[DateTimeOffset]::UtcNow.ToString('o'); run_id=$State.run_id; task_id=$State.task_id; event=$Event; state=$State.state; data=$Data }
    Add-Content -LiteralPath (Join-Path $RunDirectory 'events.jsonl') -Value ($entry | ConvertTo-Json -Compress -Depth 30) -Encoding utf8NoBOM
    $State.history += $entry
}

function Save-RunState {
    param([string]$RunDirectory, [System.Collections.IDictionary]$State)
    Write-JsonFile -Path (Join-Path $RunDirectory 'state.json') -Value $State
}

function New-OrchestratorRun {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$RunDirectory, [Parameter(Mandatory)][string]$RunId, [Parameter(Mandatory)][string]$TaskId)
    New-Item -ItemType Directory -Force -Path $RunDirectory, (Join-Path $RunDirectory 'packages'), (Join-Path $RunDirectory 'results'), (Join-Path $RunDirectory 'evidence') | Out-Null
    $state = [ordered]@{ schema_version='0.2'; pipeline_version='0.2'; run_id=$RunId; task_id=$TaskId; state='roadmap_manager'; tony_escalations=0; sequence=0; history=@(); interrupted=$null; advisor_case=$null; exception_handler=$null; return_after_handler=$null; blocker_attempts=@{} }
    Set-Content -LiteralPath (Join-Path $RunDirectory 'events.jsonl') -Value '' -Encoding utf8NoBOM
    Add-AuditEvent $RunDirectory $state 'run_created' @{}
    Save-RunState $RunDirectory $state
    return $state
}

function Assert-ResultEnvelope {
    param([Parameter(Mandatory)]$Result)
    foreach ($name in @('schema_version','run_id','task_id','invocation_id','attempt','role','phase','status','requires_tony','authorization','payload')) {
        if ($null -eq $Result.$name -or (($Result.$name -is [string]) -and [string]::IsNullOrWhiteSpace($Result.$name))) { throw "Missing required result field: $name" }
    }
    if ($Result.schema_version -notin @('0.1','0.2')) { throw 'Unsupported schema_version.' }
    if ($Result.status -notin @('completed','blocked','failed','cancelled')) { throw "Unsupported status: $($Result.status)" }
    if ($Result.status -eq 'blocked' -and $null -eq $Result.blocker) { throw 'Blocked result requires blocker details.' }
}

function Get-NextCompletedState {
    param([string]$Role, [string]$CurrentState)
    switch ($Role) {
        'roadmap_manager' { 'delivery_manager' }
        'delivery_manager' { 'repository_committer' }
        'repository_committer' { if ($CurrentState -eq 'resolving_blocker') { 'resume_interrupted_role' } else { 'implementation_engineer' } }
        'implementation_engineer' { 'independent_reviewer' }
        'independent_reviewer' { 'complete' }
        default { throw "Unknown normal-path role: $Role" }
    }
}

function Get-Registry { param([string]$RegistryPath) Get-Content -Raw -LiteralPath $RegistryPath | ConvertFrom-Json }

function Assert-RoadmapManagerResult {
    param([Parameter(Mandatory)]$Result)
    if ($Result.role -ne 'roadmap_manager') { return }
    if ($Result.status -eq 'completed' -and -not [bool]$Result.requires_tony) {
        if ($null -eq $Result.delivery_assignment) { throw 'Completed Roadmap Manager result requires delivery_assignment.' }
        foreach ($name in @('roadmap_item_id','authoritative_source','verified_state','approval_references','delivery_increment','objective','expected_outcome','in_scope','out_of_scope','dependencies','planning_evidence','governing_references','delivery_manager_access','planning_handoff_path')) {
            if ($null -eq $Result.delivery_assignment.$name) { throw "Missing delivery assignment field: $name" }
        }
        if ($Result.delivery_assignment.roadmap_item_id -notmatch '^RM-[0-9]+$') { throw 'Invalid roadmap item identifier.' }
        if (@($Result.delivery_assignment.approval_references).Count -eq 0 -or @($Result.delivery_assignment.in_scope).Count -eq 0 -or @($Result.delivery_assignment.planning_evidence).Count -eq 0) { throw 'Delivery assignment lacks required authoritative evidence.' }
    }
}

function Assert-AuthorizedAdvisorRoute {
    param($Route, $Registry)
    if ([string]::IsNullOrWhiteSpace([string]$Route.next_role)) { throw 'Advisor route requires next_role.' }
    if ($Route.next_role -eq 'delivery_advisor') { throw 'Delivery Advisor cannot route to itself.' }
    $property = $Registry.roles.PSObject.Properties[$Route.next_role]
    if ($null -eq $property) { throw "Advisor named an unregistered role: $($Route.next_role)" }
    if (-not [string]::IsNullOrWhiteSpace([string]$Route.required_capability) -and $Route.required_capability -notin @($property.Value.capabilities)) { throw 'Advisor route exceeds registered role capability.' }
}

function Assert-AdvisorResult {
    [CmdletBinding()]
    param([Parameter(Mandatory)]$Result, [Parameter(Mandatory)][System.Collections.IDictionary]$State, [Parameter(Mandatory)]$Registry)
    if ($Result.role -ne 'delivery_advisor' -or $Result.status -ne 'completed' -or $null -eq $Result.advisor) { throw 'Invalid Delivery Advisor envelope.' }
    $a = $Result.advisor
    foreach ($name in @('schema_version','case_id','issue_type','summary','delivery_impact','disposition','tony_decision_required','determination','why','recommended_action','instruction','prohibited_actions','evidence_relied_on','alternatives','confidence','confidence_basis')) {
        if ($null -eq $a.$name -or (($a.$name -is [string]) -and [string]::IsNullOrWhiteSpace($a.$name))) { throw "Missing required Advisor field: $name" }
    }
    if ($a.schema_version -ne '0.1') { throw 'Unsupported Advisor schema version.' }
    if ($a.disposition -notin @('ROUTE_EXISTING_ROLE','RESUME_INTERRUPTED_ROLE','GATHER_EVIDENCE','TONY_DECISION','STOP_UNSAFE','LOOP_STOP')) { throw 'Unsupported Advisor disposition.' }
    if ([bool]$Result.requires_tony -ne [bool]$a.tony_decision_required) { throw 'Advisor and envelope Tony-decision flags do not match.' }
    switch ($a.disposition) {
        'TONY_DECISION' {
            if (-not [bool]$a.tony_decision_required -or $a.next_role -ne 'tony') { throw 'TONY_DECISION is inconsistent.' }
        }
        { $_ -in @('ROUTE_EXISTING_ROLE','GATHER_EVIDENCE') } {
            if ([bool]$a.tony_decision_required) { throw 'Existing-role route cannot require Tony.' }
            Assert-AuthorizedAdvisorRoute $a $Registry
        }
        'RESUME_INTERRUPTED_ROLE' {
            if ([bool]$a.tony_decision_required) { throw 'Resume cannot require Tony.' }
            if ($null -eq $State.interrupted -or $a.resume_role -ne $State.interrupted.role -or $a.resume_token -ne $State.interrupted.resume_token) { throw 'Advisor resume does not match checkpoint.' }
        }
        'STOP_UNSAFE' {
            if ($null -eq $a.unsafe_followup -or $a.unsafe_followup.action -notin @('ROUTE_EXISTING_ROLE','GATHER_EVIDENCE','TONY_DECISION','TERMINATE')) { throw 'STOP_UNSAFE requires a valid independently evaluated follow-up.' }
            if (($a.unsafe_followup.action -eq 'TONY_DECISION') -ne [bool]$a.tony_decision_required) { throw 'STOP_UNSAFE Tony result is inconsistent.' }
            if ($a.unsafe_followup.action -in @('ROUTE_EXISTING_ROLE','GATHER_EVIDENCE')) { Assert-AuthorizedAdvisorRoute $a.unsafe_followup $Registry }
        }
        'LOOP_STOP' {
            if ($null -eq $a.loop -or -not [bool]$a.loop.detected -or $a.loop.next_action -notin @('ROUTE_EXISTING_ROLE','GATHER_EVIDENCE','TONY_DECISION','TERMINATE')) { throw 'LOOP_STOP requires valid loop evidence and next action.' }
            if (($a.loop.next_action -eq 'TONY_DECISION') -ne [bool]$a.tony_decision_required) { throw 'LOOP_STOP Tony result is inconsistent.' }
            if ($a.loop.next_action -in @('ROUTE_EXISTING_ROLE','GATHER_EVIDENCE')) { Assert-AuthorizedAdvisorRoute $a $Registry }
        }
    }
    return $true
}

function Enter-AdvisorReview {
    param([string]$RunDirectory, [System.Collections.IDictionary]$State, $Result, [string]$Reason)
    $resumeToken = if ($null -ne $Result.blocker) { $Result.blocker.resume_token } else { $null }
    $State.advisor_case = @{ source_role=$Result.role; invocation_id=$Result.invocation_id; source_state=$State.state; reason=$Reason; resume_token=$resumeToken; candidate_requires_tony=[bool]$Result.requires_tony }
    if ($null -ne $Result.blocker -and $null -eq $State.interrupted) { $State.interrupted = @{ role=$Result.role; invocation_id=$Result.invocation_id; phase=$Result.phase; resume_token=$resumeToken; attempt=$Result.attempt } }
    $State.state = 'delivery_advisor'
    Add-AuditEvent $RunDirectory $State 'advisor_review_requested' @{ source_role=$Result.role; invocation_id=$Result.invocation_id; reason=$Reason }
}

function Apply-AdvisorResult {
    param([string]$RunDirectory, [System.Collections.IDictionary]$State, $Result, $Registry)
    $null = Assert-AdvisorResult $Result $State $Registry
    $a = $Result.advisor
    Add-AuditEvent $RunDirectory $State 'advisor_result_validated' @{ disposition=$a.disposition; tony_decision_required=[bool]$a.tony_decision_required; next_role=$a.next_role }
    switch ($a.disposition) {
        'TONY_DECISION' { $State.tony_escalations++; $State.state='awaiting_tony'; Add-AuditEvent $RunDirectory $State 'tony_escalation' @{ role='delivery_advisor'; case_id=$a.case_id } }
        'ROUTE_EXISTING_ROLE' { $State.state=$a.next_role }
        'GATHER_EVIDENCE' { $State.state=$a.next_role; $State.exception_handler=$a.next_role; $State.return_after_handler=if($null -ne $State.interrupted){'resume_interrupted_role'}else{$null} }
        'RESUME_INTERRUPTED_ROLE' { $State.state='resume_interrupted_role' }
        'STOP_UNSAFE' {
            Add-AuditEvent $RunDirectory $State 'unsafe_route_stopped' @{ case_id=$a.case_id; followup=$a.unsafe_followup.action }
            switch ($a.unsafe_followup.action) {
                'TONY_DECISION' { $State.tony_escalations++; $State.state='awaiting_tony'; Add-AuditEvent $RunDirectory $State 'tony_escalation' @{ role='delivery_advisor'; case_id=$a.case_id } }
                'ROUTE_EXISTING_ROLE' { $State.state=$a.unsafe_followup.next_role }
                'GATHER_EVIDENCE' { $State.state=$a.unsafe_followup.next_role; $State.exception_handler=$a.unsafe_followup.next_role; $State.return_after_handler=if($null -ne $State.interrupted){'resume_interrupted_role'}else{$null} }
                'TERMINATE' { $State.state='stopped_unsafe' }
            }
        }
        'LOOP_STOP' {
            Add-AuditEvent $RunDirectory $State 'workflow_loop_stopped' @{ fingerprint=$a.loop.fingerprint; prior_attempts=$a.loop.prior_attempts; next_action=$a.loop.next_action }
            switch ($a.loop.next_action) {
                'TONY_DECISION' { $State.tony_escalations++; $State.state='awaiting_tony'; Add-AuditEvent $RunDirectory $State 'tony_escalation' @{ role='delivery_advisor'; case_id=$a.case_id } }
                'ROUTE_EXISTING_ROLE' { $State.state=$a.next_role }
                'GATHER_EVIDENCE' { $State.state=$a.next_role }
                'TERMINATE' { $State.state='loop_stopped' }
            }
        }
    }
    $State.advisor_case = $null
}

function Submit-OrchestratorResult {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$RunDirectory, [Parameter(Mandatory)][System.Collections.IDictionary]$State, [Parameter(Mandatory)]$Result, [Parameter(Mandatory)][string]$RegistryPath)
    Assert-ResultEnvelope $Result
    Assert-RoadmapManagerResult $Result
    if ($Result.run_id -ne $State.run_id -or $Result.task_id -ne $State.task_id) { throw 'Result does not belong to this run.' }
    $resultPath = Join-Path (Join-Path $RunDirectory 'results') ($Result.invocation_id + '.json')
    Write-JsonFile $resultPath $Result
    Add-AuditEvent $RunDirectory $State 'role_result_received' @{ role=$Result.role; invocation_id=$Result.invocation_id; attempt=$Result.attempt; status=$Result.status; result_path=$resultPath }
    $registry = Get-Registry $RegistryPath

    if ($Result.role -eq 'delivery_advisor') { Apply-AdvisorResult $RunDirectory $State $Result $registry }
    elseif ([bool]$Result.requires_tony) { Enter-AdvisorReview $RunDirectory $State $Result 'candidate_tony_escalation' }
    elseif ($Result.status -eq 'blocked') {
        $routeProperty = $registry.routes.PSObject.Properties[$Result.blocker.code]
        $route = if ($null -eq $routeProperty) { $null } else { $routeProperty.Value }
        if ($null -eq $route) { Enter-AdvisorReview $RunDirectory $State $Result 'unresolved_blocker' }
        else {
            $handler = $registry.roles.PSObject.Properties[$route.role].Value
            if ($Result.blocker.required_capability -notin @($handler.capabilities)) { Enter-AdvisorReview $RunDirectory $State $Result 'capability_mismatch' }
            elseif ($Result.blocker.code -eq 'WORKTREE_REQUIRED' -and -not [bool]$Result.authorization.worktree_creation_authorized) { Enter-AdvisorReview $RunDirectory $State $Result 'authorization_missing' }
            else {
                $fingerprint = "$($Result.role):$($Result.blocker.code):$($Result.blocker.resume_token)"
                $count = if ($State.blocker_attempts.ContainsKey($fingerprint)) { [int]$State.blocker_attempts[$fingerprint] } else { 0 }
                if ($count -ge 2) { Enter-AdvisorReview $RunDirectory $State $Result 'repeated_route_without_resolution' }
                else {
                    $State.blocker_attempts[$fingerprint] = $count + 1
                    $State.interrupted = @{ role=$Result.role; invocation_id=$Result.invocation_id; phase=$Result.phase; resume_token=$Result.blocker.resume_token; attempt=$Result.attempt }
                    $State.state='resolving_blocker'
                    Add-AuditEvent $RunDirectory $State 'blocker_routed' @{ code=$Result.blocker.code; handler=$route.role; resume_role=$route.resume_role; resume_token=$Result.blocker.resume_token }
                }
            }
        }
    }
    elseif ($Result.status -eq 'completed') {
        if ($State.exception_handler -eq $Result.role -and $State.return_after_handler -eq 'resume_interrupted_role') { $State.state='resume_interrupted_role'; $State.exception_handler=$null; $State.return_after_handler=$null }
        else { $State.state=Get-NextCompletedState $Result.role $State.state }
        Add-AuditEvent $RunDirectory $State 'transition' @{ completed_role=$Result.role; next_state=$State.state }
    }
    else { $State.state='failed'; Add-AuditEvent $RunDirectory $State 'terminal_failure' @{ role=$Result.role; status=$Result.status } }
    Save-RunState $RunDirectory $State
    return $State
}

function Resume-InterruptedRole {
    [CmdletBinding()]
    param([string]$RunDirectory, [System.Collections.IDictionary]$State, [string]$ResolutionEvidence)
    if ($State.state -ne 'resume_interrupted_role' -or $null -eq $State.interrupted) { throw 'No interrupted role is ready to resume.' }
    $State.state=$State.interrupted.role
    Add-AuditEvent $RunDirectory $State 'role_resumed' @{ role=$State.interrupted.role; resume_token=$State.interrupted.resume_token; resolution_evidence=$ResolutionEvidence }
    Save-RunState $RunDirectory $State
    return $State
}

function Test-PathWithinRoot {
    param([Parameter(Mandatory)][string]$Root, [Parameter(Mandatory)][string]$Candidate)
    $rootPath=[IO.Path]::GetFullPath($Root).TrimEnd([IO.Path]::DirectorySeparatorChar)+[IO.Path]::DirectorySeparatorChar
    return [IO.Path]::GetFullPath($Candidate).StartsWith($rootPath,[StringComparison]::OrdinalIgnoreCase)
}

function Test-GitWorktreeEvidence {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$RepositoryRoot, [Parameter(Mandatory)][string]$WorktreePath, [Parameter(Mandatory)][string]$ExpectedBranch)
    if (-not (Test-PathWithinRoot $RepositoryRoot $WorktreePath)) { throw 'Worktree is outside the authorized repository root.' }
    if (-not (Test-Path -LiteralPath $WorktreePath -PathType Container)) { throw 'Worktree path does not exist.' }
    $inside=(& git -C $WorktreePath rev-parse --is-inside-work-tree 2>&1).Trim(); if ($LASTEXITCODE -ne 0 -or $inside -ne 'true') { throw 'Candidate is not a Git worktree.' }
    $branch=(& git -C $WorktreePath branch --show-current 2>&1).Trim(); if ($LASTEXITCODE -ne 0 -or $branch -ne $ExpectedBranch) { throw "Unexpected worktree branch: $branch" }
    $head=(& git -C $WorktreePath rev-parse HEAD 2>&1).Trim(); if ($LASTEXITCODE -ne 0) { throw 'Unable to verify worktree HEAD.' }
    return [ordered]@{ verified=$true; path=[IO.Path]::GetFullPath($WorktreePath); branch=$branch; head=$head }
}

Export-ModuleMember -Function New-OrchestratorRun, Submit-OrchestratorResult, Resume-InterruptedRole, Test-PathWithinRoot, Test-GitWorktreeEvidence, Assert-AdvisorResult

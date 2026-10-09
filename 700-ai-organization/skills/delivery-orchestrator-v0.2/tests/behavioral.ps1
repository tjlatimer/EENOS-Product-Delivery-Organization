$ErrorActionPreference='Stop'
Set-StrictMode -Version Latest
$root=Split-Path -Parent $PSScriptRoot
Import-Module (Join-Path $root 'scripts\Orchestrator.psm1') -Force
$registry=Join-Path $root 'config\role-registry.json'
$cases=Get-Content -Raw -LiteralPath (Join-Path $PSScriptRoot 'fixtures\advisor-behavior-cases.json')|ConvertFrom-Json
$suiteRoot=Join-Path ([IO.Path]::GetTempPath()) ('eenos-advisor-behavior-'+[guid]::NewGuid().ToString('N'))

function Assert-Equal($expected,$actual,[string]$message){if($expected -ne $actual){throw "$message Expected=[$expected] Actual=[$actual]"}}
function New-Candidate([string]$runId,[string]$caseId,[bool]$requiresTony){
    [pscustomobject]@{schema_version='0.1';run_id=$runId;task_id='RM-BEHAVIOR';invocation_id="source-$caseId";attempt=1;role='implementation_engineer';phase='implementation';status='blocked';requires_tony=$requiresTony;authorization=[pscustomobject]@{reference='behavior-fixture';scope_hash='sha256:behavior';worktree_creation_authorized=$false};payload=[pscustomobject]@{format='implementation-package';path="packages/source-$caseId.md"};blocker=[pscustomobject]@{code="CASE_$caseId";summary=$caseId;required_capability='unknown';resume_role='implementation_engineer';resume_token="resume-$caseId";retryable=$false};evidence=@()}
}
function New-Advisor([string]$runId,[string]$caseId,[string]$disposition,[bool]$tony,[string]$nextRole,[string]$capability,[object]$followup,[object]$loop){
    [pscustomobject]@{schema_version='0.1';run_id=$runId;task_id='RM-BEHAVIOR';invocation_id="advisor-$caseId";attempt=1;role='delivery_advisor';phase='exception_resolution';status='completed';requires_tony=$tony;authorization=[pscustomobject]@{reference='behavior-fixture';scope_hash='sha256:behavior'};payload=[pscustomobject]@{format='delivery-advisor-result';path="packages/advisor-$caseId.json"};blocker=$null;evidence=@();advisor=[pscustomobject]@{schema_version='0.1';case_id=$caseId;issue_type=if($caseId -match 'loop'){'workflow_loop'}elseif($caseId -match 'unsafe'){'safety'}elseif($caseId -eq 'rm032_untracked'){'repository_state'}else{'operational'};secondary_issue_types=@();summary=$caseId;delivery_impact=if($disposition -eq 'STOP_UNSAFE'){'unsafe_to_continue'}else{'blocked'};disposition=$disposition;tony_decision_required=$tony;determination="Determination for $caseId";why="Evidence-based reason for $caseId";recommended_action=$disposition;next_role=$nextRole;resolution_role=$nextRole;resume_role=if($disposition -eq 'RESUME_INTERRUPTED_ROLE'){'implementation_engineer'}else{$null};resume_token=if($disposition -eq 'RESUME_INTERRUPTED_ROLE'){"resume-$caseId"}else{$null};required_capability=$capability;instruction="Execute the bounded $disposition action.";prohibited_actions=@('expand scope','infer authority');evidence_relied_on=@('fixture evidence');alternatives=@();confidence='high';confidence_basis='Deterministic behavioral fixture';unsafe_followup=$followup;loop=$loop}}
}

$results=@()
try{
    foreach($case in $cases){
        $runId="behavior-$($case.id)"; $runDir=Join-Path $suiteRoot $case.id
        $state=New-OrchestratorRun $runDir $runId 'RM-BEHAVIOR'
        if($case.id -eq 'worktree_authorized'){
            $direct=Get-Content -Raw -LiteralPath (Join-Path $PSScriptRoot 'fixtures\implementation-blocked-result.json')|ConvertFrom-Json
            $direct.run_id=$runId; $direct.task_id='RM-BEHAVIOR'; $direct.authorization.worktree_creation_authorized=$true
            $state=Submit-OrchestratorResult $runDir $state $direct $registry
        } else {
            $state=Submit-OrchestratorResult $runDir $state (New-Candidate $runId $case.id $true) $registry
            Assert-Equal 'delivery_advisor' $state.state "$($case.id) did not enter Advisor."
            Assert-Equal 0 $state.tony_escalations "$($case.id) escalated before Advisor."
            $advisor=$null
            switch($case.id){
                'rm032_untracked' {$advisor=New-Advisor $runId $case.id 'TONY_DECISION' $true 'tony' $null $null $null}
                'prior_authorization' {$advisor=New-Advisor $runId $case.id 'RESUME_INTERRUPTED_ROLE' $false $null $null $null $null}
                'governance_metadata_loop' {$loop=[pscustomobject]@{detected=$true;fingerprint='governance-metadata';prior_attempts=3;next_action='ROUTE_EXISTING_ROLE'};$advisor=New-Advisor $runId $case.id 'LOOP_STOP' $false 'implementation_engineer' 'implementation' $null $loop}
                'build_failure_exhausted' {$advisor=New-Advisor $runId $case.id 'TONY_DECISION' $true 'tony' $null $null $null}
                'missing_repository_evidence' {$advisor=New-Advisor $runId $case.id 'GATHER_EVIDENCE' $false 'repository_committer' 'git_evidence' $null $null}
                'unsafe_delete_ambiguous' {$follow=[pscustomobject]@{action='TONY_DECISION';next_role='tony';required_capability=$null};$advisor=New-Advisor $runId $case.id 'STOP_UNSAFE' $true 'tony' $null $follow $null}
                'unsafe_route_evidence_available' {$follow=[pscustomobject]@{action='GATHER_EVIDENCE';next_role='repository_committer';required_capability='git_evidence'};$advisor=New-Advisor $runId $case.id 'STOP_UNSAFE' $false 'repository_committer' 'git_evidence' $follow $null}
                'scope_conflict' {$advisor=New-Advisor $runId $case.id 'TONY_DECISION' $true 'tony' $null $null $null}
                'reviewer_defect' {$advisor=New-Advisor $runId $case.id 'ROUTE_EXISTING_ROLE' $false 'implementation_engineer' 'repair' $null $null}
                'repeated_identical_blocker' {$loop=[pscustomobject]@{detected=$true;fingerprint='same-blocker';prior_attempts=3;next_action='TERMINATE'};$advisor=New-Advisor $runId $case.id 'LOOP_STOP' $false $null $null $null $loop}
            }
            $state=Submit-OrchestratorResult $runDir $state $advisor $registry
        }
        Assert-Equal $case.expected_state $state.state "$($case.id) final state failed."
        Assert-Equal ([int]$case.after_tony) ([int]$state.tony_escalations) "$($case.id) escalation count failed."
        $results += [pscustomobject]@{case=$case.id;disposition=$case.expected_disposition;before_tony=[int]$case.before_tony;after_tony=[int]$state.tony_escalations;state=$state.state;result='PASS'}
    }
    $results|Format-Table -AutoSize|Out-String|Write-Output
    "PASS: $($results.Count) Delivery Advisor behavioral fixtures. Before Tony escalations=$((($results|Measure-Object before_tony -Sum).Sum)); After Tony escalations=$((($results|Measure-Object after_tony -Sum).Sum))."
}
finally{if(Test-Path -LiteralPath $suiteRoot){Remove-Item -LiteralPath $suiteRoot -Recurse -Force}}

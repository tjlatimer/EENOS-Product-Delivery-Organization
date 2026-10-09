$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
$root = Split-Path -Parent $PSScriptRoot
Import-Module (Join-Path $root 'scripts\Orchestrator.psm1') -Force
$registry = Join-Path $root 'config\role-registry.json'
$fixtures = Join-Path $PSScriptRoot 'fixtures'
$testRoot = Join-Path ([IO.Path]::GetTempPath()) ('eenos-orchestrator-unit-' + [guid]::NewGuid().ToString('N'))
function Read-Fixture([string]$Name) { Get-Content -Raw -LiteralPath (Join-Path $fixtures $Name) | ConvertFrom-Json }
function Assert-Equal($Expected,$Actual,[string]$Message) { if($Expected -ne $Actual){throw "$Message Expected=[$Expected] Actual=[$Actual]"} }
try {
    $state=New-OrchestratorRun $testRoot 'unit-run' 'RM-TEST-001'
    $state=Submit-OrchestratorResult $testRoot $state (Read-Fixture 'delivery-manager-result.json') $registry
    Assert-Equal 'repository_committer' $state.state 'Delivery Manager transition failed.'
    $state=Submit-OrchestratorResult $testRoot $state (Read-Fixture 'repository-preflight-result.json') $registry
    Assert-Equal 'implementation_engineer' $state.state 'Repository Committer transition failed.'
    $state=Submit-OrchestratorResult $testRoot $state (Read-Fixture 'implementation-blocked-result.json') $registry
    Assert-Equal 'resolving_blocker' $state.state 'Authorized blocker routing changed.'
    $state=Submit-OrchestratorResult $testRoot $state (Read-Fixture 'worktree-resolution-result.json') $registry
    Assert-Equal 'resume_interrupted_role' $state.state 'Blocker resolution transition failed.'
    $state=Resume-InterruptedRole $testRoot $state 'verified-worktree-evidence'
    $state=Submit-OrchestratorResult $testRoot $state (Read-Fixture 'implementation-complete-result.json') $registry
    $state=Submit-OrchestratorResult $testRoot $state (Read-Fixture 'reviewer-no-findings-result.json') $registry
    Assert-Equal 'complete' $state.state 'Normal delivery path failed.'
    Assert-Equal 0 $state.tony_escalations 'Normal delivery escalated.'
    if(-not(Test-PathWithinRoot $testRoot (Join-Path $testRoot 'child'))){throw 'Contained path rejected.'}
    if(Test-PathWithinRoot $testRoot (Split-Path -Parent $testRoot)){throw 'Outside path accepted.'}
    $events=@(Get-Content (Join-Path $testRoot 'events.jsonl')|Where-Object{$_.Trim()}|ForEach-Object{$_|ConvertFrom-Json})
    Assert-Equal $state.sequence $events[-1].sequence 'Audit sequence did not persist.'

    $candidateRoot=$testRoot+'-candidate'
    $candidateState=New-OrchestratorRun $candidateRoot 'unit-run' 'RM-TEST-001'
    $candidate=Read-Fixture 'implementation-blocked-result.json'; $candidate.requires_tony=$true
    $candidateState=Submit-OrchestratorResult $candidateRoot $candidateState $candidate $registry
    Assert-Equal 'delivery_advisor' $candidateState.state 'Candidate escalation bypassed Advisor.'
    Assert-Equal 0 $candidateState.tony_escalations 'Tony incremented before advice.'
    $invalid=[pscustomobject]@{schema_version='0.1';run_id='unit-run';task_id='RM-TEST-001';invocation_id='advisor-invalid';attempt=1;role='delivery_advisor';phase='exception_resolution';status='completed';requires_tony=$false;authorization=[pscustomobject]@{reference='test';scope_hash='sha256:test'};payload=[pscustomobject]@{format='delivery-advisor-result';path='packages/advisor-invalid.json'};blocker=$null;evidence=@();advisor=[pscustomobject]@{schema_version='0.1';case_id='case-invalid';issue_type='operational';secondary_issue_types=@();summary='Invalid self route';delivery_impact='blocked';disposition='ROUTE_EXISTING_ROLE';tony_decision_required=$false;determination='invalid';why='test';recommended_action='route';next_role='delivery_advisor';resolution_role=$null;resume_role=$null;resume_token=$null;required_capability='exception_analysis';instruction='invalid';prohibited_actions=@();evidence_relied_on=@();alternatives=@();confidence='high';confidence_basis='test'}}
    $rejected=$false; try{$null=Submit-OrchestratorResult $candidateRoot $candidateState $invalid $registry}catch{$rejected=$_.Exception.Message -match 'cannot route to itself'}
    Assert-Equal $true $rejected 'Independent Advisor route validation failed.'
    'PASS: normal path, blocker route, resume, audit, candidate-advisor gate, and independent Advisor validation.'
}
finally { foreach($path in @($testRoot,$testRoot+'-candidate')){if(Test-Path -LiteralPath $path){Remove-Item -LiteralPath $path -Recurse -Force}} }

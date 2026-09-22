$ErrorActionPreference='Stop'
Set-StrictMode -Version Latest
$root=Split-Path -Parent $PSScriptRoot
Import-Module (Join-Path $root 'scripts\Orchestrator.psm1') -Force
$registry=Join-Path $root 'config\role-registry.json'
$suiteRoot=Join-Path ([IO.Path]::GetTempPath()) ('eenos-v02-roadmap-'+[guid]::NewGuid().ToString('N'))
function Assert-Equal($expected,$actual,[string]$message){if($expected -ne $actual){throw "$message Expected=[$expected] Actual=[$actual]"}}
function New-Base([string]$runId,[string]$role,[string]$id,[string]$status='completed',[bool]$tony=$false){[pscustomobject]@{schema_version='0.2';run_id=$runId;task_id='RM-200';invocation_id=$id;attempt=1;role=$role;phase=$role;status=$status;requires_tony=$tony;authorization=[pscustomobject]@{reference='approved-roadmap-item';scope_hash='sha256:rm200';worktree_creation_authorized=$false};payload=[pscustomobject]@{format="$role-package";path="packages/$id.md"};blocker=$null;evidence=@()}}
function New-RoadmapReady([string]$runId,[string]$id){$r=New-Base $runId 'roadmap_manager' $id; $r|Add-Member delivery_assignment ([pscustomobject]@{roadmap_item_id='RM-200';authoritative_source='roadmap.md#RM-200';verified_state='Approved / Delivery Ready';approval_references=@('Tony decision TD-200');delivery_increment='Bounded increment A';objective='Deliver the approved bounded increment.';expected_outcome='Increment is implementation-ready.';in_scope=@('approved increment A');out_of_scope=@('increment B');dependencies=@();planning_evidence=@('roadmap.md','TD-200');governing_references=@('Roadmap Manager Skill');delivery_manager_access=@('roadmap read');planning_handoff_path="packages/$id.md"});$r}
function New-RoadmapBlocked([string]$runId,[string]$id,[bool]$tony){$r=New-Base $runId 'roadmap_manager' $id 'blocked' $tony;$r.blocker=[pscustomobject]@{code='PLANNING_EVIDENCE_MISSING';summary='Planning evidence is missing.';required_capability='git_evidence';resume_role='roadmap_manager';resume_token="resume-$id";retryable=$true};$r}
function New-Advisor([string]$runId,[string]$id,[string]$disposition,[bool]$tony,[string]$nextRole,[string]$capability,[string]$resumeToken){
    $r=New-Base $runId 'delivery_advisor' "advisor-$id" 'completed' $tony
    $r|Add-Member advisor ([pscustomobject]@{schema_version='0.1';case_id=$id;issue_type='operational';secondary_issue_types=@();summary=$id;delivery_impact='blocked';disposition=$disposition;tony_decision_required=$tony;determination="Decision for $id";why='Authoritative fixture evidence.';recommended_action=$disposition;next_role=$nextRole;resolution_role=$nextRole;resume_role=if($disposition -eq 'RESUME_INTERRUPTED_ROLE'){'roadmap_manager'}else{$null};resume_token=if($disposition -eq 'RESUME_INTERRUPTED_ROLE'){$resumeToken}else{$null};required_capability=$capability;instruction='Execute only the bounded next action.';prohibited_actions=@('expand scope');evidence_relied_on=@('fixture');alternatives=@();confidence='high';confidence_basis='Deterministic fixture';unsafe_followup=$null;loop=$null})
    $r
}
function New-Run([string]$name){$dir=Join-Path $suiteRoot $name;$state=New-OrchestratorRun $dir "v02-$name" 'RM-200';[pscustomobject]@{dir=$dir;state=$state;runId="v02-$name"}}

$results=@()
try{
    # 1. Valid roadmap item to Delivery Manager.
    $x=New-Run 'valid-assignment'; Assert-Equal 'roadmap_manager' $x.state.state 'v0.2 did not start at Roadmap Manager.'
    $x.state=Submit-OrchestratorResult $x.dir $x.state (New-RoadmapReady $x.runId 'rm-ready') $registry
    Assert-Equal 'delivery_manager' $x.state.state 'Valid assignment did not route to Delivery Manager.'; $results+='1 PASS'

    # 2. Missing evidence gathered by authorized Repository Committer, then Roadmap Manager resumes.
    $x=New-Run 'evidence'; $blocked=New-RoadmapBlocked $x.runId 'rm-evidence' $false
    $x.state=Submit-OrchestratorResult $x.dir $x.state $blocked $registry; Assert-Equal 'delivery_advisor' $x.state.state 'Missing evidence did not enter Advisor.'
    $x.state=Submit-OrchestratorResult $x.dir $x.state (New-Advisor $x.runId 'evidence' 'GATHER_EVIDENCE' $false 'repository_committer' 'git_evidence' $null) $registry
    Assert-Equal 'repository_committer' $x.state.state 'Advisor did not route evidence gathering.'
    $x.state=Submit-OrchestratorResult $x.dir $x.state (New-Base $x.runId 'repository_committer' 'evidence-result') $registry
    Assert-Equal 'resume_interrupted_role' $x.state.state 'Evidence handler did not return to checkpoint.'
    $x.state=Resume-InterruptedRole $x.dir $x.state 'planning evidence verified'; Assert-Equal 'roadmap_manager' $x.state.state 'Roadmap Manager did not resume.';Assert-Equal 0 $x.state.tony_escalations 'Evidence case escalated.';$results+='2 PASS'

    # 3. Genuine roadmap/product decision reaches Tony only after Advisor.
    $x=New-Run 'product-decision'; $x.state=Submit-OrchestratorResult $x.dir $x.state (New-RoadmapBlocked $x.runId 'rm-product' $true) $registry
    Assert-Equal 'delivery_advisor' $x.state.state 'Product decision bypassed Advisor.';Assert-Equal 0 $x.state.tony_escalations 'Tony counted before Advisor.'
    $x.state=Submit-OrchestratorResult $x.dir $x.state (New-Advisor $x.runId 'product' 'TONY_DECISION' $true 'tony' $null $null) $registry
    Assert-Equal 'awaiting_tony' $x.state.state 'Genuine product decision did not reach Tony.';Assert-Equal 1 $x.state.tony_escalations 'Genuine decision count incorrect.';$results+='3 PASS'

    # 4. Prior Tony decision allows resume without re-escalation.
    $x=New-Run 'prior-decision'; $b=New-RoadmapBlocked $x.runId 'rm-prior' $true; $x.state=Submit-OrchestratorResult $x.dir $x.state $b $registry
    $x.state=Submit-OrchestratorResult $x.dir $x.state (New-Advisor $x.runId 'prior' 'RESUME_INTERRUPTED_ROLE' $false $null $null 'resume-rm-prior') $registry
    Assert-Equal 'resume_interrupted_role' $x.state.state 'Prior decision was not recognized.';Assert-Equal 0 $x.state.tony_escalations 'Prior decision re-escalated.';$results+='4 PASS'

    # 5. Full Roadmap Manager checkpoint/resume then ready assignment.
    $x=New-Run 'checkpoint'; $x.state=Submit-OrchestratorResult $x.dir $x.state (New-RoadmapBlocked $x.runId 'rm-checkpoint' $false) $registry
    $x.state=Submit-OrchestratorResult $x.dir $x.state (New-Advisor $x.runId 'checkpoint' 'GATHER_EVIDENCE' $false 'repository_committer' 'git_evidence' $null) $registry
    $x.state=Submit-OrchestratorResult $x.dir $x.state (New-Base $x.runId 'repository_committer' 'checkpoint-evidence') $registry
    $x.state=Resume-InterruptedRole $x.dir $x.state 'checkpoint evidence'; $x.state=Submit-OrchestratorResult $x.dir $x.state (New-RoadmapReady $x.runId 'rm-checkpoint-ready') $registry
    Assert-Equal 'delivery_manager' $x.state.state 'Resumed Roadmap Manager did not complete assignment.';$results+='5 PASS'

    # 6. Normal five-role regression.
    $x=New-Run 'five-role'; $x.state=Submit-OrchestratorResult $x.dir $x.state (New-RoadmapReady $x.runId 'five-rm') $registry
    foreach($step in @(@('delivery_manager','five-dm','repository_committer'),@('repository_committer','five-rc','implementation_engineer'),@('implementation_engineer','five-ie','independent_reviewer'),@('independent_reviewer','five-review','complete'))){$x.state=Submit-OrchestratorResult $x.dir $x.state (New-Base $x.runId $step[0] $step[1]) $registry;Assert-Equal $step[2] $x.state.state "Five-role transition failed after $($step[0])."}
    Assert-Equal 0 $x.state.tony_escalations 'Five-role path escalated.';$results+='6 PASS'

    $results|ForEach-Object{$_};'PASS: 6 Roadmap Manager v0.2 deterministic scenarios.'
}
finally{if(Test-Path -LiteralPath $suiteRoot){Remove-Item -LiteralPath $suiteRoot -Recurse -Force}}

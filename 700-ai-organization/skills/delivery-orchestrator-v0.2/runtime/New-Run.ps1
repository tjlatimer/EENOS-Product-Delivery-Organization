[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$RunId,
    [Parameter(Mandatory)][string]$TaskId
)
$ErrorActionPreference='Stop'
$config=Get-Content -Raw -LiteralPath (Join-Path $PSScriptRoot 'runtime-config.json')|ConvertFrom-Json
$runDirectory=Join-Path $config.runs_root $RunId
if(Test-Path -LiteralPath $runDirectory){throw "Run already exists: $runDirectory"}
Import-Module (Join-Path $config.skill_root 'scripts\Orchestrator.psm1') -Force
New-OrchestratorRun -RunDirectory $runDirectory -RunId $RunId -TaskId $TaskId

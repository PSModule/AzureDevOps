#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '6.0.0'; MaximumVersion = '6.*' }

$ModuleName = "AzureDevOps.Common";
Import-Module "$PSScriptRoot\..\..\AzureDevOps\$ModuleName" -Force;

Describe "$ModuleName submodule behaviour" {
    $ModuleInfo = Get-Module -Name $ModuleName;
    
    It 'Exports a function named Invoke-AzureDevOpsRestMethod' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Invoke-AzureDevOpsRestMethod') | Should Be $True;
    }
}
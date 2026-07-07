#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '6.0.0'; MaximumVersion = '6.*'; GUID = 'a699dea5-2c73-4616-a270-1f7abb777e71' }

$ModuleName = "AzureDevOps.VariableGroups";
Import-Module "$PSScriptRoot\..\..\AzureDevOps\$ModuleName" -Force;

Describe "$ModuleName submodule behaviour" {
    $ModuleInfo = Get-Module -Name $ModuleName;
    
    It 'Exports a function named Add-AzureDevOpsVariable' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Add-AzureDevOpsVariable') | Should Be $True;
    }

    It 'Exports a function named Get-AzureDevOpsVariableGroup' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Get-AzureDevOpsVariableGroup') | Should Be $True;
    }

    It 'Exports a function named Copy-AzureDevOpsVariableGroup' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Copy-AzureDevOpsVariableGroup') | Should Be $True;
    }

    It 'Exports a function named New-AzureDevOpsVariable' {
        $ModuleInfo.ExportedFunctions.ContainsKey('New-AzureDevOpsVariableGroup') | Should Be $True;
    }
    
    It 'Exports a function named New-AzureDevOpsVariableGroup' {
        $ModuleInfo.ExportedFunctions.ContainsKey('New-AzureDevOpsVariableGroup') | Should Be $True;
    }
    
    It 'Exports a function named Add-AzureDevOpsVariableGroup' {
        $ModuleInfo.ExportedFunctions.ContainsKey('New-AzureDevOpsVariableGroup') | Should Be $True;
    }
}
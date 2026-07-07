#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '6.0.0'; MaximumVersion = '6.*'; GUID = 'a699dea5-2c73-4616-a270-1f7abb777e71' }

$ModuleName = "AzureDevOps";
$ModulePath = "$PSScriptRoot\..\$ModuleName"
Import-Module $ModulePath -Force;

Describe "$ModuleName module behaviour" {
    $ModuleInfo = Get-Module -Name $ModuleName;
    $expectedSubmodules = (Get-ChildItem -Directory $ModulePath | Select-Object -ExpandProperty Name);
    $expectedCommands = (Get-ChildItem $ModulePath -File -Recurse | Where-Object { $_.DirectoryName -match "Public" } | Select-Object -ExpandProperty BaseName);

    It 'Contains all expected submodules' {
        $nestedModules = $ModuleInfo.NestedModules | Select-Object -ExpandProperty Name;
        foreach ($submodule in $expectedSubmodules) {
            $nestedModules.Contains($submodule) | Should Be $True;
        }
    }

    It 'Exports all expected commands' {
        foreach ($command in $expectedCommands) {
            $ModuleInfo.ExportedFunctions.ContainsKey($command) | Should Be $True;
        }
    }
}
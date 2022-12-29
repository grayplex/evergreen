<#
    .SYNOPSIS
        Private Pester function tests.
#>
[OutputType()]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "", Justification="This OK for the tests files.")]
param ()

BeforeDiscovery {
}

BeforeAll {
}

Describe -Name "Save-File" {
    Context "Ensure Save-File works as expected" {
        It "Returns a string if the file is downloaded" {
            InModuleScope Evergreen {
                $Uri = "https://raw.githubusercontent.com/aaronparker/evergreen/main/Evergreen/Evergreen.json"
                (Save-File -Uri $Uri) | Should -BeOfType [System.IO.FileInfo]
            }
        }
    }
}

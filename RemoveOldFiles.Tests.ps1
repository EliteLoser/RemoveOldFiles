#requires -version 3


# Pester 4.x tests for Remove-OldFiles in the RemoveOldFiles module.
# Joakim Borger Svendsen. Started 2018-12-17. Svendsen Tech.

Import-Module -Name Pester -ErrorAction Stop
Import-Module -Name RemoveOldFiles -ErrorAction Stop

# This is mine also, in the PowerShell Gallery. Just crudely making it available for the tests.
Save-Module -Name RandomData -Path $Env:Temp -Force
Import-Module "$Env:Temp\RandomData" -Force

$STBaseDir = "$Env:Temp\RemoveOldFiles.Tests.Svendsen.Tech"
New-Item -Path "$STBaseDir\sub1\sub2\sub3" -ItemType Directory -Force | Out-Null

Describe RemoveOldFiles {
    
    function SetFilesInPlace {
        # Set up some test files using New-RandomData.
        # Files to keep for last.
        New-RandomData -Path $STBaseDir -Count 3 -BaseName keep -Extension .keep `
            -Size 1024 -LineLength 128
        New-RandomData -Path "$STBaseDir\sub1" -Count 3 -BaseName keep -Extension .keep `
            -Size 1024 -LineLength 128
        New-RandomData -Path "$STBaseDir\sub1\sub2" -Count 3 -BaseName keep -Extension .keep `
            -Size 1024 -LineLength 128
        New-RandomData -Path "$STBaseDir\sub1\sub2\sub3" -Count 3 -BaseName keep -Extension .keep `
            -Size 1024 -LineLength 128
    
        # Files to delete first
        New-RandomData -Path $STBaseDir -Count 3 -BaseName delete -Extension .delete `
            -Size 1024 -LineLength 128
        New-RandomData -Path "$STBaseDir\sub1" -Count 3 -BaseName delete -Extension .delete `
            -Size 1024 -LineLength 128
        New-RandomData -Path "$STBaseDir\sub1\sub2" -Count 3 -BaseName delete -Extension .delete `
            -Size 1024 -LineLength 128
        New-RandomData -Path "$STBaseDir\sub1\sub2\sub3" -Count 3 -BaseName delete -Extension .delete `
            -Size 1024 -LineLength 128
    }
    
    SetFilesInPlace

    It "Does not delete any files with -WhatIf in use and 1 ms back in time with -Path." {
        (Remove-OldFiles -Path $STBaseDir -WhatIf -Millisecond 1) 4> $Null
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -File).Count | Should -Be 24
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -Directory).Count | Should -Be 3
    }

    It "Does not delete any files with -WhatIf in use and 1 ms back in time with -LiteralPath." {
        (Remove-OldFiles -LiteralPath $STBaseDir -WhatIf -Millisecond 1) 4> $Null
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -File).Count | Should -Be 24
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -Directory).Count | Should -Be 3
    }

    It "Deletes only one level deep without recursion with -Path." {
        (Remove-OldFiles -Path $STBaseDir -Millisecond 1) 4> $Null
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -File).Count |
            Should -Be 18
    }

    SetFilesInPlace
    
    It "Deletes only one level deep without recursion with -LiteralPath." {
        (Remove-OldFiles -LiteralPath $STBaseDir -Millisecond 1) 4> $Null
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -File).Count |
            Should -Be 18
    }

    SetFilesInPlace
    
    It "Deletes two levels deep with Resolve-Path support with -Path." {
        (Remove-OldFiles -Path "$STBaseDir\*\*" -Millisecond 1) 4> $Null
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -File).Count |
            Should -Be 12
    }

    SetFilesInPlace
    
    It "Deletes two levels deep with Resolve-Path support with -Path, and also filters on a name regex." {
        (Remove-OldFiles -Path "$STBaseDir\*\*" -Millisecond 1 -NameRegexMatch '^delete') 4> $Null
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -File).Count |
            Should -Be 18
    }

    SetFilesInPlace
    
    It "Deletes all 'old' files with recursion" {
        (Remove-OldFiles -Path $STBaseDir -Millisecond 1 -Recurse) 4> $Null
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -File).Count |
            Should -Be 0
    }

    SetFilesInPlace
    
    It "Deletes only files matching the file name regex specified with recursion." {
        (Remove-OldFiles -Path $STBaseDir -Millisecond 1 -Recurse -NameRegexMatch '\.delete$') 4> $Null
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -File).Count |
            Should -Be 12
    }

    SetFilesInPlace
    
    It "Deletes no files if the specified time back is longer ago than since when the files were created." {
        (Remove-OldFiles -Path $STBaseDir -Month 12 -Recurse) 4> $Null
        @(Get-ChildItem -LiteralPath $STBaseDir -Recurse -File).Count |
            Should -Be 24
    }

}

# Clean up.

Remove-Item -LiteralPath "$Env:Temp\RandomData" -Recurse -Force
Remove-Item -LiteralPath "$Env:Temp\RemoveOldFiles.Tests.Svendsen.Tech" -Recurse #-Force

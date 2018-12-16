function Remove-OldFiles {
    <#
    .SYNOPSIS
        
            Removes files that are older than the specified number of milliseconds,
            seconds, minutes, hours, days, weeks or months - or a combination of any
            of these.
        
            Optional file name filtering with a regular expression.

            Copyright 2018-present, Joakim Borger Svendsen. All right reserved.
            Svendsen Tech.

            MIT license.

        .DESCRIPTION
        
            The times specified from ms to months are all cumulated and added together to
            form a large decimal-typed millisecond number. Months are handled with .NET date
            math as calendar months converted to milliseconds.

            You can specify a -NameFilterRegex parameter to only target only file names
            that match this regular expression. The default is simply ".*", which always matches,
            so name filtering is in effect not enabled by default unless you override with this
            parameter. NB! It is not wildcards such as for the -like operator, but regular
            expressions, so make sure you test and know that the results are as expected.

            It supports -WhatIf in a non-proper implementation currently (but functionally not
            too different, it was just a bit easier and also caused by a now gone, dead end in code).

        .PARAMETER Path
            Path or paths to process.

        .PARAMETER LiteralPath
            Path or paths to process using a literal path where brackets in names do not cause
            problems in PowerShell version 2.

        .PARAMETER Recurse
            Traverse directory structure recursively, otherwise only the first level is processed
            if the specified path is a directory. Only files are targeted if using, say, -Path x:\finance\*.log

        .PARAMETER Millisecond
            Delete files that were last modified longer ago than the specified number of milliseconds.
            This number is cumulatively added up with all other potentially specified times.

        .PARAMETER Second
            Delete files that were last modified longer ago than the specified number of seconds.
            This number is cumulatively added up with all other potentially specified times.
        
        .PARAMETER Minute
            Delete files that were last modified longer ago than the specified number of minutes.
            This number is cumulatively added up with all other potentially specified times.
        
        .PARAMETER Hour
            Delete files that were last modified longer ago than the specified number of hours.
            This number is cumulatively added up with all other potentially specified times.
        
        .PARAMETER Day
            Delete files that were last modified longer ago than the specified number of days.
            This number is cumulatively added up with all other potentially specified times.
        
        .PARAMETER Week
            Delete files that were last modified longer ago than the specified number of weeks.
            This number is cumulatively added up with all other potentially specified times.
        
        .PARAMETER Month
            Delete files that were last modified longer ago than the specified number of months.
            This number is cumulatively added up with all other potentially specified times.
        
        .PARAMETER WhatIf
            A non-standard implementation of the -WhatIf parameter (I might fix it some time).

        .PARAMETER NameRegexMatch
            A regular expression the (Get-Item <current_element>).Name property must match.
            NB! Not wildcards such as for -like, but regular expression, such as for -match.
    
        .EXAMPLE
            Remove-OldFiles -Path . -WhatIf -Second 20 -Recurse -NameRegexMatch '\.tmp$'

            Removes all files with the extension ".tmp" that were modified more than 20
            seconds ago if you leave out -WhatIf.

        .EXAMPLE
            Remove-OldFiles -Path . -Minute 1 -Second 20 -Recurse -NameRegexMatch '^startswiththis'

            Removes all files in the current directory that were modified more than 1 minute 
            and twenty seconds ago. Not full minutes or seconds above; even one minute twenty
            seconds and one single millisecond extra since last modification will trigger removal.

        .EXAMPLE
        PS C:\temp\testdir> Remove-OldFiles -Path . -Minute 17 -Recurse -NameRegexMatch '\.tmp$' 

        VERBOSE: Recorded 'now' time as: 2018-12-16 21:11:27
        VERBOSE: Total milliseconds: 1020000.
        0 months.
        0 weeks.
        0 days.
        0 hours.
        17 minutes.
        0 seconds.
        0 milliseconds.
        VERBOSE: Processing path '.'.
        VERBOSE: in foreach processing 'C:\temp\testdir'.
        VERBOSE: Processing first level directory with path: 'C:\temp\testdir'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\deletethese1.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\1\2\3\deletethese1.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\deletethese2.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\1\2\3\deletethese2.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\deletethese3.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\1\2\3\deletethese3.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\keepthese1.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\keepthese2.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\keepthese3.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\deletethese1.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese1.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\deletethese2.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese2.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\deletethese3.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese3.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese1.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese2.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese3.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\deletethese1.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\1\deletethese1.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\1\deletethese2.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\1\deletethese2.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\1\deletethese3.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\1\deletethese3.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese1.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese2.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese3.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\deletethese1.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\deletethese1.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\deletethese2.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\deletethese2.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\deletethese3.tmp'.
        VERBOSE: Removing file 'C:\temp\testdir\deletethese3.tmp' because it was modified more than 1020000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
        VERBOSE: in foreach processing 'C:\temp\testdir\keepthese1.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\keepthese2.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\keepthese3.log'.
        VERBOSE: Total processed path count was: 28
        VERBOSE: Attempted to delete 12 files.


        PS C:\temp\testdir> Remove-OldFiles -Path . -Minute 17 -Recurse -NameRegexMatch '\.tmp$' 

        VERBOSE: Recorded 'now' time as: 2018-12-16 21:11:38
        VERBOSE: Total milliseconds: 1020000.
        0 months.
        0 weeks.
        0 days.
        0 hours.
        17 minutes.
        0 seconds.
        0 milliseconds.
        VERBOSE: Processing path '.'.
        VERBOSE: in foreach processing 'C:\temp\testdir'.
        VERBOSE: Processing first level directory with path: 'C:\temp\testdir'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\keepthese1.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\keepthese2.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\keepthese3.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese1.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese2.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese3.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese1.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese2.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese3.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\keepthese1.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\keepthese2.log'.
        VERBOSE: in foreach processing 'C:\temp\testdir\keepthese3.log'.
        VERBOSE: Total processed path count was: 16
        VERBOSE: Attempted to delete 0 files.


        .LINK
            https://github.com/EliteLoser/RemoveOldFiles
    
    #>

    [CmdletBinding(
        DefaultParameterSetName = "Path"#,
        #SupportsShouldProcess = $True # cheating, tho... :P
    )]

    Param(
        [Parameter(
            Mandatory = $True,
            ParameterSetName = "Path",
            Position = 0,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True)]
            [Alias('FilePath', 'FullName', 'Name')]
            [String[]] $Path,

        [Parameter(
            Mandatory = $True,
            ParameterSetName = "LiteralPath",
            Position = 0,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True)]
            # Can't declare multiple aliases with the same name even in different parameter sets..
            #[Alias('FilePath', 'FullName', 'Name')]
            [String[]] $LiteralPath,

        [Switch] $Recurse,
        [Decimal] $Millisecond = 0,
        [Decimal] $Second = 0,
        [Decimal] $Minute = 0,
        [Decimal] $Hour = 0,
        [Decimal] $Day = 0,
        [Decimal] $Week = 0,
        [Decimal] $Month = 0,
        [Switch] $WhatIf = $False,
        [Regex] $NameRegexMatch = '.*')
        #[Switch] $RemoveEmptyDirectories) # to do...

   

    Begin {

        $VerbosePreference = "Continue"

        [DateTime] $Script:Now = Get-Date
        Write-Verbose "Recorded 'now' time as: $($Now.ToString('yyyy\-MM\-dd HH\:mm\:ss'))"

        # Use to avoid infinite loops, use the ProviderPath property, store it and do not process
        # if it's already been processed. Lookups are fast.

        [HashTable] $Script:AlreadyProcessed = @{}

        [Decimal] $Script:InnerProcessPathCounter = 0
        [Decimal] $Script:DeleteCount = 0
        [Bool] $Script:FirstLevelDirectoryListing = $True

        [HashTable] $Script:RecurseSplat = @{}
        if ($Recurse) {
            $Script:RecurseSplat = @{ Recurse = $True }
        }

        [HashTable] $Script:WhatIfSplat = @{}
        if ($WhatIf) {
            $Script:WhatIfSplat = @{ WhatIf = $True }
        }

        # Months is a special case since it's not fixed like the rest.
        # Figure it'll make it awesomerer to support that as well.
        [Decimal] $TotalMillisecondsBack = 0
        if ($Month -gt 0) {
            $LastMontshMilliseconds = ($Now - $Now.AddMonths(( -1 * $Month ))).TotalMilliseconds
        }
        else {
            $LastMontshMilliseconds = 0
        }

        $TotalMillisecondsBack += $LastMontshMilliseconds
        $TotalMillisecondsBack += $Millisecond
        $TotalMillisecondsBack += $Second * 1000
        $TotalMillisecondsBack += $Minute * 60 * 1000
        $TotalMillisecondsBack += $Hour * 60 * 60 * 1000
        $TotalMillisecondsBack += $Day * 24 * 60 * 60 * 1000
        $TotalMillisecondsBack += $Week * 7 * 24 * 60 * 60 * 1000

        if ($TotalMillisecondsBack -eq 0) {
            Write-Error -Message ("Error. You need to specify how long back in time to filter on. All files that " + `
                "were modified before the specified number of milliseconds, seconds, minutes, hours, days, weeks " + `
                "and months will be attempted deleted. If you add multiple, such as -Minute 1 and -Second 30, it" + `
                " would be added up to 90 seconds / 1.5 minutes.") `
                -ErrorAction Stop
        }
        Write-Verbose "Total milliseconds: $TotalMillisecondsBack.
$Month months.
$Week weeks.
$Day days.
$Hour hours.
$Minute minutes.
$Second seconds.
$Millisecond milliseconds."
    
        function InnerProcessPath {               

            Param([String[]] $Path)
            foreach ($TempInnerPath in $Path) {

                ++$Script:InnerProcessPathCounter

                if ($Script:AlreadyProcessed.ContainsKey($TempInnerPath)) {
                    continue
                }

                Write-Verbose "in foreach processing '$TempInnerPath'."
                if (Test-Path -LiteralPath $TempInnerPath -PathType Container) {

                    if ($Recurse -or $Script:FirstLevelDirectoryListing) {

                        if ($Script:FirstLevelDirectoryListing) {
                            Write-Verbose "Processing first level directory with path: '$TempInnerPath'."
                            $Script:FirstLevelDirectoryListing = $False
                        }

                        Get-ChildItem -LiteralPath $TempInnerPath | ForEach-Object {
                            InnerProcessPath -Path $_.FullName
                        }

                    }

                    else {

                        Write-Verbose "-Recurse parameter not specified, so directory '$TempInnerPath' is skipped."

                    }

                }

                elseif (Test-Path -LiteralPath $TempInnerPath -PathType Leaf) {
                    $Item = Get-Item -LiteralPath $TempInnerPath
                    if (($Script:Now - $Item.LastWriteTime).TotalMilliseconds -gt $TotalMillisecondsBack) {
                        if (-not $WhatIf -and $Item.Name -match $NameRegexMatch) {
                            Write-Verbose "Removing file '$($Item.FullName
                                )' because it was modified more than $($TotalMillisecondsBack
                                ) ms ago and matches the specified name regex: '$NameRegexMatch' (default '.*')."

                            ++$Script:DeleteCount

                            Remove-Item -LiteralPath $Item.FullName @Script:WhatIfSplat

                        }

                        elseif ($Item.Name -match $NameRegexMatch) {

                            Write-Verbose ("Would have removed '$($Item.FullName
                                ) because it was modified more than $TotalMillisecondsBack ms ago and matches " + `
                                "the specified name regex> '$NameRegexMatch' (default '.*'), without -WhatIf in use.")

                            ++$Script:DeleteCount

                        }

                    }  

                }

                else {

                    Write-Warning -Message "Path '$TempInnerPath' doesn't exist. Skipping."

                }

                $Script:AlreadyProcessed[$TempInnerPath] = $True

            } # end of foreach $TempPath (processing $TempInnerPath)

        } # end of function

    }

    Process {

        if ($PSCmdlet.ParameterSetName -eq "Path") {
            $PathsToProcess = @($Path)
        }
        elseif ($PSCmdlet.ParameterSetName -eq "LiteralPath") {
            $PathsToProcess = @($LiteralPath)
        }

        foreach ($TempPath in $PathsToProcess) {
            $PathBeforeResolvePath = $TempPath
            Write-Verbose "Processing path '$PathBeforeResolvePath'."
            if ($PSCmdlet.ParameterSetName -eq "Path") {
                $TempPath = @(Resolve-Path -Path $TempPath |
                    Select-Object -ExpandProperty ProviderPath)
            }
            else {
                $TempPath = @(Resolve-Path -LiteralPath $TempPath |
                    Select-Object -ExpandProperty ProviderPath)
            }

            if ($null -eq $TempPath) {
                Write-Warning -Message "Couldn't resolve path '$PathBeforeResolvePath' or it doesn't exist. Skipped."
                continue
            }

            InnerProcessPath -Path $TempPath

        }

    }

    End {

        Write-Verbose "Total processed path count was: $Script:InnerProcessPathCounter"
        if ($WhatIf) {
            Write-Verbose "Would have attempted to delete $Script:DeleteCount files without -WhatIf in use."
        }
        else {
            Write-Verbose "Attempted to delete $Script:DeleteCount files."
        }

    }

}

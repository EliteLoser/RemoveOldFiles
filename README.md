# RemoveOldFiles

Use Svendsen Tech's `Remove-OldFiles` function to delete files based on date logic with time granularity ranging from milliseconds to months, and an optional file name regex filter.

Removes files that are "older" than the specified number of milliseconds,
seconds, minutes, hours, days, weeks or months - or a combination of any
of these, as calculated based on the "LastWriteTime" property returned from Get-Item, for determining "age". All the specified time units are added together.

Optional file name filtering with a regular expression, otherwise all files are targeted.

Optional recursion. Resolve-Path support that allows for directories for instance two levels deep with something like `-Path C:\foo\*\*`.

The times specified from ms to months are all cumulated and added together to
form a large decimal-typed millisecond number. Months are handled with .NET date
math as calendar months converted to milliseconds.

You can specify a `-NameRegexMatch` parameter to only target only file names
that match this regular expression. The default is simply `.*`.

This regex always matches, so name filtering is in effect not enabled by default unless you override with this
parameter. NB! It is not wildcards such as for the `-like` operator, but regular
expressions, such as for the `-match` operator, so make sure you test and know that the results are as expected. I plan to implement a 
`-NameWildcardMatch` parameter, but might put it off for years, knowing myself. Demand helps...

It supports -WhatIf in a non-proper implementation currently (but functionally not
too different, it was just a bit easier and also caused by a now gone, dead end in code).
I'm in two minds about changing it to the proper implementation, but will likely do it soon for
assumed broader acceptance of the code.

# Installation from the PowerShell Gallery

The module is published to the PowerShell Gallery, so you can install it with for instance this command for your user only:

`Install-Module -Name RemoveOldFiles -Scope CurrentUser #-Force`

Or you can download it with:

`Save-Module -Name RemoveOldFiles -Path C:\Scripts`

And inspect it first with:

`Find-Module -Name RemoveOldFiles | Format-List *`

# Examples

```

PS C:\temp\testdir> $mydir, "$mydir/1", "$mydir/1/2", "$mydir/1/2/3" | %{
    New-RandomData -Path $_ -BaseName keepThese -Extension .log -Count 3 `
    -Size 1024 -LineLength 128 }

PS C:\temp\testdir> $mydir, "$mydir/1", "$mydir/1/2", "$mydir/1/2/3" | %{
    New-RandomData -Path $_ -BaseName deletethese -Extension .tmp -Count 3 `
    -Size 1024 -LineLength 128 }

PS C:\temp\testdir> ipmo ..\RemoveOldFiles -Force

PS C:\temp\testdir> Remove-OldFiles -Path ., ./1/2 -WhatIf -Second 1
VERBOSE: Recorded 'now' time as: 2018-12-17 21:09:16
VERBOSE: Total milliseconds: 1000.
0 months.
0 weeks.
0 days.
0 hours.
0 minutes.
1 seconds.
0 milliseconds.
VERBOSE: Processing path '.'.
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1'.
VERBOSE: -Recurse parameter not specified, so directory 'C:\temp\testdir\1' is skipped.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData'.
VERBOSE: -Recurse parameter not specified, so directory 'C:\temp\testdir\RandomData' is skipped.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese1.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\deletethese1.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default '.*
'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese2.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\deletethese2.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default '.*
'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese3.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\deletethese3.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default '.*
'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese1.log'.
VERBOSE: Would have removed 'C:\temp\testdir\keepThese1.log because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default '.*')
, without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese2.log'.
VERBOSE: Would have removed 'C:\temp\testdir\keepThese2.log because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default '.*')
, without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese3.log'.
VERBOSE: Would have removed 'C:\temp\testdir\keepThese3.log because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default '.*')
, without -WhatIf in use.
VERBOSE: Processing path './1/2'.
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\1\2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3'.
VERBOSE: -Recurse parameter not specified, so directory 'C:\temp\testdir\1\2\3' is skipped.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese1.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\deletethese1.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default
 '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese2.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\deletethese2.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default
 '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese3.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\deletethese3.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default
 '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese1.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\keepThese1.log because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default '
.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese2.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\keepThese2.log because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default '
.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese3.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\keepThese3.log because it was modified more than 1000 ms ago and matches the specified name regex: '.*' (default '
.*'), without -WhatIf in use.
VERBOSE: Total processed path count was: 17
VERBOSE: Would have attempted to delete 12 files without -WhatIf in use.

PS C:\temp\testdir> Remove-OldFiles -Path ., ./1/2 -WhatIf -Second 1 -NameRegex '\.tmp$'
VERBOSE: Recorded 'now' time as: 2018-12-17 21:09:44
VERBOSE: Total milliseconds: 1000.
0 months.
0 weeks.
0 days.
0 hours.
0 minutes.
1 seconds.
0 milliseconds.
VERBOSE: Processing path '.'.
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1'.
VERBOSE: -Recurse parameter not specified, so directory 'C:\temp\testdir\1' is skipped.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData'.
VERBOSE: -Recurse parameter not specified, so directory 'C:\temp\testdir\RandomData' is skipped.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese1.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\deletethese1.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default
 '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese2.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\deletethese2.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default
 '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese3.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\deletethese3.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default
 '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese1.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese2.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese3.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: Processing path './1/2'.
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\1\2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3'.
VERBOSE: -Recurse parameter not specified, so directory 'C:\temp\testdir\1\2\3' is skipped.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese1.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\deletethese1.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (def
ault '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese2.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\deletethese2.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (def
ault '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese3.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\deletethese3.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (def
ault '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese1.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\2\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese2.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\2\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese3.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\2\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: Total processed path count was: 17
VERBOSE: Would have attempted to delete 6 files without -WhatIf in use.

PS C:\temp\testdir> Remove-OldFiles -Path . -WhatIf -Second 1 -NameRegex '\.tmp$' -Recurse
VERBOSE: Recorded 'now' time as: 2018-12-17 21:10:02
VERBOSE: Total milliseconds: 1000.
0 months.
0 weeks.
0 days.
0 hours.
0 minutes.
1 seconds.
0 milliseconds.
VERBOSE: Processing path '.'.
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2\3'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\deletethese1.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\3\deletethese1.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (d
efault '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\deletethese2.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\3\deletethese2.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (d
efault '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\deletethese3.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\3\deletethese3.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (d
efault '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\keepThese1.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\2\3\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\keepThese2.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\2\3\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\keepThese3.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\2\3\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese1.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\deletethese1.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (def
ault '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese2.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\deletethese2.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (def
ault '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese3.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\deletethese3.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (def
ault '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese1.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\2\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese2.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\2\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese3.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\2\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\deletethese1.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\deletethese1.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (defau
lt '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\deletethese2.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\deletethese2.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (defau
lt '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\deletethese3.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\1\deletethese3.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (defau
lt '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese1.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese2.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese3.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\1\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\RandomData'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\RandomData\1.2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2\RandomData.psd1'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\RandomData\1.2\RandomData.psd1' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2\RandomData.psm1'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\RandomData\1.2\RandomData.psm1' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese1.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\deletethese1.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default
 '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese2.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\deletethese2.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default
 '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese3.tmp'.
VERBOSE: Would have removed 'C:\temp\testdir\deletethese3.tmp because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default
 '.*'), without -WhatIf in use.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese1.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese2.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese3.log'.
VERBOSE: Ignoring. -WhatIf in use and file 'C:\temp\testdir\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: Total processed path count was: 32
VERBOSE: Would have attempted to delete 12 files without -WhatIf in use.

PS C:\temp\testdir> Remove-OldFiles -Path . -Second 1 -NameRegex '\.tmp$' -Recurse # do it
VERBOSE: Recorded 'now' time as: 2018-12-17 21:10:29
VERBOSE: Total milliseconds: 1000.
0 months.
0 weeks.
0 days.
0 hours.
0 minutes.
1 seconds.
0 milliseconds.
VERBOSE: Processing path '.'.
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2\3'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\deletethese1.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\3\deletethese1.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (defau
lt '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\deletethese2.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\3\deletethese2.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (defau
lt '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\deletethese3.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\3\deletethese3.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (defau
lt '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\3\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\3\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\3\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese1.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese1.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default
 '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese2.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese2.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default
 '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese3.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese3.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default
 '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\deletethese1.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\deletethese1.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default '
.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\deletethese2.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\deletethese2.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default '
.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\deletethese3.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\deletethese3.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default '
.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\RandomData'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\RandomData\1.2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2\RandomData.psd1'.
VERBOSE: Ignoring. File 'C:\temp\testdir\RandomData\1.2\RandomData.psd1' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2\RandomData.psm1'.
VERBOSE: Ignoring. File 'C:\temp\testdir\RandomData\1.2\RandomData.psm1' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese1.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\deletethese1.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default '.*
').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese2.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\deletethese2.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default '.*
').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\deletethese3.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\deletethese3.tmp' because it was modified more than 1000 ms ago and matches the specified name regex: '\.tmp$' (default '.*
').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: Total processed path count was: 32
VERBOSE: Attempted to delete 12 files.

PS C:\temp\testdir> # Attempted to delete 12 files

PS C:\temp\testdir> Remove-OldFiles -Path . -Second 1 -NameRegex '\.tmp$' -Recurse # do it
VERBOSE: Recorded 'now' time as: 2018-12-17 21:10:42
VERBOSE: Total milliseconds: 1000.
0 months.
0 weeks.
0 days.
0 hours.
0 minutes.
1 seconds.
0 milliseconds.
VERBOSE: Processing path '.'.
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2\3'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\3\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\3\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\3\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\RandomData'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\RandomData\1.2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2\RandomData.psd1'.
VERBOSE: Ignoring. File 'C:\temp\testdir\RandomData\1.2\RandomData.psd1' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2\RandomData.psm1'.
VERBOSE: Ignoring. File 'C:\temp\testdir\RandomData\1.2\RandomData.psm1' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: Total processed path count was: 20
VERBOSE: Attempted to delete 0 files.

PS C:\temp\testdir> # 0, so they were all successfully deleted

PS C:\temp\testdir> 
```

Examples of Resolve-Path support baked in, without `-Recurse`, to do directories only one and two levels deep:

```
PS C:\temp\testdir> Remove-OldFiles -Path ./*/* -Second 10 -NameRegexMatch '\.tmp$'
VERBOSE: Recorded 'now' time as: 2018-12-17 21:18:17
VERBOSE: Total milliseconds: 10000.
0 months.
0 weeks.
0 days.
0 hours.
0 minutes.
10 seconds.
0 milliseconds.
VERBOSE: Processing path './*/*'.
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\1\2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\3'.
VERBOSE: -Recurse parameter not specified, so directory 'C:\temp\testdir\1\2\3' is skipped.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese1.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese1.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$'
 (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese2.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese2.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$'
 (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\deletethese3.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese3.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$'
 (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\2\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\2\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\1\deletethese1.tmp'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\deletethese1.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\deletethese1.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$' (
default '.*').
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\1\deletethese2.tmp'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\deletethese2.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\deletethese2.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$' (
default '.*').
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\1\deletethese3.tmp'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\deletethese3.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\deletethese3.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$' (
default '.*').
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\1\keepThese1.log'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese1.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\keepThese1.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\1\keepThese2.log'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese2.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\keepThese2.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\1\keepThese3.log'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\1\keepThese3.log'.
VERBOSE: Ignoring. File 'C:\temp\testdir\1\keepThese3.log' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: In foreach $TempTempPath processing path 'C:\temp\testdir\RandomData\1.2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\RandomData\1.2'.
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2\RandomData.psd1'.
VERBOSE: Ignoring. File 'C:\temp\testdir\RandomData\1.2\RandomData.psd1' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in InnerProcessPath processing 'C:\temp\testdir\RandomData\1.2\RandomData.psm1'.
VERBOSE: Ignoring. File 'C:\temp\testdir\RandomData\1.2\RandomData.psm1' does not match the specified name regex: '\.tmp$' (default '.*').
VERBOSE: Total processed path count was: 17
VERBOSE: Attempted to delete 6 files.

PS C:\temp\testdir> 
```

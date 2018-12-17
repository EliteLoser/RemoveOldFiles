# RemoveOldFiles

Use Svendsen Tech's `Remove-OldFiles` function to delete files based on date logic with time granularity ranging from milliseconds to months, and an optional file name regex filter.

Removes files that are older than the specified number of milliseconds,
seconds, minutes, hours, days, weeks or months - or a combination of any
of these. They are cumulatively combined.
        
Optional file name filtering with a regular expression, otherwise all files are targeted.

The times specified from ms to months are all cumulated and added together to
form a large decimal-typed millisecond number. Months are handled with .NET date
math as calendar months converted to milliseconds.

You can specify a `-NameFilterRegex` parameter to only target only file names
that match this regular expression. The default is simply `.*`.

This regex always matches, so name filtering is in effect not enabled by default unless you override with this
parameter. NB! It is not wildcards such as for the `-like` operator, but regular
expressions, such as for the `-match` operator, so make sure you test and know that the results are as expected. I plan to implement a 
-NameFilterWildcard parameter, but might put it off for years, knowing myself. Demand helps...

It supports -WhatIf in a non-proper implementation currently (but functionally not
too different, it was just a bit easier and also caused by a now gone, dead end in code).
I'm in two minds about changing it to the proper implementation, but will likely do it soon for
assumed broader acceptance of the code.

# Examples

```
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

PS C:\temp\testdir> ipmo ..\RemoveOldFiles -Force

PS C:\temp\testdir> Remove-OldFiles -Path . -WhatIf -Minute 17 -Recurse
VERBOSE: Recorded 'now' time as: 2018-12-16 21:13:35
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
VERBOSE: Would have removed 'C:\temp\testdir\1\2\3\keepthese1.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), with
out -WhatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\keepthese2.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\3\keepthese2.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), with
out -WhatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3\keepthese3.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\3\keepthese3.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), with
out -WhatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese1.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\keepthese1.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), withou
t -WhatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese2.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\keepthese2.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), withou
t -WhatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese3.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\2\keepthese3.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), withou
t -WhatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese1.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\keepthese1.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), without 
-WhatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese2.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\keepthese2.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), without 
-WhatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese3.log'.
VERBOSE: Would have removed 'C:\temp\testdir\1\keepthese3.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), without 
-WhatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\keepthese1.log'.
VERBOSE: Would have removed 'C:\temp\testdir\keepthese1.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), without -W
hatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\keepthese2.log'.
VERBOSE: Would have removed 'C:\temp\testdir\keepthese2.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), without -W
hatIf in use.
VERBOSE: in foreach processing 'C:\temp\testdir\keepthese3.log'.
VERBOSE: Would have removed 'C:\temp\testdir\keepthese3.log because it was modified more than 1020000 ms ago and matches the specified name regex> '.*' (default '.*'), without -W
hatIf in use.
VERBOSE: Total processed path count was: 16
VERBOSE: Would have attempted to delete 12 files without -WhatIf in use.

PS C:\temp\testdir> Remove-OldFiles -Path . -Minute 17 -Recurse -NameRegexMatch '\.tmp$' 
VERBOSE: Recorded 'now' time as: 2018-12-16 21:13:41
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

PS C:\temp\testdir> 
```

Examples of Resolve-Path support baked in, without recurse, to do directories only one and two levels deep:

```
PS C:\temp\testdir> $mydir, "$mydir/1", "$mydir/1/2", "$mydir/1/2/3" | %{
    New-RandomData -Path $_ -BaseName deletethese -Extension .tmp -Count 3 `
    -Size 1024 -LineLength 128 }

PS C:\temp\testdir> Remove-OldFiles -Path ./*/*  -Minute 17 -NameRegexMatch '\.tmp$'
VERBOSE: Recorded 'now' time as: 2018-12-16 21:20:56
VERBOSE: Total milliseconds: 1020000.
0 months.
0 weeks.
0 days.
0 hours.
17 minutes.
0 seconds.
0 milliseconds.
VERBOSE: Processing path './*/*'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3'.
VERBOSE: -Recurse parameter not specified, so directory 'C:\temp\testdir\1\2\3' is skipped.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\deletethese1.tmp'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\deletethese2.tmp'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\deletethese3.tmp'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese1.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese2.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese3.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\deletethese1.tmp'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\deletethese2.tmp'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\deletethese3.tmp'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese1.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese2.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese3.log'.
VERBOSE: Total processed path count was: 14
VERBOSE: Attempted to delete 0 files.

PS C:\temp\testdir> Remove-OldFiles -Path ./*/*  -Second 10 -NameRegexMatch '\.tmp$'
VERBOSE: Recorded 'now' time as: 2018-12-16 21:21:45
VERBOSE: Total milliseconds: 10000.
0 months.
0 weeks.
0 days.
0 hours.
0 minutes.
10 seconds.
0 milliseconds.
VERBOSE: Processing path './*/*'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2'.
VERBOSE: Processing first level directory with path: 'C:\temp\testdir\1\2'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\3'.
VERBOSE: -Recurse parameter not specified, so directory 'C:\temp\testdir\1\2\3' is skipped.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\deletethese1.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese1.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\deletethese2.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese2.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\deletethese3.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\2\deletethese3.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese1.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese2.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\2\keepthese3.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\deletethese1.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\deletethese1.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in foreach processing 'C:\temp\testdir\1\deletethese2.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\deletethese2.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in foreach processing 'C:\temp\testdir\1\deletethese3.tmp'.
VERBOSE: Removing file 'C:\temp\testdir\1\deletethese3.tmp' because it was modified more than 10000 ms ago and matches the specified name regex: '\.tmp$' (default '.*').
VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese1.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese2.log'.
VERBOSE: in foreach processing 'C:\temp\testdir\1\keepthese3.log'.
VERBOSE: Total processed path count was: 14
VERBOSE: Attempted to delete 6 files.

PS C:\temp\testdir> dir -Recurse | % fullname
C:\temp\testdir\1
C:\temp\testdir\deletethese1.tmp
C:\temp\testdir\deletethese2.tmp
C:\temp\testdir\deletethese3.tmp
C:\temp\testdir\keepthese1.log
C:\temp\testdir\keepthese2.log
C:\temp\testdir\keepthese3.log
C:\temp\testdir\1\2
C:\temp\testdir\1\keepthese1.log
C:\temp\testdir\1\keepthese2.log
C:\temp\testdir\1\keepthese3.log
C:\temp\testdir\1\2\3
C:\temp\testdir\1\2\keepthese1.log
C:\temp\testdir\1\2\keepthese2.log
C:\temp\testdir\1\2\keepthese3.log
C:\temp\testdir\1\2\3\deletethese1.tmp
C:\temp\testdir\1\2\3\deletethese2.tmp
C:\temp\testdir\1\2\3\deletethese3.tmp
C:\temp\testdir\1\2\3\keepthese1.log
C:\temp\testdir\1\2\3\keepthese2.log
C:\temp\testdir\1\2\3\keepthese3.log

PS C:\temp\testdir> 
```

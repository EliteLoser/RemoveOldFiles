# RemoveOldFiles

Use Svendsen Tech's Remove-OldFiles function to delete files based on date logic ranging from milliseconds to months, and an optional file name regex filter

Examples:

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
#
# Module manifest for module 'RemoveFilesUsingDateLogic'
#
# Generated by: Joakim Borger Svendsen
#
# Generated on: 12/16/2018
# Last modified: 2021-01-15

@{

# Script module or binary module file associated with this manifest.
RootModule = 'RemoveOldFiles.psm1'

# Version number of this module. Semantic versioning.
ModuleVersion = '1.1.0'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '31f86c53-bff2-45a6-bf26-7eb3c33d98e2'

# Author of this module
Author = 'Joakim Borger Svendsen'

# Company or vendor of this module
CompanyName = 'Svendsen Tech'

# Copyright statement for this module
Copyright = '(c) 2018-present Joakim Borger Svendsen. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Use Svendsen Tech''s Remove-OldFiles function to delete files based on date logic (LastWriteTime file property) with time granularity ranging from milliseconds to months, and an optional file name regex filter. GitHub here: https://github.com/EliteLoser/RemoveOldFiles'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '2.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('Remove-OldFiles')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = @('RemoveOldFiles.psm1', 'RemoveOldFiles.psd1')

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('Files', 'Date', 'Old', 'Remove')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/EliteLoser/RemoveOldFiles/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/EliteLoser/RemoveOldFiles'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Account for the corner case of leap seconds by using .NET date math for all specified time units
* Documentation improvement.'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/EliteLoser/RemoveOldFiles'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

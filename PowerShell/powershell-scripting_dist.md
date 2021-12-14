<a name="powershell"></a>
# PowerShell

<a name="powershell-quick-access"></a>
## Quick Access

_Exam II_:

:arrow_right: [Writing PS OneLiners](#writing-ps-oneliners)  
:arrow_right: [Command Master Table](#command-master-table)  

---  

_Exam III_:

:arrow_right: [Code Snippets](#code-snippets)  
:arrow_right: [Script Development](#script-development)  
:arrow_right: [Script Template](#script-template)  

---
<br>

* [PowerShell](#powershell)
    * [Quick Access](#powershell-quick-access)
    * [Command Help](#powershell-command-help)
        * [`about_` pages](#powershell-command-help-about_-pages)
    * [Find Commands](#powershell-find-commands)
    * [Directory Navigation](#powershell-directory-navigation)
    * [Environment Variables - $env](#powershell-environment-variables-env)
    * [Syntax](#powershell-syntax)
        * [Named Parameter](#powershell-syntax-named-parameter)
        * [Switch Parameter](#powershell-syntax-switch-parameter)
        * [Position Parameter](#powershell-syntax-position-parameter)
        * [Common Parameters](#powershell-syntax-common-parameters)
        * [`-WhatIf`](#powershell-syntax-whatif)
        * [`-Confirm`](#powershell-syntax-confirm)
    * [Organize Output](#powershell-organize-output)
    * [Logical Operators](#powershell-logical-operators)
    * [Comparison Operators](#powershell-comparison-operators)
    * [Working with Objects](#powershell-working-with-objects)
        * [Object Mgmt](#powershell-working-with-objects-object-mgmt)
            * [Where-Object - Multi Conditions](#powershell-working-with-objects-object-mgmt-where-object-multi-conditions)
            * [Group-Object - Nested Foreach](#powershell-working-with-objects-object-mgmt-group-object-nested-foreach)
            * [ForEach-Object](#powershell-working-with-objects-object-mgmt-foreach-object)
        * [List Object Attributes](#powershell-working-with-objects-list-object-attributes)
        * [Inspect Objects](#powershell-working-with-objects-inspect-objects)
        * [Create Objects](#powershell-working-with-objects-create-objects)
        * [Export of Objects](#powershell-working-with-objects-export-of-objects)
        * [Parsing of Objects](#powershell-working-with-objects-parsing-of-objects)
    * [Enum](#powershell-enum)
    * [Regex](#powershell-regex)
    * [Variables](#powershell-variables)
    * [Array](#powershell-array)
    * [Services](#powershell-services)
    * [Processes](#powershell-processes)
    * [Event Logs](#powershell-event-logs)
    * [Convert File Size](#powershell-convert-file-size)
    * [SecureString - Credential Mgmt](#powershell-securestring-credential-mgmt)
        * [Create SecureString](#powershell-securestring-credential-mgmt-create-securestring)
        * [PSCredentials](#powershell-securestring-credential-mgmt-pscredentials)
    * [Pipeline](#powershell-pipeline)
        * [Best Practice](#powershell-pipeline-best-practice)
        * [Foreach Pipe](#powershell-pipeline-foreach-pipe)
    * [Pipe vs. Semicolon](#powershell-pipe-vs-semicolon)
    * [PSProviders](#powershell-psproviders)
    * [PSDrives](#powershell-psdrives)
    * [Items (PSProvider: all)](#powershell-items-psprovider-all)
    * [Files (PSProvider: `FileSystem`)](#powershell-files-psprovider-filesystem)
        * [Where File-Size](#powershell-files-psprovider-filesystem-where-file-size)
        * [Line, Word, Char count](#powershell-files-psprovider-filesystem-line-word-char-count)
    * [Aliases](#powershell-aliases)
        * [Find corresponding PS Cmdlet](#powershell-aliases-find-corresponding-ps-cmdlet)
    * [Command Master Table](#powershell-command-master-table)
* [Writing PS OneLiners](#writing-ps-oneliners)
    * [Tipps & Tricks](#writing-ps-oneliners-tipps-tricks)
* [Script Development](#script-development)
    * [Preparation](#script-development-preparation)
    * [Visual Studio Code Setup](#script-development-visual-studio-code-setup)
    * [Profiles](#script-development-profiles)
        * [Customize Prompt](#script-development-profiles-customize-prompt)
    * [Basics](#script-development-basics)
    * [Try Catch](#script-development-try-catch)
    * [Function](#script-development-function)
        * [Pipeline Params](#script-development-function-pipeline-params)
    * [Script Parameters](#script-development-script-parameters)
    * [Integrations](#script-development-integrations)
        * [Prepare Script](#script-development-integrations-prepare-script)
        * [Task Scheduler](#script-development-integrations-task-scheduler)
            * [The PowerShell Way](#script-development-integrations-task-scheduler-the-powershell-way)
    * [Documentation](#script-development-documentation)
    * [Testing](#script-development-testing)
    * [Code Snippets](#script-development-code-snippets)
        * [1\. Menu](#script-development-code-snippets-menu)
        * [2\. Event Logs](#script-development-code-snippets-event-logs-1)
        * [3\. XML DB](#script-development-code-snippets-xml-db)
* [Script Template](#script-template)


<a name="powershell-command-help"></a>
## Command Help

```powershell
<Cmdlet> -?

Get-Help <Cmdlet> [-ShowWindow]
```

```powershell
Update-Help
```
To download latest help from MS Docs

<a name="powershell-command-help-about_-pages"></a>
### <code>about_</code> pages

```powershell
# list all `about_` articles
Get-Help about_*

Get-Help about_CommonParameters
```

<a name="powershell-find-commands"></a>
## Find Commands

```powershell
Get-Command -Noun Acl
Get-Command -Verb Set
Get-Command -Module Azure.Storage
```

<a name="powershell-directory-navigation"></a>
## Directory Navigation

`$PSScriptRoot` - the folder containing the PowerShell script

- `Get-Location`
- `Set-Location`

<a name="powershell-environment-variables-env"></a>
## Environment Variables - $env

```powershell
# system env
Write-Host $env:PATH

# setting for process
$env:Z_TEST = $true
Write-Host $env:Z_TEST

# get all
Get-Item -Path "env:\"
```

<a name="powershell-syntax"></a>
## Syntax

```
Verb-Substantive [-Parameter [Value]]
```

|               |                                                     |
| ------------- | --------------------------------------------------- |
| `Verb`        | Get, Set, Write ...                                 |
| `Substantive` | Service, Object, EventLog ... - **always singular** |

<a name="powershell-syntax-named-parameter"></a>
### Named Parameter

```powershell
<Cmdlet> -Parameter Value

Get-Command -Noun "service"
```

<a name="powershell-syntax-switch-parameter"></a>
### Switch Parameter

```powershell
<Cmdlet> -Parameter

Get-ChildItem -Recurse
```

<a name="powershell-syntax-position-parameter"></a>
### Position Parameter

> :information_source: Use **named parameters** instead to avoid script bugs after changes on the core cmdlets done by MSFT

```powershell
<Cmdlet> -Parameter Value

Get-Process "powershell"
# = Get-Process -Name "powershell"
```

<a name="powershell-syntax-common-parameters"></a>
### Common Parameters

> `about_CommonParameters`

|                    |                                                                                                                                                                                                                                                              |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `-Verbose`         | The VERBOSE parameter overrides the value of the $VerbosePreference variable for the current command. Because the default value of the $VerbosePreference variable is SILENTLYCONTINUE, verbose messages aren't displayed by default.                        |
| `-Debug`           | Displays programmer-level detail about the operation done by the command. This parameter works only when the command generates a debugging message. For example, this parameter works when a command contains the Write-Debug cmdlet.                        |
| `-WarningAction`   | Determines how the cmdlet responds to a warning from the command. CONTINUE is the default value. This parameter works only when the command generates a warning message. For example, this parameter works when a command contains the Write-Warning cmdlet. |
| `-WarningVariable` | Stores warnings about the command in the specified variable.                                                                                                                                                                                                 |
| `-ErrorAction`     | Determines how the cmdlet responds to a non-terminating error from the command.                                                                                                                                                                              |
| `-ErrorVariable`   | ERRORVARIABLE stores error messages about the command in the specified variable :arrow_right: `about_Automatic_Variables`                                                                                                                                    |
| `-Confirm`         | The CONFIRM parameter overrides the value of the $ConfirmPreference variable for the current command. The default value is true. :arrow_right: `about_Preference_Variables`                                                                                  |
| `-OutVariable`     | Stores output objects from the command in the specified variable in addition to sending the output along the pipeline.                                                                                                                                       |

<br>

> 💡 Set any Common Parameter using the `$<CommonParameter>Preference` variable

<a name="powershell-syntax-whatif"></a>
### <code>-WhatIf</code>

> `-WhatIf` shows the effect of the command without executing it.

```powershell
New-Item -Type File -Name test.txt -WhatIf
```

Output: 

```
What if: Performing the operation "Create File" on target "Destination: C:\Users\vmadmin\test.txt".
```

<a name="powershell-syntax-confirm"></a>
### <code>-Confirm</code>

> Specify if a confirmation is needed

```powershell
Remove-Item .\folder\ -Recurse -Confirm:$false
```

<a name="powershell-organize-output"></a>
## Organize Output

- `Out-File`
- `Out-GridView` - Window with GridView
- `Out-Host` - std output
- `Out-Null` = /dev/null
- `Out-Printer`
- `Out-String`

<a name="powershell-logical-operators"></a>
## Logical Operators

PowerShell supports the following logical operators.

| Operator | Description                        | Example                    |
| -------- | ---------------------------------- | -------------------------- |
| `-and`   | Logical AND. TRUE when both        | `(1 -eq 1) -and (1 -eq 2)` |
|          | statements are TRUE.               | `False`                    |
| `-or`    | Logical OR. TRUE when either       | `(1 -eq 1) -or (1 -eq 2)`  |
|          | statement is TRUE.                 | `True`                     |
| `-xor`   | Logical EXCLUSIVE OR. TRUE when    | `(1 -eq 1) -xor (2 -eq 2)` |
|          | only one statement is TRUE         | `False`                    |
| `-not`   | Logical not. Negates the statement | `-not (1 -eq 1)`           |
|          | that follows.                      | `False`                    |
| `!`      | Same as `-not`                     | `!(1 -eq 1)`               |
|          |                                    | `False`                    |

Source: https://github.com/MicrosoftDocs/PowerShell-Docs/blob/staging/reference/7.1/Microsoft.PowerShell.Core/About/about_Logical_Operators.md?plain=1#L28

<a name="powershell-comparison-operators"></a>
## Comparison Operators

Comparison operators let you compare values or finding values that match
specified patterns. PowerShell includes the following comparison operators:

| Type        | Operator       | Comparison test                           |
| ----------- | -------------- | ----------------------------------------- |
| Equality    | `-eq`          | equals                                    |
|             | `-ne`          | not equals                                |
|             | `-gt`          | greater than                              |
|             | `-ge`          | greater than or equal                     |
|             | `-lt`          | less than                                 |
|             | `-le`          | less than or equal                        |
| Matching    | `-like`        | string matches wildcard pattern           |
|             | `-notlike`     | string does not match wildcard pattern    |
|             | `-match`       | string matches regex pattern              |
|             | `-notmatch`    | string does not match regex pattern       |
| Replacement | `-replace`     | replaces strings matching a regex pattern |
| Containment | `-contains`    | collection contains a value               |
|             | `-notcontains` | collection does not contain a value       |
|             | `-in`          | value is in a collection                  |
|             | `-notin`       | value is not in a collection              |
| Type        | `-is`          | both objects are the same type            |
|             | `-isnot`       | the objects are not the same type         |

**Case-Sentitive:** Prefix `-c` (e.g. `$_.ProcessName -cmatch "^W"`)  
**Case-Insensitive:** Prefix `-i` (e.g. `$_.ProcessName -imatch "^W"`)  

Source: https://github.com/MicrosoftDocs/PowerShell-Docs/blob/staging/reference/7.1/Microsoft.PowerShell.Core/About/about_Comparison_Operators.md?plain=1#L18

<a name="powershell-working-with-objects"></a>
## Working with Objects

null in PowerShell: `$null`

```powershell
# (object).Attribute
(Get-Service | Measure-Object).Count
```

<a name="powershell-working-with-objects-object-mgmt"></a>
### Object Mgmt

> `<Cmdlet> -Property`

- `Group-Object`
- `Measure-Object` - .Count, .Average, .Sum ...
- `Select-Object`
- `Sort-Object`
- `Tee-Object` [-FilePath] [-Variable]
- `Where-Object` [-Property] [-Value] [-Match]
  - `Where-Object -Property <Property> -Match "."` sort out objects with empty property
- `ForEach-Object`

<a name="powershell-working-with-objects-object-mgmt-where-object-multi-conditions"></a>
#### Where-Object - Multi Conditions

```powershell
# $_ = current item
# -> Never use $_ without attribute
Where-Object { $_.DisplayName -like "b*" -or $_.DisplayName -like "c*" }
```

<a name="powershell-working-with-objects-object-mgmt-group-object-nested-foreach"></a>
#### Group-Object - Nested Foreach

```powershell
Get-ChildItem -Path . | Group-Object -Property Extension | `
Foreach { Write-Host ("`nExtension: " + $_.Name + "`t - Occurrence: " + $_.Count); ` 
# foreach item in group
$_.Group | Foreach { Write-Host $_.FullName } }
```

<a name="powershell-working-with-objects-object-mgmt-foreach-object"></a>
#### ForEach-Object

```powershell
# <Cmdlet> | ForEach-Object -Process { ... }
Get-EventLog -LogName System -Newest 10 | `
ForEach-Object -Process { Write-Host ($_.TimeGenerated.ToString() + " -- " + $_.Message) }
```

<a name="powershell-working-with-objects-list-object-attributes"></a>
### List Object Attributes

```powershell
<Cmdlet> | Get-Member

Get-WinSystemLocale | Get-Member
```

Output:
```
   TypeName: System.Globalization.CultureInfo

Name                           MemberType Definition
----                           ---------- ----------
ClearCachedData                Method     void ClearCachedData()
Clone                          Method     System.Object Clone(), System.Object ICloneable.Clone()
Equals                         Method     bool Equals(System.Object value)
GetConsoleFallbackUICulture    Method     cultureinfo GetConsoleFallbackUICulture()
GetFormat                      Method     System.Object GetFormat(type formatType), System.Object IFormatProvider.GetF…
GetHashCode                    Method     int GetHashCode()
GetType                        Method     type GetType()
ToString                       Method     string ToString()
Calendar                       Property   System.Globalization.Calendar Calendar {get;}
CompareInfo                    Property   System.Globalization.CompareInfo CompareInfo {get;}
CultureTypes                   Property   System.Globalization.CultureTypes CultureTypes {get;}
DateTimeFormat                 Property   System.Globalization.DateTimeFormatInfo DateTimeFormat {get;set;}
DisplayName                    Property   string DisplayName {get;}
EnglishName                    Property   string EnglishName {get;}
IetfLanguageTag                Property   string IetfLanguageTag {get;}
IsNeutralCulture               Property   bool IsNeutralCulture {get;}
IsReadOnly                     Property   bool IsReadOnly {get;}
KeyboardLayoutId               Property   int KeyboardLayoutId {get;}
LCID                           Property   int LCID {get;}
Name                           Property   string Name {get;}
NativeName                     Property   string NativeName {get;}
NumberFormat                   Property   System.Globalization.NumberFormatInfo NumberFormat {get;set;}
OptionalCalendars              Property   System.Globalization.Calendar[] OptionalCalendars {get;}
Parent                         Property   cultureinfo Parent {get;}
TextInfo                       Property   System.Globalization.TextInfo TextInfo {get;}
ThreeLetterISOLanguageName     Property   string ThreeLetterISOLanguageName {get;}
ThreeLetterWindowsLanguageName Property   string ThreeLetterWindowsLanguageName {get;}
TwoLetterISOLanguageName       Property   string TwoLetterISOLanguageName {get;}
UseUserOverride                Property   bool UseUserOverride {get;}
```

<a name="powershell-working-with-objects-inspect-objects"></a>
### Inspect Objects

```powershell
# append Select-... to a pipe to inspect objects
Get-ChildItem -Path . | Select-Object -Property * -First 1
```

<a name="powershell-working-with-objects-create-objects"></a>
### Create Objects

```powershell
# Select-Object @{N="AttributeName";E={AttributeValue}}

# basic remapping:
Get-ChildItem -Path . | Select-Object @{N="MyAttribute";E={$_.Extension}},@{N="MyFileName";E={$_.Extension}},@{N="IsJson";E={$_.Extension -Like "*json"}}
```

<a name="powershell-working-with-objects-export-of-objects"></a>
### Export of Objects

> Cmdlets: `ConvertTo-`*

- `ConvertTo-Csv`
- `ConvertTo-Json`
- `ConvertTo-Xml` [-As String]

Addition: `ConvertTo-Html` [-As Table]

<a name="powershell-working-with-objects-parsing-of-objects"></a>
### Parsing of Objects

> Cmdlets: `ConvertFrom-`*

- `ConvertFrom-Csv`
  - semicolon separated: `-Delimiter ";"`
  - tabstop separated: ``-Delimiter "`t"``
- `ConvertFrom-Json`

Usage:

```powershell
Get-Content -Path .\data.json | ConvertFrom-Json
Get-Content -Path .\data.csv | ConvertFrom-Csv -Delimiter "`t"
```

Special Case `Xml`:

```powershell
[xml]$data = Get-Content -Path './data.xml'
```

<a name="powershell-enum"></a>
## Enum

Get all Enum Values: 

```powershell
[System.ServiceProcess.ServiceControllerStatus].GetEnumNames() # | Foreach { $_ }
```

<a name="powershell-regex"></a>
## Regex

```powershell
Get-Content -Path "c:\Windows\log.txt" | Select-String -Pattern ".*succeeded.*"
```

<a name="powershell-variables"></a>
## Variables

```powershell
# implicit:
$variable = "hello world"
# explicit:
[string] $str = "hello world"
# unset:
$str = $null

# variable in parameter:
# -> `Get-Help <Cmdlet> -Full` to see types of parameters
$color = [System.ConsoleColor]::Green
Write-Host "hello world" -ForegroundColor $color
```

Data-Types:

- `[int]`
- `[long]`
- `[string]`
- `[char]`
- `[byte]`
- `[bool]`
- `[decimal]`
- `[double]`
- `[xml]`
- `[array]`
- `[hashtable]`

<a name="powershell-array"></a>
## Array

```powershell
$array = @("hello","world")
$processes = @(Get-Process)

foreach ($item in $array) {
  New-Item -Type File -Name ($item + ".txt")
}
```

<a name="powershell-services"></a>
## Services

```powershell
Get-Service
Get-Service -Name "WSearch"
```

<a name="powershell-processes"></a>
## Processes

```powershell
Get-Process
Get-Process -Name "svchost"
```

<a name="powershell-event-logs"></a>
## Event Logs

```powershell
# get all event log types
Get-EventLog -List

# list events for log type: system
Get-EventLog -LogName System
```

<a name="powershell-convert-file-size"></a>
## Convert File Size

```powershell
$SpaceFree = (Get-PSDrive -Name "C").Free

Write-Host "Space Free in MB: $($SpaceFree / 1mb)mb"
Write-Host "Space Free in GB: $($SpaceFree / 1gb)gb"
Write-Host "Space Free in TB: $($SpaceFree / 1tb)tb"
```

<a name="powershell-securestring-credential-mgmt"></a>
## SecureString - Credential Mgmt

SecretStrings in PS can be used to store user passwords or so.  
**Attention: SecretString can be decrypted and is not one-way hashing**

<a name="powershell-securestring-credential-mgmt-create-securestring"></a>
### Create SecureString

> :heavy_exclamation_mark: when using `-AsPlainText` always append `-Force`

```powershell
$SecretOne = ConvertTo-SecureString -String "super secret" -AsPlainText -Force

$SecretTwo = Read-Host -AsSecureString
```

<a name="powershell-securestring-credential-mgmt-pscredentials"></a>
### PSCredentials

> :heavy_exclamation_mark: Do not store passwords in a script - use env variables

```powershell
$User = "Domain01\User01" # $env:DAEMON_USER
$Password = ConvertTo-SecureString -String "P@sSwOrd" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $Password
```

<a name="powershell-pipeline"></a>
## Pipeline

> :heavy_exclamation_mark: PowerShell passes **objects** through pipelines and not character streams as in Linux

<a name="powershell-pipeline-best-practice"></a>
### Best Practice

- Always do as much as possible using the Cmdlets
  - :thumbsdown: `Get-Process -Name explorer | Stop-Process`
  - **instead:** `Stop-Process -Name explorer`
- If possible store the return value of the Cmdlet and reuse it in another code-line
  - makes it more maintainable & testable

<a name="powershell-pipeline-foreach-pipe"></a>
### Foreach Pipe

```powershell
# $_ = current item
Get-ChildItem -Path . | Foreach { Write-Host $_.Name "`tlast accessed:" $_.LastAccessTimeUtc }
```

<a name="powershell-pipe-vs-semicolon"></a>
## Pipe vs. Semicolon

|               |                                                       |
| ------------- | ----------------------------------------------------- |
| Pipe `\|`     | **Pass an object** from one Cmdlet to another         |
| Semicolon `;` | **Run Cmdlet after** the previous - command separators |

Example:
```powershell
New-Item -Path file.ts | Invoke-Item

New-Item -Path file.ts ; Invoke-Item -Path file.ts
```

<a name="powershell-psproviders"></a>
## PSProviders

:arrow_right: `Get-PSProvider`

```
Name                 Capabilities                          Drives
----                 ------------                          ------
Registry             ShouldProcess, Transactions           {HKLM, HKCU}
Alias                ShouldProcess                         {Alias}
Environment          ShouldProcess                         {Env}
FileSystem           Filter, ShouldProcess, Credentials    {C, D}
Function             ShouldProcess                         {Function}
Variable             ShouldProcess                         {Variable}
Certificate          ShouldProcess                         {Cert}
WSMan                Credentials                           {WSMan}
```

Use the `Drives` as prefix in `-Path` parameters (e.g. `Env:\PATH`)

<br>

```powershell
Get-Item -Path "C:\temp\file.txt"
Get-Item -Path "Env:\PATH"

# for registry use:
Get-ItemProperty -Path "HKCU:\Control Panel\Colors\" -Name "Menu"
Get-ItemProperty -Path "HKLM:\SYSTEM\State\DateTime\" -Name "NTP Enabled"

New-Item -Path "HKCU:\UpdateStatus"
New-ItemProperty -Path "HKCU:\UpdateStatus" -Name "UpdateSuccessful" -Value 1
Remove-ItemProperty -Path "HKCU:\UpdateStatus" -Name "UpdateSuccessful" -Force
```

<a name="powershell-psdrives"></a>
## PSDrives

Get all available physical & virtual filesystems:

```powershell
Get-PSDrive
```

All drive's name are also valid PSProviders

@see: `New-PSDrive`, `Remove-PSDrive`

```powershell
New-PSDrive -Name "user" -Root $env:USERPROFILE -PSProvider FileSystem

Remove-PSDrive -Name "user" -Force
```

<a name="powershell-items-psprovider-all"></a>
## Items (PSProvider: all)

for read protected items: `-Force`

- `Get-Item`
- `Get-ChildItem` [-Recurse]
  - bash: `ls`
- `Get-ItemProperty`
- `Set-Item`
  - for files: `New-Item`
- `Set-ItemProperty`
- `Clear-Item` delete item's content
- `Clear-ItemProperty`
- `Copy-Item`
  - bash: `cp`
- `Copy-ItemProperty`
- `Invoke-Item` open file with associated default app
  - bash: `open`
- `Move-Item`
  - bash: `mv`
- `Move-ItemProperty`
- `New-Item` [-Path] [-ItemType]
  - bash: `touch` ; `>>`
- `New-ItemProperty`
- `Remove-Item`
  - bash: `rm`
- `Remove-ItemProperty`
- `Rename-Item`
  - bash: `mv`
- `Rename-ItemProperty`


<a name="powershell-files-psprovider-filesystem"></a>
## Files (PSProvider: <code>FileSystem</code>)

- `Add-Content`
- `Clear-Content`
- `Get-Content`
- `Set-Content`


<a name="powershell-files-psprovider-filesystem-where-file-size"></a>
### Where File-Size

```powershell
Get-ChildItem -Path . | Where-Object -Property Length -GT 1kb # 1mb / 1gb
```

<a name="powershell-files-psprovider-filesystem-line-word-char-count"></a>
### Line, Word, Char count

```powershell
Get-Content -Path "c:\Windows\log.txt" | Measure-Object -Line -Word -Character
```

<a name="powershell-aliases"></a>
## Aliases

> :information_source: PowerShell does not support parameters in aliases

Key-Concept:

- `gal` --> `Get-Alias`
- only for process specified
  - else `Import-Alias` / `Export-Alias`

Commands:

- `Get-Alias`
- `Set-Alias`
- `New-Alias` will throw exception if alias already exists
- `Export-Alias`
- `Import-Alias`
- `Remove-Item -Path Alias:\gal -Force` to delete an alias

<a name="powershell-aliases-find-corresponding-ps-cmdlet"></a>
### Find corresponding PS Cmdlet

Output will display the help of the corresponding PS Cmdlet.

```powershell
dir -?
```

<a name="powershell-command-master-table"></a>
## Command Master Table

| Command              | Purpose                    |
| -------------------- | -------------------------- |
| `Get-History`        | list command history       |
| `Get-NetIPAddress`   | get ipconfig               |
| `Get-Module`         | show local PS modules      |
| `Get-Process`        | get all processes          |
| `Get-Service`        | get all services           |
| `Get-EventLog`       | get all event logs         |
| `Test-Connection`    | ping a computer            |
| `Test-NetConnection` | ping using a specific port |
| `Test-Path`          | test if item exists        |
| `Invoke-Item`        | open file with default app |
| `Invoke-WebRequest`  | get & post content to url  |
| `Start-Sleep`        | pause script               |
| `Start-Job`          | run script as job in bg    |
| `Get-Job`            | get all script jobs        |
|                      |                            |

:arrow_right: [Finding Commands](#find-commands)

<a name="writing-ps-oneliners"></a>
# Writing PS OneLiners

1. Search (next) Cmdlet :arrow_right: [find-commands](#find-commands)
2. Write Cmdlet with Parameters :arrow_right: [parameters](#named-parameter)
3. Inspect Out-Object :arrow_right: [inspect-objects](#inspect-objects)  
   `<Cmdlet> | Get-Member`  
   _or_  
   `<Cmdlet> | Select-Object -Property * -First 1`
4. _Do i have all required data in an object?_
   1. **Yes:** `Foreach { # do stuff with $_ }`
   2. **Nope:** :arrow_right: continue with **1.**

<a name="writing-ps-oneliners-tipps-tricks"></a>
## Tipps &amp; Tricks

1. Write on multiple lines using ` sign

```powershell
Get-Service -Name "gupdate" | ` # <= here
Select-Object -Property DisplayName, Status | ` # <= and here
Out-File -FilePath "google-update-service.txt"
```

2. Continue on Error `-ErrorAction SilentlyContinue`

if a cmdlet in a pipe failed, the pipeline wouldn't continue.  
some errors, such as folder exists, can be safely ignored by appending the common parameter `-ErrorAction`.

```powershell
New-Item -Path ./existing-folder -ItemType Directory -ErrorAction SilentlyContinue | Write-Host "folder created"
```

3. Parameter with calculated props

```powershell
# won't work:
New-Item -Path "file" + $_.Extension 

# solution:
New-Item -Path ("file" + $_.Extension)
```

<a name="script-development"></a>
# Script Development

<a name="script-development-preparation"></a>
## Preparation

In order to run scripts on your machine, you have to enable 

```powershell
Get-ExecutionPolicy -List

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
# alternatively:
powershell.exe -ExecutionPolicy Bypass -File ./my-script.ps1
```

<a name="script-development-visual-studio-code-setup"></a>
## Visual Studio Code Setup

VS Code recommendations for PowerShell:

File: `.vscode/settings.json`
```jsonc
{
    "files.insertFinalNewline": true,
    "pasteImage.path": "${currentFileDir}/files",
    "pasteImage.showFilePathConfirmInputBox": true,

    //#region PowerShell & Linter
    "powershell.codeFolding.enable": true,
    "powershell.codeFolding.showLastLine": true,
    "powershell.codeFormatting.addWhitespaceAroundPipe": true,
    "powershell.codeFormatting.alignPropertyValuePairs": true,
    "powershell.codeFormatting.autoCorrectAliases": true,
    "powershell.codeFormatting.ignoreOneLineBlock": false,
    "powershell.codeFormatting.pipelineIndentationStyle": "IncreaseIndentationForFirstPipeline",
    "powershell.codeFormatting.trimWhitespaceAroundPipe": true,
    "powershell.codeFormatting.useConstantStrings": true,
    "powershell.codeFormatting.useCorrectCasing": true,
    "powershell.codeFormatting.whitespaceBetweenParameters": true,
    "powershell.codeFormatting.newLineAfterCloseBrace": true,
    "powershell.codeFormatting.newLineAfterOpenBrace": true,
    "powershell.codeFormatting.openBraceOnSameLine": true,
    // @see: https://github.com/PoshCode/PowerShellPracticeAndStyle/issues/81
    "powershell.codeFormatting.preset": "OTBS",
    "powershell.codeFormatting.whitespaceAfterSeparator": true,
    "powershell.codeFormatting.whitespaceAroundOperator": true,
    "powershell.codeFormatting.whitespaceBeforeOpenBrace": true,
    "powershell.codeFormatting.whitespaceBeforeOpenParen": true,
    "powershell.codeFormatting.whitespaceInsideBrace": true,
    // when writing modules & classes, else comment out ↓↓↓
    "powershell.debugging.createTemporaryIntegratedConsole": true,
    "powershell.helpCompletion": "BlockComment",
    "powershell.promptToUpdatePackageManagement": false,
    "powershell.promptToUpdatePowerShell": false,
    "powershell.scriptAnalysis.enable": true,
    "powershell.sideBar.CommandExplorerVisibility": true,
    "powershell.startAutomatically": true,
    "powershell.useX86Host": false,
    "powershell.integratedConsole.suppressStartupBanner": true,
    "powershell.integratedConsole.showOnStartup": true,
    "powershell.powerShellDefaultVersion": "Windows PowerShell (x64)",
    //#endregion PowerShell & Linter
}

```

File: `.vscode/launch.json`
```jsonc
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "PowerShell: Launch Current File",
            "type": "PowerShell",
            "request": "launch",
            "script": "${file}",
            "cwd": "${file}"
        }
    ]
}

```

<a name="script-development-profiles"></a>
## Profiles

The profile file get's executed every time PS is started.

```powershell
$PROFILE | Select-Object -Property *
```

:arrow_right: CurrentHost: only for `$Host` (e.g. only PS ConsoleHost)  
:arrow_right: AllHosts: (e.g. PS ConsoleHost & PS ISE & VS Package Manager Console)

<a name="script-development-profiles-customize-prompt"></a>
### Customize Prompt

:arrow_right: `about_Prompts`

```powershell
function Prompt { <function_body> }
```

<a name="script-development-basics"></a>
## Basics

```powershell
# get all variables
Get-ChildItem Variable:

# Exit-Codes:
exit 1;
$? # => 1

# Exceptions:
throw "Can't do this ;)"
$Error[0] # => Exception: Can't do this ;)

# User Home:
$HOME
```

:arrow_right: [Variables](#variables)  
:arrow_right: [Array](#array)

Example:

```powershell
$ErrorActionPreference = "Stop";
$RandomNumber = Get-Random -Minimum 0 -Maximum 10;

do {
  $Input = Read-Host -Prompt "Enter Number";
} while ($Input -ne $RandomNumber);

Write-Host "You guessed it 🥳 The number is $RandomNumber" -ForegroundColor Green;
```

<a name="script-development-try-catch"></a>
## Try Catch

```powershell
$ErrorActionPreference = "Stop";

try {
  Get-ChildItem C:\nonExistingFolder
} catch [Exception] {
  Write-Host "caught"
}
```

<a name="script-development-function"></a>
## Function

:arrow_right: `about_Functions`  
:arrow_right: `about_Functions_Advanced_Parameters`  

```powershell
# verb: according to `Get-Verb`
function Verb-Noun {
    # do stuff
}

function Test-Function {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Text,
        [Parameter()]
        [string[]]$Actions = @("nothing"),
        # switch param
        [Parameter()]
        [switch]$Force, # $true when provided
        # positional param
        [Parameter(Position=0, Mandatory=$true)]
        [int]$Position
    )
  
    Write-Host "Position: $Position"
    Write-Host "Text: $Text"
    Write-Host "Actions: $Actions"
    Write-Host "Force: $Force"
}

Test-Function 1 -Text "hello world" -Force
Test-Function 2 -Text "hello world" -Actions @("shutdown", "restart") -Force
```

<a name="script-development-function-pipeline-params"></a>
### Pipeline Params

Only single object can be passed as pipeline.

```powershell
# Get-ChildItem -Path ./README.md | Test-PipelineObject
# Output: `README.md_staff`
function Test-PipelineObject {
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline)]
        $Object
    )

    Write-Host "$($Object.Name)_$($Object.Group)"
}

# Get-ChildItem -Path ./README.md | Test-PipelineSingleProperty
# Output: `170`
function Test-PipelineSingleProperty {
    param(
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName)]
        $Size
    )
    
    Write-Host $Size
}
```

<a name="script-development-script-parameters"></a>
## Script Parameters

On the top of the script:
```powershell
[CmdletBinding()]
param (
    [Parameter()]
    [string]$ParameterName
)
```

:arrow_right: same concept as [Function](#Function)

<a name="script-development-integrations"></a>
## Integrations

<a name="script-development-integrations-prepare-script"></a>
### Prepare Script

- Set proper **Exit-Codes** in the code
  - _Exit-Codes will be visible in the Task Scheduler_
  - Success: `exit 0`
  - Error: `exit 1`
- In PROD Mode: do not pause script :exclamation:

<a name="script-development-integrations-task-scheduler"></a>
### Task Scheduler

1. Start "Computer Management"
2. Select "Task Scheduler"
3. [Create a new task folder]
    - "New Folder" in Task Scheduler Library
4. "Create New Task..."
    - Add Trigger
    - Add Action
      - Program: `powershell.exe`
      - Arguments: `-File "c:\Windows\Automation\script.ps1" -ExecutionPolicy Bypass`
5. Enable Task History
    - "Enable All Tasks History" in Folder Properties
6. Run the task & check
    - Have a look at: 
      - Exit-Code
      - History

:bug: Debugging & Testing: `Read-Host`

<a name="script-development-integrations-task-scheduler-the-powershell-way"></a>
#### The PowerShell Way

Module: `ScheduledTasks`

```powershell
Get-Command -Module ScheduledTasks
```

How To:

```powershell
$Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-File "C:\MyScript.ps1" -ExecutionPolicy Bypass'
$Trigger = New-ScheduledTaskTrigger -Once -At 3am
$Settings = New-ScheduledTaskSettingsSet
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings

Register-ScheduledTask -TaskName 'My PowerShell Script' -TaskPath "PS_TEST" -InputObject $Task [-User 'User' -Password 'Password']
```

<a name="script-development-documentation"></a>
## Documentation

:arrow_right: using block comments

:arrow_right: in VSCode type `##` - (**below** function header & inside of function)

:arrow_right: in VSCode type `comment-help` (on top of script)


```powershell
<#
.SYNOPSIS
    Get PC Data
.DESCRIPTION
    Get informations about your PC:
    - username
    - disk size
    - network interfaces
.EXAMPLE
    PS C:\> ./pc-data.ps1
    Will run the script
.INPUTS
    None
.OUTPUTS
    None
.NOTES
    An interactive CLI
.LINK
    Get-PSDrive
    Get-NetIPAddress
#>

function Test-Function {
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .PARAMETER ComputerName
    Parameter description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    param (
        [Parameter(Mandatory = $true)]
        [string]$ComputerName
    )
    
    Write-Host $ComputerName
}
```

<a name="script-development-testing"></a>
## Testing
  
- `White-Box Test`: Debugger, line by line
- `Black-Box Test`: Unit Tests (asserts)
- `Component Test`: Test only one component
- `Integration Test`: Test integration of one component with the whole architecture 

:arrow_right: Writing test cases: _Dossier DW122 S. 10_

<a name="script-development-code-snippets"></a>
## Code Snippets

<a name="script-development-code-snippets-menu"></a>
### 1. Menu

```powershell
<#
.SYNOPSIS
    Get PC Data
.DESCRIPTION
    Get informations about your PC:
    - username
    - disk size
    - network interfaces
.EXAMPLE
    PS C:\> ./pc-data.ps1
    Will run the script
.INPUTS
    None
.OUTPUTS
    None
.NOTES
    An interactive CLI
.LINK
    Get-PSDrive
    Get-NetIPAddress
#>

$ErrorActionPreference = 'Stop'

Write-Host '*** Willkommen beim Anzeigen von Informationen ***'

do {

    Write-Host
    Write-Host '[1] Aktueller Benutzername'
    Write-Host '[2] Grösse der Festplatte in GByte mit belegtem und freiem Platz'
    Write-Host '[3] Daten der Netzwerkkarten mit IP-Adresse'
    Write-Host '[0] Menü verlassen'

    $Action = Read-Host

    switch ($Action) {
        0 { 
            Write-Host 'Das Programm wird beendet.'
        }
        1 { 
            Write-Host "Der Benutzername lautet '$($env:USERNAME)'."
        }
        2 { 
            $DriveLetter = 'C'
            $Drive = Get-PSDrive -Name $DriveLetter
            Write-Host "Die Festplatte 'C:\' ist $(($Drive.Used + $Drive.Free) / 1gb) GBytes gross, hat $($Drive.Used / 1gb) GBytes belegt und $($Drive.Free / 1gb) GBytes freien Platz."
        }
        3 { 
            Get-NetIPAddress | Where-Object -Property IPAddress -Match '.+' | Select-Object -Property ifIndex, IPAddress, PrefixLength, PrefixOrigin
        }
        Default {
            Write-Host 'Geben Sie einen zulässigen Wert ein.' -ForegroundColor Red
        }
    }

} while ($Action -ne 0);

```

<a name="script-development-code-snippets-event-logs-1"></a>
### 2. Event Logs

```powershell
<#
.SYNOPSIS
    Analyze Event Log
.DESCRIPTION
    Get the todays 5 recent events from system event logs
.EXAMPLE
    PS C:\> ./event-log.ps1
    Explanation of what the example does
.INPUTS
    None
.OUTPUTS
    None
.NOTES
    is an interactive cli
#>

$ErrorActionPreference = 'Stop'

do {
    $DefaultPath = 'C:\M122\event'
    $OutPath = Read-Host "Where to save the file [$($DefaultPath)]"
    # take default
    if ($OutPath -eq '') {
        $OutPath = $DefaultPath
        New-Item -ItemType Directory -Path $DefaultPath -Force | Out-Null 
    }
} while (!(Test-Path -Path $OutPath -PathType Container)); # check for folder (container)

$FilePath = ($OutPath + '/' + 'eventoutput.html')

Get-EventLog -LogName System | `
        Where-Object { $_.TimeGenerated -ge [DateTime]::Today } | `
        Sort-Object -Property TimeGenerated | `
        Select-Object -Property TimeGenerated, Index, Message -First 5 | `
        ConvertTo-Html -As Table -Title 'Events' | Out-File -PSPath $FilePath -Force
 
Invoke-Item -Path $FilePath

```

<a name="script-development-code-snippets-xml-db"></a>
### 3. XML DB

```powershell
<#
.SYNOPSIS
    XML Db analyzer
.DESCRIPTION
    Analyse the nordwind products db using powershell
.EXAMPLE
    PS C:\> ./xml-db.ps1
    Run the analyzer
.INPUTS
    None
.OUTPUTS
    None
.NOTES
    has no user input
.LINK
    Select-Object
    Group-Object
    Sort-Object
#>

$ErrorActionPreference = 'Stop'

try {
    [xml]$data = Get-Content -Path .\data\Nordwind_Artikel.xml
} catch [Exception] {
    Write-Host 'ERROR: could not load xml. check file & format!'
    exit 1
}

# IMPORTANT: Format-Table

# 1)
# important: [int]
Write-Host 'Most In Stock:'
$data.db.Artikel | Sort-Object { [int]$_.Lagerbestand } | Select-Object -Last 1 | Format-Table
Write-Host

# 2)
Write-Host 'Count Suppliers:'
$data.db.Artikel | Group-Object -Property 'Lieferanten-Nr' | Measure-Object | Select-Object -Property Count | Format-Table
Write-Host

# 3)
Write-Host 'Categories:'
$data.db.Artikel | Group-Object -Property 'Kategorie-Nr' | Select-Object -Property Count, Name | Format-Table
Write-Host

# 4)
# important: -imatch
Write-Host 'Search Articles:'
$SearchString = 'bier'
$data.db.Artikel | Where-Object { [string]$_.Artikelname -imatch $SearchString } | Format-Table
Write-Host

# 5)
Write-Host 'Delivery Units:'
# important: | Format-Table
$data.db.Artikel | Group-Object -Property Liefereinheit | Select-Object -Property Name | Format-Table
Write-Host

# 6)
Write-Host 'Sum Price in Category:'
# important: Select-Object PropOne, @{N='PropTwo';E={ 1 }}
$CategoriesPriceSum = $data.db.Artikel | Group-Object -Property 'Kategorie-Nr' | Select-Object Name, @{N = 'SumOfCategorie'; E = { ($_.Group | Measure-Object -Property 'Einzelpreis' -Sum).Sum } }
$CategoriesPriceSum | Format-Table
Write-Host

# 7)
Write-Host 'Category with smallest Sum:'
$CategoriesPriceSum | Sort-Object -Property SumOfCategorie | Select-Object -First 1 | Format-Table

```

<a name="script-template"></a>
# Script Template

```powershell
#!/usr/bin/env pwsh

<#
    .SYNOPSIS

    Adds a file name extension to a supplied name.

    .DESCRIPTION

    Adds a file name extension to a supplied name.
    Takes any strings for the file name or extension.

    .PARAMETER Name
    Specifies the file name.

    .PARAMETER Extension
    Specifies the extension. "Txt" is the default.

    .INPUTS

    None. You cannot pipe objects to Add-Extension.

    .OUTPUTS

    System.String. Add-Extension returns a string with the extension
    or file name.

    .EXAMPLE

    PS> extension -name "File"
    File.txt

    .EXAMPLE

    PS> extension -name "File" -extension "doc"
    File.doc

    .EXAMPLE

    PS> extension "File" "doc"
    File.doc

    .LINK

    http://www.fabrikam.com/extension.html

    .LINK

    Set-Item
#>

$ErrorActionPreference = 'Stop';

#region Functions

function Test-IsAdministrator {
    $UserWindowsPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent());
    return $UserWindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
}

function Test-IsWindowsPowershell {
    return ($PSVersionTable.PSEdition -eq 'Desktop');
}

#endregion Functions

#region Script prechecks

if (-not (Test-IsWindowsPowershell)) {
    Write-Host 'ERROR: run script with Windows PowerShell.' -ForegroundColor Red;
    Write-Host 'ERROR: PowerShell Core is not supported' -ForegroundColor Red;
    exit 1;
}

if (-not (Test-IsAdministrator)) {
    Write-Host 'ERROR: run script as administrator' -ForegroundColor Red;
    exit 1;
}

#endregion Script prechecks

#region Main Code

Write-Host 'hello world 🥳'

#endregion Main Code


```

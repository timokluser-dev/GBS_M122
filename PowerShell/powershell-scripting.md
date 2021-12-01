# PowerShell

## Quick Access

:arrow_right: [Writing PS OneLiners](#writing-ps-oneliners)  
:arrow_right: [Command Master Table](#command-master-table)

---
<br>

{"gitdown": "contents", "maxLevel": 9}

## Command Help

```powershell
<Cmdlet> -?

Get-Help <Cmdlet> [-ShowWindow]
```

```powershell
Update-Help
```
To download latest help from MS Docs

### `about_` pages

```powershell
# list all `about_` articles
Get-Help about_*

Get-Help about_CommonParameters
```

## Find Commands

```powershell
Get-Command -Noun Acl
Get-Command -Verb Set
Get-Command -Module Azure.Storage
```

## Directory Navigation

`$PSScriptRoot` - the folder containing the PowerShell script

- `Get-Location`
- `Set-Location`

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

## Syntax

```
Verb-Substantive [-Parameter [Value]]
```

|               |                                                     |
| ------------- | --------------------------------------------------- |
| `Verb`        | Get, Set, Write ...                                 |
| `Substantive` | Service, Object, EventLog ... - **always singular** |

### Named Parameter

```powershell
<Cmdlet> -Parameter Value

Get-Command -Noun "service"
```

### Switch Parameter

```powershell
<Cmdlet> -Parameter

Get-ChildItem -Recurse
```

### Position Parameter

> :information_source: Use **named parameters** instead to avoid script bugs after changes on the core cmdlets done by MSFT

```powershell
<Cmdlet> -Parameter Value

Get-Process "powershell"
# = Get-Process -Name "powershell"
```

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

### `-WhatIf`

> `-WhatIf` shows the effect of the command without executing it.

```powershell
New-Item -Type File -Name test.txt -WhatIf
```

Output: 

```
What if: Performing the operation "Create File" on target "Destination: C:\Users\vmadmin\test.txt".
```

### `-Confirm`

> Specify if a confirmation is needed

```powershell
Remove-Item .\folder\ -Recurse -Confirm:$false
```

## Organize Output

- `Out-File`
- `Out-GridView` - Window with GridView
- `Out-Host` - std output
- `Out-Null` = /dev/null
- `Out-Printer`
- `Out-String`

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

**Case-Sentitive:** Prefix `-c` (e.g. `$_.ProcessName -cmatch "^W"`)  
**Case-Insensitive:** Prefix `-i` (e.g. `$_.ProcessName -imatch "^W"`)  

Source: https://github.com/MicrosoftDocs/PowerShell-Docs/blob/staging/reference/7.1/Microsoft.PowerShell.Core/About/about_Logical_Operators.md?plain=1#L28

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

Source: https://github.com/MicrosoftDocs/PowerShell-Docs/blob/staging/reference/7.1/Microsoft.PowerShell.Core/About/about_Comparison_Operators.md?plain=1#L18

## Working with Objects

null in PowerShell: `$null`

```powershell
# (object).Attribute
(Get-Service | Measure-Object).Count
```

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

#### Where-Object - Multi Conditions

```powershell
# $_ = current item
# -> Never use $_ without attribute
Where-Object { $_.DisplayName -like "b*" -or $_.DisplayName -like "c*" }
```

#### Group-Object - Nested Foreach

```powershell
Get-ChildItem -Path . | Group-Object -Property Extension | `
Foreach { Write-Host ("`nExtension: " + $_.Name + "`t - Occurrence: " + $_.Count); ` 
# foreach item in group
$_.Group | Foreach { Write-Host $_.FullName } }
```

#### ForEach-Object

```powershell
# <Cmdlet> | ForEach-Object -Process { ... }
Get-EventLog -LogName System -Newest 10 | `
ForEach-Object -Process { Write-Host ($_.TimeGenerated.ToString() + " -- " + $_.Message) }
```

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

### Inspect Objects

```powershell
# append Select-... to a pipe to inspect objects
Get-ChildItem -Path . | Select-Object -Property * -First 1
```

### Create Objects

```powershell
# Select-Object @{N="AttributeName";E={AttributeValue}}

# basic remapping:
Get-ChildItem -Path . | Select-Object @{N="MyAttribute";E={$_.Extension}},@{N="MyFileName";E={$_.Extension}},@{N="IsJson";E={$_.Extension -Like "*json"}}
```

### Export of Objects

> Cmdlets: `ConvertTo-`*

- `ConvertTo-Csv`
- `ConvertTo-Json`
- `ConvertTo-Xml` [-As String]

Addition: `ConvertTo-Html` [-As Table]

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

## Enum

Get all Enum Values: 

```powershell
[System.ServiceProcess.ServiceControllerStatus].GetEnumNames() # | Foreach { $_ }
```

## Regex

```powershell
Get-Content -Path "c:\Windows\log.txt" | Select-String -Pattern ".*succeeded.*"
```

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

## Array

```powershell
$array = @("hello","world")
$processes = @(Get-Process)

foreach ($item in $array) {
  New-Item -Type File -Name ($item + ".txt")
}
```

## SecureString - Credential Mgmt

SecretStrings in PS can be used to store user passwords or so.  
**Attention: SecretString can be decrypted and is not one-way hashing**

### Create SecureString

> :heavy_exclamation_mark: when using `-AsPlainText` always append `-Force`

```powershell
$SecretOne = ConvertTo-SecureString -String "super secret" -AsPlainText -Force

$SecretTwo = Read-Host -AsSecureString
```

### PSCredentials

> :heavy_exclamation_mark: Do not store passwords in a script - use env variables

```powershell
$User = "Domain01\User01" # $env:DAEMON_USER
$Password = ConvertTo-SecureString -String "P@sSwOrd" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $Password
```

## Pipeline

> :heavy_exclamation_mark: PowerShell passes **objects** through pipelines and not character streams as in Linux

### Best Practice

- Always do as much as possible using the Cmdlets
  - :thumbsdown: `Get-Process -Name explorer | Stop-Process`
  - **instead:** `Stop-Process -Name explorer`
- If possible store the return value of the Cmdlet and reuse it in another code-line
  - makes it more maintainable & testable

### Foreach Pipe

```powershell
# $_ = current item
Get-ChildItem -Path . | Foreach { Write-Host $_.Name "`tlast accessed:" $_.LastAccessTimeUtc }
```

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


## Files (PSProvider: `FileSystem`)

- `Add-Content`
- `Clear-Content`
- `Get-Content`
- `Set-Content`


### Where File-Size

```powershell
Get-ChildItem -Path . | Where-Object -Property Length -GT 1kb # 1mb / 1gb
```

### Line, Word, Char count

```powershell
Get-Content -Path "c:\Windows\log.txt" | Measure-Object -Line -Word -Character
```

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

### Find corresponding PS Cmdlet

Output will display the help of the corresponding PS Cmdlet.

```powershell
dir -?
```

## Command Master Table

| Command              | Purpose                    |
| -------------------- | -------------------------- |
| `Get-History`        | list command history       |
| `Get-NetIPAddress`   | get ipconfig               |
| `Get-Module`         | show local PS modules      |
| `Get-Process`        | get all processes          |
| `Get-Service`        | get all services           |
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

## Tipps & Tricks

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

# Script Development

## Preparation

In order to run scripts on your machine, you have to enable 

```powershell
Get-ExecutionPolicy -List

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
# alternatively:
powershell.exe -ExecutionPolicy Bypass -File ./my-script.ps1
```

## Visual Studio Code Setup

VS Code recommendations for PowerShell:

File: `.vscode/settings.json`
```jsonc
{"gitdown": "include", "file": "./../.vscode/settings.json"}
```

File: `.vscode/launch.json`
```jsonc
{"gitdown": "include", "file": "./../.vscode/launch.json"}
```

## Profiles

The profile file get's executed every time PS is started.

```powershell
$PROFILE | Select-Object -Property *
```

:arrow_right: CurrentHost: only for `$Host` (e.g. only PS ConsoleHost)  
:arrow_right: AllHosts: (e.g. PS ConsoleHost & PS ISE & VS Package Manager Console)

### Customize Prompt

:arrow_right: `about_Prompts`

```powershell
function Prompt { <function_body> }
```

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

## Try Catch

```powershell
$ErrorActionPreference = "Stop";

try {
  Get-ChildItem C:\nonExistingFolder
} catch [Exception] {
  Write-Host "caught"
}
```

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

## Integrations

### Prepare Script

- Set proper **Exit-Codes** in the code
  - _Exit-Codes will be visible in the Task Scheduler_
  - Success: `exit 0`
  - Error: `exit 1`
- In PROD Mode: do not pause script :exclamation:

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

## Documentation

:arrow_right: using block comments

:arrow_right: in VSCode type `##` - (below function header or on top of script)

## Testing
  
- `White-Box Test`: Debugger, line by line
- `Black-Box Test`: Unit Tests (asserts)
- `Component Test`: Test only one component
- `Integration Test`: Test integration of one component with the whole architecture 

:arrow_right: Writing test cases: _Dossier DW122 S. 10_

# Script Template

```powershell
{"gitdown": "include", "file": "./scripts/base.ps1"}
```

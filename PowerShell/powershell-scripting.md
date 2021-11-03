# PowerShell Commands

## Quick Access

:arrow_right: [Writing PS OneLiners](#writing-ps-oneliners)  
:arrow_right: [Command Master Table](#command-master-table)

---
<br>

{"gitdown": "contents"}

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

Example:

```powershell
$ErrorActionPreference = "Stop";

try {
    Get-ChildItem C:\nonExistingFolder
} catch [Exception] {
    Write-Host "caught"
}
```

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

|Operator|Description                        |Example                   |
|--------|-----------------------------------|--------------------------|
|`-and`  |Logical AND. TRUE when both        |`(1 -eq 1) -and (1 -eq 2)`|
|        |statements are TRUE.               |`False`                   |
|`-or`   |Logical OR. TRUE when either       |`(1 -eq 1) -or (1 -eq 2)` |
|        |statement is TRUE.                 |`True`                    |
|`-xor`  |Logical EXCLUSIVE OR. TRUE when    |`(1 -eq 1) -xor (2 -eq 2)`|
|        |only one statement is TRUE         |`False`                   |
|`-not`  |Logical not. Negates the statement |`-not (1 -eq 1)`          |
|        |that follows.                      |`False`                   |
|`!`     |Same as `-not`                     |`!(1 -eq 1)`              |
|        |                                   |`False`                   |

Source: https://github.com/MicrosoftDocs/PowerShell-Docs/blob/staging/reference/7.1/Microsoft.PowerShell.Core/About/about_Logical_Operators.md?plain=1#L28

## Comparison Operators

Comparison operators let you compare values or finding values that match
specified patterns. PowerShell includes the following comparison operators:

|    Type     |   Operator     |              Comparison test              |
| ----------- | ------------   | ----------------------------------------- |
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
- `Where-Object` [-Property] [-Value]

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

## Array

```powershell
$array = @("hello","world")

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

## PSProviders

:arrow_right: `Get-PSProvider`

Use the `Drives` as prefix in `-Path` parameters (e.g. `Env:PATH`)

```powershell
Get-Item -Path "c:\temp\file.txt"
Get-Item -Path "Env:PATH"
# ... - Get-Command -Noun Item
```

## PSDrives

Get all available physical & virtual filesystems:

```powershell
Get-PSDrives
```

All drive's name are also valid PSProviders

@see: `New-PSDrive`, `Remove-PSDrive`

## Items (PSProvider: all)

for read protected items: `-Force`

- `Get-Item`
- `Get-ChildItem` [-Recurse]
- `Get-ItemProperty`
- `Set-Item`
- `Set-ItemProperty`
- `Clear-Item` delete item's content
- `Clear-ItemProperty`
- `Copy-Item`
- `Copy-ItemProperty`
- `Invoke-Item` open file with associated default app
- `Move-Item`
- `Move-ItemProperty`
- `New-Item` [-ItemType]
- `New-ItemProperty`
- `Remove-Item`
- `Remove-ItemProperty`
- `Rename-Item`
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
| `Test-Connection`    | ping a computer            |
| `Test-NetConnection` | ping using a specific port |
| `Invoke-Item`        | open file with default app |
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

2. ...

# Script Template

```powershell
{"gitdown": "include", "file": "./scripts/base.ps1"}
```

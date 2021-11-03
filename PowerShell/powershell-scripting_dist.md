<a name="powershell-commands"></a>
# PowerShell Commands

<a name="powershell-commands-quick-access"></a>
## Quick Access

:arrow_right: [Writing PS OneLiners](#writing-ps-oneliners)  
:arrow_right: [Command Master Table](#command-master-table)

---
<br>

* [PowerShell Commands](#powershell-commands)
    * [Quick Access](#powershell-commands-quick-access)
    * [Command Help](#powershell-commands-command-help)
        * [`about_` pages](#powershell-commands-command-help-about_-pages)
    * [Find Commands](#powershell-commands-find-commands)
    * [Directory Navigation](#powershell-commands-directory-navigation)
    * [Environment Variables - $env](#powershell-commands-environment-variables-env)
    * [Syntax](#powershell-commands-syntax)
        * [Named Parameter](#powershell-commands-syntax-named-parameter)
        * [Switch Parameter](#powershell-commands-syntax-switch-parameter)
        * [Position Parameter](#powershell-commands-syntax-position-parameter)
        * [Common Parameters](#powershell-commands-syntax-common-parameters)
        * [`-WhatIf`](#powershell-commands-syntax-whatif)
        * [`-Confirm`](#powershell-commands-syntax-confirm)
    * [Organize Output](#powershell-commands-organize-output)
    * [Logical Operators](#powershell-commands-logical-operators)
    * [Comparison Operators](#powershell-commands-comparison-operators)
    * [Working with Objects](#powershell-commands-working-with-objects)
        * [Object Mgmt](#powershell-commands-working-with-objects-object-mgmt)
        * [List Object Attributes](#powershell-commands-working-with-objects-list-object-attributes)
        * [Inspect Objects](#powershell-commands-working-with-objects-inspect-objects)
        * [Create Objects](#powershell-commands-working-with-objects-create-objects)
        * [Export of Objects](#powershell-commands-working-with-objects-export-of-objects)
        * [Parsing of Objects](#powershell-commands-working-with-objects-parsing-of-objects)
    * [Enum](#powershell-commands-enum)
    * [Regex](#powershell-commands-regex)
    * [Array](#powershell-commands-array)
    * [SecureString - Credential Mgmt](#powershell-commands-securestring-credential-mgmt)
        * [Create SecureString](#powershell-commands-securestring-credential-mgmt-create-securestring)
        * [PSCredentials](#powershell-commands-securestring-credential-mgmt-pscredentials)
    * [Pipeline](#powershell-commands-pipeline)
        * [Best Practice](#powershell-commands-pipeline-best-practice)
        * [Foreach Pipe](#powershell-commands-pipeline-foreach-pipe)
    * [PSProviders](#powershell-commands-psproviders)
    * [PSDrives](#powershell-commands-psdrives)
    * [Items (PSProvider: all)](#powershell-commands-items-psprovider-all)
    * [Files (PSProvider: `FileSystem`)](#powershell-commands-files-psprovider-filesystem)
        * [Where File-Size](#powershell-commands-files-psprovider-filesystem-where-file-size)
        * [Line, Word, Char count](#powershell-commands-files-psprovider-filesystem-line-word-char-count)
    * [Aliases](#powershell-commands-aliases)
        * [Find corresponding PS Cmdlet](#powershell-commands-aliases-find-corresponding-ps-cmdlet)
    * [Command Master Table](#powershell-commands-command-master-table)
* [Writing PS OneLiners](#writing-ps-oneliners)
    * [Tipps & Tricks](#writing-ps-oneliners-tipps-tricks)
* [Script Template](#script-template)


<a name="powershell-commands-command-help"></a>
## Command Help

```powershell
<Cmdlet> -?

Get-Help <Cmdlet> [-ShowWindow]
```

```powershell
Update-Help
```
To download latest help from MS Docs

<a name="powershell-commands-command-help-about_-pages"></a>
### <code>about_</code> pages

```powershell
# list all `about_` articles
Get-Help about_*

Get-Help about_CommonParameters
```

<a name="powershell-commands-find-commands"></a>
## Find Commands

```powershell
Get-Command -Noun Acl
Get-Command -Verb Set
Get-Command -Module Azure.Storage
```

<a name="powershell-commands-directory-navigation"></a>
## Directory Navigation

`$PSScriptRoot` - the folder containing the PowerShell script

- `Get-Location`
- `Set-Location`

<a name="powershell-commands-environment-variables-env"></a>
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

<a name="powershell-commands-syntax"></a>
## Syntax

```
Verb-Substantive [-Parameter [Value]]
```

|               |                                                     |
| ------------- | --------------------------------------------------- |
| `Verb`        | Get, Set, Write ...                                 |
| `Substantive` | Service, Object, EventLog ... - **always singular** |

<a name="powershell-commands-syntax-named-parameter"></a>
### Named Parameter

```powershell
<Cmdlet> -Parameter Value

Get-Command -Noun "service"
```

<a name="powershell-commands-syntax-switch-parameter"></a>
### Switch Parameter

```powershell
<Cmdlet> -Parameter

Get-ChildItem -Recurse
```

<a name="powershell-commands-syntax-position-parameter"></a>
### Position Parameter

> :information_source: Use **named parameters** instead to avoid script bugs after changes on the core cmdlets done by MSFT

```powershell
<Cmdlet> -Parameter Value

Get-Process "powershell"
# = Get-Process -Name "powershell"
```

<a name="powershell-commands-syntax-common-parameters"></a>
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

<a name="powershell-commands-syntax-whatif"></a>
### <code>-WhatIf</code>

> `-WhatIf` shows the effect of the command without executing it.

```powershell
New-Item -Type File -Name test.txt -WhatIf
```

Output: 

```
What if: Performing the operation "Create File" on target "Destination: C:\Users\vmadmin\test.txt".
```

<a name="powershell-commands-syntax-confirm"></a>
### <code>-Confirm</code>

> Specify if a confirmation is needed

```powershell
Remove-Item .\folder\ -Recurse -Confirm:$false
```

<a name="powershell-commands-organize-output"></a>
## Organize Output

- `Out-File`
- `Out-GridView` - Window with GridView
- `Out-Host` - std output
- `Out-Null` = /dev/null
- `Out-Printer`
- `Out-String`

<a name="powershell-commands-logical-operators"></a>
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

<a name="powershell-commands-comparison-operators"></a>
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

<a name="powershell-commands-working-with-objects"></a>
## Working with Objects

null in PowerShell: `$null`

```powershell
# (object).Attribute
(Get-Service | Measure-Object).Count
```

<a name="powershell-commands-working-with-objects-object-mgmt"></a>
### Object Mgmt

> `<Cmdlet> -Property`

- `Group-Object`
- `Measure-Object` - .Count, .Average, .Sum ...
- `Select-Object`
- `Sort-Object`
- `Tee-Object` [-FilePath] [-Variable]
- `Where-Object` [-Property] [-Value]

<a name="powershell-commands-working-with-objects-object-mgmt-where-object-multi-conditions"></a>
#### Where-Object - Multi Conditions

```powershell
# $_ = current item
# -> Never use $_ without attribute
Where-Object { $_.DisplayName -like "b*" -or $_.DisplayName -like "c*" }
```

<a name="powershell-commands-working-with-objects-object-mgmt-group-object-nested-foreach"></a>
#### Group-Object - Nested Foreach

```powershell
Get-ChildItem -Path . | Group-Object -Property Extension | `
Foreach { Write-Host ("`nExtension: " + $_.Name + "`t - Occurrence: " + $_.Count); ` 
# foreach item in group
$_.Group | Foreach { Write-Host $_.FullName } }
```

<a name="powershell-commands-working-with-objects-list-object-attributes"></a>
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

<a name="powershell-commands-working-with-objects-inspect-objects"></a>
### Inspect Objects

```powershell
# append Select-... to a pipe to inspect objects
Get-ChildItem -Path . | Select-Object -Property * -First 1
```

<a name="powershell-commands-working-with-objects-create-objects"></a>
### Create Objects

```powershell
# Select-Object @{N="AttributeName";E={AttributeValue}}

# basic remapping:
Get-ChildItem -Path . | Select-Object @{N="MyAttribute";E={$_.Extension}},@{N="MyFileName";E={$_.Extension}},@{N="IsJson";E={$_.Extension -Like "*json"}}
```

<a name="powershell-commands-working-with-objects-export-of-objects"></a>
### Export of Objects

> Cmdlets: `ConvertTo-`*

- `ConvertTo-Csv`
- `ConvertTo-Json`
- `ConvertTo-Xml` [-As String]

Addition: `ConvertTo-Html` [-As Table]

<a name="powershell-commands-working-with-objects-parsing-of-objects"></a>
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

<a name="powershell-commands-enum"></a>
## Enum

Get all Enum Values: 

```powershell
[System.ServiceProcess.ServiceControllerStatus].GetEnumNames() # | Foreach { $_ }
```

<a name="powershell-commands-regex"></a>
## Regex

```powershell
Get-Content -Path "c:\Windows\log.txt" | Select-String -Pattern ".*succeeded.*"
```

<a name="powershell-commands-array"></a>
## Array

```powershell
$array = @("hello","world")

foreach ($item in $array) {
  New-Item -Type File -Name ($item + ".txt")
}
```

<a name="powershell-commands-securestring-credential-mgmt"></a>
## SecureString - Credential Mgmt

SecretStrings in PS can be used to store user passwords or so.  
**Attention: SecretString can be decrypted and is not one-way hashing**

<a name="powershell-commands-securestring-credential-mgmt-create-securestring"></a>
### Create SecureString

> :heavy_exclamation_mark: when using `-AsPlainText` always append `-Force`

```powershell
$SecretOne = ConvertTo-SecureString -String "super secret" -AsPlainText -Force

$SecretTwo = Read-Host -AsSecureString
```

<a name="powershell-commands-securestring-credential-mgmt-pscredentials"></a>
### PSCredentials

> :heavy_exclamation_mark: Do not store passwords in a script - use env variables

```powershell
$User = "Domain01\User01" # $env:DAEMON_USER
$Password = ConvertTo-SecureString -String "P@sSwOrd" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $Password
```

<a name="powershell-commands-pipeline"></a>
## Pipeline

<a name="powershell-commands-pipeline-best-practice"></a>
### Best Practice

- Always do as much as possible using the Cmdlets
  - :thumbsdown: `Get-Process -Name explorer | Stop-Process`
  - **instead:** `Stop-Process -Name explorer`
- If possible store the return value of the Cmdlet and reuse it in another code-line
  - makes it more maintainable & testable

<a name="powershell-commands-pipeline-foreach-pipe"></a>
### Foreach Pipe

```powershell
# $_ = current item
Get-ChildItem -Path . | Foreach { Write-Host $_.Name "`tlast accessed:" $_.LastAccessTimeUtc }
```

<a name="powershell-commands-psproviders"></a>
## PSProviders

:arrow_right: `Get-PSProvider`

Use the `Drives` as prefix in `-Path` parameters (e.g. `Env:PATH`)

```powershell
Get-Item -Path "c:\temp\file.txt"
Get-Item -Path "Env:PATH"
# ... - Get-Command -Noun Item
```

<a name="powershell-commands-psdrives"></a>
## PSDrives

Get all available physical & virtual filesystems:

```powershell
Get-PSDrives
```

All drive's name are also valid PSProviders

@see: `New-PSDrive`, `Remove-PSDrive`

<a name="powershell-commands-items-psprovider-all"></a>
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


<a name="powershell-commands-files-psprovider-filesystem"></a>
## Files (PSProvider: <code>FileSystem</code>)

- `Add-Content`
- `Clear-Content`
- `Get-Content`
- `Set-Content`


<a name="powershell-commands-files-psprovider-filesystem-where-file-size"></a>
### Where File-Size

```powershell
Get-ChildItem -Path . | Where-Object -Property Length -GT 1kb # 1mb / 1gb
```

<a name="powershell-commands-files-psprovider-filesystem-line-word-char-count"></a>
### Line, Word, Char count

```powershell
Get-Content -Path "c:\Windows\log.txt" | Measure-Object -Line -Word -Character
```

<a name="powershell-commands-aliases"></a>
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

<a name="powershell-commands-aliases-find-corresponding-ps-cmdlet"></a>
### Find corresponding PS Cmdlet

Output will display the help of the corresponding PS Cmdlet.

```powershell
dir -?
```

<a name="powershell-commands-command-master-table"></a>
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

2. ...

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
    return ($PSVersionTable.PSEdition -eq "Desktop");
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

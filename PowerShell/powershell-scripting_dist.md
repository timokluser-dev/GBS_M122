<a name="powershell-commands"></a>
# PowerShell Commands

* [PowerShell Commands](#powershell-commands)
    * [Command Help](#powershell-commands-command-help)
        * [`about_` pages](#powershell-commands-command-help-about_-pages)
    * [Find Commands](#powershell-commands-find-commands)
    * [Directory Navigation](#powershell-commands-directory-navigation)
    * [Environment Variables](#powershell-commands-environment-variables)
    * [Syntax](#powershell-commands-syntax)
        * [Named Parameter](#powershell-commands-syntax-named-parameter)
        * [Switch Parameter](#powershell-commands-syntax-switch-parameter)
        * [Position Parameter](#powershell-commands-syntax-position-parameter)
        * [Common Parameters](#powershell-commands-syntax-common-parameters)
        * [`-WhatIf`](#powershell-commands-syntax-whatif)
        * [`-Confirm`](#powershell-commands-syntax-confirm)
    * [List Command Attributes](#powershell-commands-list-command-attributes)
    * [Organize Output](#powershell-commands-organize-output)
    * [Working with Objects](#powershell-commands-working-with-objects)
        * [Object Mgmt](#powershell-commands-working-with-objects-object-mgmt)
        * [Export of Objects](#powershell-commands-working-with-objects-export-of-objects)
        * [Parsing of Objects](#powershell-commands-working-with-objects-parsing-of-objects)
    * [SecureString - Credential Mgmt](#powershell-commands-securestring-credential-mgmt)
        * [Create SecureString](#powershell-commands-securestring-credential-mgmt-create-securestring)
        * [PSCredentials](#powershell-commands-securestring-credential-mgmt-pscredentials)
    * [Pipeline](#powershell-commands-pipeline)
        * [Best Practice](#powershell-commands-pipeline-best-practice)
    * [PSProviders](#powershell-commands-psproviders)
    * [PSDrives](#powershell-commands-psdrives)
    * [Items (PSProvider: all)](#powershell-commands-items-psprovider-all)
    * [Files (PSProvider: `FileSystem`)](#powershell-commands-files-psprovider-filesystem)
    * [Aliases](#powershell-commands-aliases)
    * [Command Master Table](#powershell-commands-command-master-table)
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

<a name="powershell-commands-environment-variables"></a>
## Environment Variables

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

<a name="powershell-commands-list-command-attributes"></a>
## List Command Attributes

```powershell
$(Get-WinSystemLocale)[0] | Get-Member
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

<a name="powershell-commands-organize-output"></a>
## Organize Output

- `Out-File`
- `Out-GridView` - Window with GridView
- `Out-Host` - std output
- `Out-Null` = /dev/null
- `Out-Printer`
- `Out-String`

<a name="powershell-commands-working-with-objects"></a>
## Working with Objects

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
- `ConvertFrom-Json`

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

- Always so as much as possible using the Cmdlets
  - :thumbsdown: `Get-Process -Name explorer | Stop-Process`
  - **instead:** `Stop-Process -Name explorer`
- If possible store the return value of the Cmdlet and reuse it in another code-line
  - makes it more maintainable & testable

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

function Test-Administrator {
    $UserWindowsPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent());
    return $UserWindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
}

#endregion Functions

#region Script prechecks

if (-not $(Test-Administrator)) {
    Write-Host 'ERROR: run script as administrator' -ForegroundColor Red;
    exit 1;
}

#endregion Script prechecks

#region Main Code

Write-Host 'hello world 🥳'

#endregion Main Code


```

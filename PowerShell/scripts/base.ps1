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

if (-not (Test-IsAdministrator)) {
    Write-Host 'ERROR: run script as administrator' -ForegroundColor Red;
    exit 1;
}

if (-not (Test-IsWindowsPowershell)) {
    Write-Host 'ERROR: run script with Windows PowerShell.' -ForegroundColor Red;
    Write-Host 'ERROR: PowerShell Core is not supported' -ForegroundColor Red;
    exit 1;
}

#endregion Script prechecks

#region Main Code

Write-Host 'hello world 🥳'

#endregion Main Code


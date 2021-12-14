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

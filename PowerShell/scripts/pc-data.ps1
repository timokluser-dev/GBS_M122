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

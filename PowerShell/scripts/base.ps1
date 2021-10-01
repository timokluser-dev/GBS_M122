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


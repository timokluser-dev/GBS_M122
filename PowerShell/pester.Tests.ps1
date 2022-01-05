try {
    Import-Module -Name Pester -Passthru -ErrorAction Stop
}
catch {
    Install-Module -Name Pester -Force -Confirm:$false
    Import-Module -Name Pester -Passthru
}

# Invoke-Pester -Output Detailed

Describe 'Get-True' {
    It 'Should return $true' {
        $false | Should -Be $true
    }
}

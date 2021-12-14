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

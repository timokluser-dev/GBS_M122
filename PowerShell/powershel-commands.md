# PowerShell Commands

## Command Help

```powershell
<Cmdlet> -?

Get-Help <Cmdlet>
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


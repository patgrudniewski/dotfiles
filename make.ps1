param (
    [ValidateSet('install')]
    [System.String]$type = 'install'
)

$notProcessable = '.git','utils'
Get-ChildItem -Directory | ForEach-Object {
    $dirname = "$_"
    If ($notProcessable.Contains($dirname)) {
        return
    }

    $script = "$PSScriptRoot\$dirname\make.ps1"
    If (![System.IO.File]::Exists($script)) {
        return
    }

    & $script -type $type
}
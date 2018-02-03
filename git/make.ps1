param (
    [ValidateSet('install')]
    [System.String]$type = 'install'
)

$installer = "$env:USERPROFILE\AppData\Local\Temp\git.exe"
$osBitVersion = If ([System.IntPtr]::Size -eq 4) { 32 } Else { 64 }

$releasesInfo = Invoke-WebRequest -Uri 'https://api.github.com/repos/git-for-windows/git/releases/latest' | ConvertFrom-Json

ForEach ($asset in $releasesInfo.assets) {
    if ($asset.name -match "^Git.*$osBitVersion-bit\.exe$") {
        $webCli = New-Object System.Net.WebClient
        $webCli.DownloadFile($asset.browser_download_url, $installer)

        break;
    }
}

Start-Process $installer -Wait
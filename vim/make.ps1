param (
    [ValidateSet('install')]
    [System.String]$type = 'install'
)

$serverDir = 'ftp://ftp.vim.org/pub/vim/pc/'

$dirRequest = [System.Net.FtpWebRequest]::Create($serverDir)
$dirRequest.Method = [System.Net.WebRequestMethods+FTP]::ListDirectory

$dirStream = $dirRequest.GetResponse().GetResponseStream()
$dirReader = New-Object System.IO.StreamReader($dirStream)

$filename = ''
While ($dirReader.Peek() -ge 0) {
    $currentFilename = $dirReader.ReadLine()
    if ($currentFilename -match "^gvim.*\.exe$") {
        # last item is always newest
        $filename = $currentFilename
    }
}

$installer = "$env:USERPROFILE\AppData\Local\Temp\vim.exe"
$downloader = New-Object System.Net.WebClient
$downloader.DownloadFile("$serverDir$filename", $installer)

Start-Process $installer -Wait

If (![System.IO.File]::Exists($profile)) {
    New-Item -Path $profile -ItemType File -Force
}

$vimLocation = 'C:\Program Files (x86)\Vim'
Get-ChildItem -Directory $vimLocation | ForEach-Object {
    $dirname = "$_"
    If ($dirname -match "^vim\d+$") {
        $vimLocation += "\$dirname"
        echo $vimLocation
    }
}

$profileFiles = 'Microsoft.PowerShellISE_profile.ps1','Microsoft.PowerShell_profile.ps1'
$profileDir = Split-Path -Path $profile
ForEach ($file in $profileFiles) {
    echo "Set-Alias vim '$vimLocation\vim.exe'" | Out-File "$profileDir\$file"
}

New-Item -ItemType Directory -Path "$env:USERPROFILE\vimfiles"
New-Item -ItemType Directory -Path "$env:USERPROFILE\vimfiles\autoload"
New-Item -ItemType Directory -Path "$env:USERPROFILE\vimfiles\swp"
New-Item -ItemType Directory -Path "$env:USERPROFILE\vimfiles\undo"

$downloader.DownloadFile("https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim", "$env:USERPROFILE\vimfiles\autoload\plug.vim")

$rcContent = Get-Content "$PSScriptRoot\.vimrc"
$rcContent = $rcContent.Replace('screen-256color', 'win32')
$rcContent = $rcContent.Replace("Plug 'altercation/vim-colors-solarized'", '')
echo $rcContent | Set-Content "$env:USERPROFILE\.vimrc"
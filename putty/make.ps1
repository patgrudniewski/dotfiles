param (
    [ValidateSet('install')]
    [System.String]$type = 'install'
)

$osBitVersion = If ([System.IntPtr]::Size -eq 4) { 32 } Else { 64 }
$server = "ftp://ftp.chiark.greenend.org.uk/users/sgtatham/putty-latest/w$osBitVersion/"

$request = [System.Net.FtpWebRequest]::Create($server)
$request.Method = [System.Net.WebRequestMethods+FTP]::ListDirectory

$stream = $request.GetResponse().GetResponseStream()
$reader = New-Object System.IO.StreamReader($stream)

$filename = ''
While ($reader.Peek() -ge 0) {
    $current = $reader.ReadLine()
    if ($current -match '^putty-.+-installer\.msi$') {
        $filename = $current
        break
    }
}

$installerPath = "$env:USERPROFILE\AppData\Local\Temp\putty.msi"

$downloader = New-Object System.Net.WebClient
$downloader.DownloadFile("$server$filename", $installerPath)

Start-Process $installerPath -Wait
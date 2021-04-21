if (-not (Test-Path Variable:choco)) { 
    $choco = Convert-Path "$((Get-Command choco).path)";
    if (-not (Test-Path Variable:choco)) { $choco = "C:\ProgramData\chocolatey\bin\choco.exe"; }
}
if (-not [System.IO.File]::Exists($choco)) {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
}
Start-Process $choco -Wait -ArgumentList install,mingw

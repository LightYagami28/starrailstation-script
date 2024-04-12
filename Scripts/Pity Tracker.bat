@echo off
setlocal enabledelayedexpansion

REM Set security protocol to TLS 1.2 for secure communication
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs'))"

REM Open browser to a specific URL
start https://starrailstation.com/en/warp#import

REM Wait for browser to load (adjust this delay if needed)
timeout /t 1 >nul

REM Set TLS version to TLS 1.2 for secure communication
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12"

REM Execute PowerShell script from the specified URL
powershell -ExecutionPolicy Bypass -Command "(New-Object Net.WebClient).DownloadFile('https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs', 'get_warp_link_os.ps1')"

REM Check if the script download was successful
if not exist get_warp_link_os.ps1 (
    echo Error during script download.
    exit /b 1
)

REM Execute the downloaded script
powershell -ExecutionPolicy Bypass -File get_warp_link_os.ps1

REM Exit the script
exit /b %ERRORLEVEL%

@echo off

REM Set security protocol to TLS 1.2 for secure communication
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs'))"

REM Open browser to a specific URL
start https://starrailstation.com/en/warp#import

REM Wait for browser to load (adjust this delay if needed)
timeout /t 1 >nul

REM Set TLS version to TLS 1.2 for secure communication
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12"

try {
    REM Download and execute script from the Gist
    $webClient = New-Object Net.WebClient
    $scriptUrl = "https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs"
    $scriptContent = $webClient.DownloadString($scriptUrl)

    REM Execute downloaded script
    Invoke-Expression $scriptContent

} catch {
    echo An error occurred: %ERRORLEVEL%
}

REM Exit the script
exit /b %ERRORLEVEL%

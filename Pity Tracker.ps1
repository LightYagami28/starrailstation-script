# [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12; Invoke-Expression (New-Object Net.WebClient).DownloadString("https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs")

# Open Firefox browser to a specific URL
Start-Process firefox https://starrailstation.com/en/warp#import

# Wait for browser to load (adjust this delay if needed)
Start-Sleep -Seconds 1

try {
    # Set TLS version to TLS 1.2 for secure communication
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

    # Download and execute script from a GitHub Gist
    $webClient = New-Object Net.WebClient
    $scriptUrl = "https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs"
    $scriptContent = $webClient.DownloadString($scriptUrl)

    # Execute downloaded script
    Invoke-Expression $scriptContent

} catch {
    Write-Error "An error occurred: $_.Exception.Message"
}

# Exit the script
Stop-Process -Id $PID

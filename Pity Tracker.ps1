# Set TLS version to TLS 1.2 for secure communication
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Open browser to a specific URL
Start-Process "https://starrailstation.com/en/warp#import"

# Wait for browser to load (adjust this delay if needed)
Start-Sleep -Seconds 1

try {
    # Download and execute script from the Gist
    $scriptUrl = "https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs"
    
    # Download script content securely
    $scriptContent = Invoke-RestMethod -Uri $scriptUrl
    
    # Execute downloaded script
    Invoke-Expression $scriptContent

} catch {
    # Display error message if an exception occurs
    Write-Error "An error occurred: $($_.Exception.Message)"
}

# Exit the script
Stop-Process -Id $PID

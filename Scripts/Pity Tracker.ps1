<<<<<<< HEAD
# Set TLS version to TLS 1.2 for secure communication
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Open browser to a specific URL
Start-Process "https://starrailstation.com/en/warp#import"
=======
# Set security protocol to TLS 1.2 for secure communication
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# Open the browser to a specific URL
Start-Process https://starrailstation.com/en/warp#import
>>>>>>> origin/patch-1

# Wait for the browser to load (adjust this delay if needed)
Start-Sleep -Seconds 1

try {
<<<<<<< HEAD
    # Download and execute script from the Gist
    $scriptUrl = "https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs"
    
    # Download script content securely
    $scriptContent = Invoke-RestMethod -Uri $scriptUrl
    
    # Execute downloaded script
    Invoke-Expression $scriptContent

} catch {
    # Display error message if an exception occurs
    Write-Error "An error occurred: $($_.Exception.Message)"
=======
    # Download and execute the script from the Gist
    $webClient = New-Object Net.WebClient
    $scriptUrl = "https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs"
    $scriptContent = $webClient.DownloadString($scriptUrl)

    # Execute the downloaded script
    Invoke-Expression $scriptContent

} catch {
    # Handle any errors and display an error message
    Write-Error "An error occurred: $_.Exception.Message"
>>>>>>> origin/patch-1
}

# Exit the script
Stop-Process -Id $PID

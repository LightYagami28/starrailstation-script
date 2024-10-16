# Imposta il protocollo di sicurezza su TLS 1.3 per una comunicazione sicura
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls13

# Apri il browser su un URL specifico
Start-Process "https://starrailstation.com/en/warp#import"

# Attendi che il browser carichi (modifica il tempo di attesa se necessario)
Start-Sleep -Seconds 1

try {
    # Configura il WebClient per il download sicuro e imposta un timeout e un User-Agent
    $webClient = New-Object Net.WebClient
    $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
    $webClient.Encoding = [System.Text.Encoding]::UTF8
    $webClient.DownloadTimeout = 15000  # Timeout di 15 secondi per il download

    # URL dello script da scaricare
    $scriptUrl = "https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs"

    # Scarica il contenuto dello script
    $scriptContent = $webClient.DownloadString($scriptUrl)

    # Controlla se lo script è stato scaricato correttamente
    if ([string]::IsNullOrEmpty($scriptContent)) {
        throw "Il contenuto dello script è vuoto o non valido."
    }

    # Esegui lo script scaricato in modo sicuro
    Invoke-Expression $scriptContent

} catch {
    # Gestisci gli errori e visualizza un messaggio di errore dettagliato
    Write-Error "Si è verificato un errore: $($_.Exception.Message)"
} finally {
    # Libera le risorse utilizzate dal WebClient
    if ($webClient -ne $null) {
        $webClient.Dispose()
    }
}

# Esci dallo script in modo sicuro
Stop-Process -Id $PID -Force

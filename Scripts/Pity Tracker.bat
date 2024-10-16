@echo off
setlocal enabledelayedexpansion

REM Imposta il protocollo di sicurezza su TLS 1.2 per la comunicazione sicura
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12"

REM Verifica la presenza di PowerShell prima di continuare
for /f "tokens=2 delims==" %%A in ('powershell -Command "$PSVersionTable.PSVersion.Major"') do set PowerShellVersion=%%A
if %PowerShellVersion% lss 5 (
    echo PowerShell 5.0 o superiore è richiesto per eseguire questo script.
    exit /b 1
)

REM Scarica ed esegui il contenuto dello script in modo sicuro
powershell -Command "$wc = New-Object Net.WebClient; $wc.Headers.Add('User-Agent', 'Mozilla/5.0'); $scriptContent = $wc.DownloadString('https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs'); Invoke-Expression $scriptContent"

REM Apre il browser all'URL specificato
start https://starrailstation.com/en/warp#import

REM Attendi che il browser si carichi (regola questo ritardo se necessario)
timeout /t 1 >nul

REM Reimposta il protocollo TLS 1.2 (utile per successive operazioni sicure)
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12"

REM Scarica il file PowerShell in modo sicuro, con gestione degli errori
powershell -Command "$wc = New-Object Net.WebClient; $wc.Headers.Add('User-Agent', 'Mozilla/5.0'); try { $wc.DownloadFile('https://gist.githubusercontent.com/Star-Rail-Station/2512df54c4f35d399cc9abbde665e8f0/raw/get_warp_link_os.ps1?cachebust=srs', 'get_warp_link_os.ps1') } catch { Write-Error 'Errore nel download del file.'; exit 1 }"

REM Verifica se il download è stato completato con successo
if not exist get_warp_link_os.ps1 (
    echo Errore durante il download dello script.
    exit /b 1
)

REM Esegui il file scaricato in PowerShell con un livello di sicurezza ridotto
powershell -ExecutionPolicy RemoteSigned -File get_warp_link_os.ps1

REM Pulisci rimuovendo lo script scaricato
del /f /q get_warp_link_os.ps1

REM Esci con il codice di errore corrispondente
exit /b %ERRORLEVEL%

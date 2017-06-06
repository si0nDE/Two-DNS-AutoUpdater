    ###    Simon Fieber IT-Services    ###
    ###     Coded by: Simon Fieber     ###
    ###     Visit:  simonfieber.it     ###

cls

### Einstellungen | Settings ###

     $hostname    = "replaceme.dd-dns.de"
     $username    = ""
     $password    = ""

[int]$use_https   = 1

     $updateHTTP  = "http://update.twodns.de/update?hostname=$hostname"
     $updateHTTPS = "https://update.twodns.de/update?hostname=$hostname"

##################################################  ##################################################
##################################################  ##################################################
##################################################  ##################################################
##### Ab hier, keine Änderungen durchführen! #####  ############ Do not make any changes! ############
##################################################  ##################################################
##################################################  ##################################################
##################################################  ##################################################

$ver = "v1.0"

$host.ui.RawUI.WindowTitle = “Two-DNS Auto Updater $ver  –  © github.simonfieber.it”
$ErrorActionPreference = "SilentlyContinue"

### Startbildschirm ###
function startbildschirm {
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "║ Two-DNS Auto Updater $ver                                                     ║"
    Write-Host "║                                                                               ║"
    Write-Host "║                                                     (c) github.simonfieber.it ║"
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
}

function Send-UpdateRequest{
    if($use_https -eq "1"){
        Invoke-WebRequest -Uri $updateHTTPS -Headers @{"Authorization" = "Basic "+[System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($username+":"+$password ))} -Method Get
    }
    else{
        Invoke-WebRequest -Uri $updateHTTP -Headers @{"Authorization" = "Basic "+[System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($username+":"+$password ))} -Method Get
    }
}

$UR = Send-UpdateRequest

function Set-DynamicIP{
    startbildschirm
    Start-Sleep -Milliseconds 1500
    if($UR.StatusCode -eq "200"){
        Write-Host "    ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "    ║ Anfrage wurde erfolgreich gesendet!                                           ║"
        Write-Host "    ║                                                                               ║"
        Write-Host "    ╚═══════════════════════════════════════════════════════════════════════════════╝"
        Write-Host ""
        Write-Host " Rückmeldung des Servers:"
        Write-Host ""
        Write-Host " $UR"
        Write-Host ""
        Write-Host ""
        Start-Sleep -Milliseconds 10000
    }
    else {
        Write-Host "    ╔═══════════════════════════════════════════════════════════════════════════════╗"
        Write-Host "    ║ Es ist ein unbekannter Fehler aufgetreten!                                    ║"
        Write-Host "    ║                                                                               ║"
        Write-Host "    ╚═══════════════════════════════════════════════════════════════════════════════╝"
        $Request
        Write-Host ""
        Write-Host ""
        Start-Sleep -Milliseconds 5000
    }
}

Set-DynamicIP
[Environment]::Exit(1)
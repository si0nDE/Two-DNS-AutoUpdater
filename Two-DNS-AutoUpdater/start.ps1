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

$ver = "v0.4"

$host.ui.RawUI.WindowTitle = “Two-DNS Auto Updater $ver  –  © github.simonfieber.it”

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
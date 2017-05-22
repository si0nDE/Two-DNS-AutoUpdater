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

### Startbildschirm ###
function startbildschirm {
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "║ Two-DNS Auto Updater v0.2                                                     ║"
    Write-Host "║                                                                               ║"
    Write-Host "║                                                     (c) github.simonfieber.it ║"
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
}

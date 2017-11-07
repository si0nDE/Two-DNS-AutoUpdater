    ###    Simon Fieber IT-Services    ###
    ###     Coded by: Simon Fieber     ###
    ###     Visit:  simonfieber.it     ###

cls

### Startbildschirm ###
function startbildschirm {
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "║ Two-DNS Auto Updater                                                          ║"
    Write-Host "║                                                                               ║"
    Write-Host "║                                                     (c) github.simonfieber.it ║"
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝"
}

### Root-Verzeichnis ermitteln, zum öffnen des Programmcodes ###
function Get-ScriptDirectory {
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}
 
$installpath = Get-ScriptDirectory

### Administrationsrechte prüfen und ggf. anfordern ###
function adminrechte {
Start-Sleep -Milliseconds 500
    Write-Host "        ╔═══════════════════════════════════════════════════════════════════════════════╗"
    Write-Host "        ║ Programm wird gestartet...                                                    ║"
    Write-Host "        ║                                                                               ║"
    Write-Host "        ╚═══════════════════════════════════════════════════════════════════════════════╝"
    Start-Sleep -Milliseconds 1500
    powershell.exe -windowstyle hidden "$installpath\gui.ps1"
}

### Start ###
startbildschirm
adminrechte
    ###    Simon Fieber IT-Services    ###
    ###     Coded by: Simon Fieber     ###
    ###     Visit:  simonfieber.it     ###

cls

### Einstellungen | Settings ###

     $hostname    = ""
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

$progname = "Two-DNS Auto Updater"
$ver = "v2.0α"

### Root-Verzeichnis ermitteln, zum öffnen des Programmcodes ###
function Get-ScriptDirectory {
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}
 
$installpath = Get-ScriptDirectory

function Send-UpdateRequest{
    if($use_https -eq "1"){
        Invoke-WebRequest -Uri $updateHTTPS -Headers @{"Authorization" = "Basic "+[System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($username+":"+$password ))} -Method Get
    }
    else{
        Invoke-WebRequest -Uri $updateHTTP -Headers @{"Authorization" = "Basic "+[System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($username+":"+$password ))} -Method Get
    }
}


### Schaltflächen ###
$button_updateip_OnClick={
$error.Clear()
$statusbox.Text = {Bite warten Sie einen Augenblick...

    IP-Adresse wird aktualisiert...}

Start-Sleep -Milliseconds 250
$UR = Send-UpdateRequest
$statusbox.Text = $UR
if ($error -ne ""){$statusbox.Text = $error}}

$button_savesettings_OnClick={
$error.Clear()
$config = New-Object -Type PSObject -Property @{
    'hostname'  = $hostname
    'username'  = $username
    'password'  = $password
    'use_https' = [int]$use_https.CheckState}
$config | Export-Csv -Path $installpath\conf.csv -NoType -Force
$statusbox.Text = {Hinweis:

    Die Einstellungen wurden erfolgreich gespeichert!}
if ($error -ne ""){$statusbox.Text = $error}}












#Generated Form Function
function GenerateForm {
#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#region Generated Form Objects
$2dns_gui = New-Object System.Windows.Forms.Form
$textbox_hostname = New-Object System.Windows.Forms.TextBox
$statusbox = New-Object System.Windows.Forms.TextBox
$title_status = New-Object System.Windows.Forms.Label
$button_updateip = New-Object System.Windows.Forms.Button
$button_savesettings = New-Object System.Windows.Forms.Button
$use_https = New-Object System.Windows.Forms.CheckBox
$textbox_password = New-Object System.Windows.Forms.TextBox
$title_password = New-Object System.Windows.Forms.Label
$textbox_username = New-Object System.Windows.Forms.TextBox
$title_username = New-Object System.Windows.Forms.Label
$title_hostname = New-Object System.Windows.Forms.Label
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$2dns_gui.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#region Generated Form Code
$2dns_gui.AutoScaleMode = 3
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 261
$System_Drawing_Size.Width = 484
$2dns_gui.ClientSize = $System_Drawing_Size
$2dns_gui.DataBindings.DefaultDataSourceUpdateMode = 0
$2dns_gui.FormBorderStyle = 1
$2dns_gui.MaximizeBox = $False
$2dns_gui.Name = "2dns_gui"
$2dns_gui.Text = "$progname $ver  –  © github.simonfieber.it"

$textbox_hostname.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 15
$System_Drawing_Point.Y = 30
$textbox_hostname.Location = $System_Drawing_Point
$textbox_hostname.Name = "textbox_hostname"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 169
$textbox_hostname.Size = $System_Drawing_Size
$textbox_hostname.TabIndex = 0
$textbox_hostname.Text = "$hostname"
$textbox_hostname.add_TextChanged($handler_textBox1_TextChanged)

$2dns_gui.Controls.Add($textbox_hostname)

$statusbox.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 15
$System_Drawing_Point.Y = 125
$statusbox.Location = $System_Drawing_Point
$statusbox.Multiline = $True
$statusbox.Name = "statusbox"
$statusbox.ReadOnly = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 115
$System_Drawing_Size.Width = 315
$statusbox.Size = $System_Drawing_Size
$statusbox.TabIndex = 12
$statusbox.Text = "Willkommen im $progname.

In diesem Statusfenster werden Ihnen Serverrückmeldungen angezeigt.

Wird Ihnen zum Beispiel ein ''good'' ausgegeben, hat die Aktualisierung funktioniert."

$2dns_gui.Controls.Add($statusbox)

$title_status.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 15
$System_Drawing_Point.Y = 105
$title_status.Location = $System_Drawing_Point
$title_status.Name = "title_status"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$title_status.Size = $System_Drawing_Size
$title_status.TabIndex = 10
$title_status.Text = "Status"
$title_status.TextAlign = 16

$2dns_gui.Controls.Add($title_status)


$button_updateip.Cursor = [System.Windows.Forms.Cursors]::Hand
$button_updateip.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 335
$System_Drawing_Point.Y = 217
$button_updateip.Location = $System_Drawing_Point
$button_updateip.Name = "button_updateip"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 135
$button_updateip.Size = $System_Drawing_Size
$button_updateip.TabIndex = 8
$button_updateip.Text = "Jetzt aktualisieren"
$button_updateip.UseVisualStyleBackColor = $True
$button_updateip.add_Click($button_updateip_OnClick)

$2dns_gui.Controls.Add($button_updateip)


$button_savesettings.Cursor = [System.Windows.Forms.Cursors]::Hand
$button_savesettings.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 335
$System_Drawing_Point.Y = 105
$button_savesettings.Location = $System_Drawing_Point
$button_savesettings.Name = "button_savesettings"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 135
$button_savesettings.Size = $System_Drawing_Size
$button_savesettings.TabIndex = 7
$button_savesettings.Text = "Einstellungen speichern"
$button_savesettings.UseVisualStyleBackColor = $True
$button_savesettings.add_Click($button_savesettings_OnClick)

$2dns_gui.Controls.Add($button_savesettings)


$use_https.Checked = $True
$use_https.CheckState = 1
$use_https.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 210
$System_Drawing_Point.Y = 26
$use_https.Location = $System_Drawing_Point
$use_https.Name = "use_https"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 121
$use_https.Size = $System_Drawing_Size
$use_https.TabIndex = 6
$use_https.Text = "HTTPS verwenden"
$use_https.UseVisualStyleBackColor = $True
$use_https.add_CheckedChanged($handler_use_https_CheckedChanged)

$2dns_gui.Controls.Add($use_https)

$textbox_password.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 210
$System_Drawing_Point.Y = 80
$textbox_password.Location = $System_Drawing_Point
$textbox_password.Name = "textbox_password"
$textbox_password.PasswordChar = '●'
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 168
$textbox_password.Size = $System_Drawing_Size
$textbox_password.TabIndex = 5
$textbox_password.Text = "$password"

$2dns_gui.Controls.Add($textbox_password)

$title_password.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 210
$System_Drawing_Point.Y = 60
$title_password.Location = $System_Drawing_Point
$title_password.Name = "title_password"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$title_password.Size = $System_Drawing_Size
$title_password.TabIndex = 4
$title_password.Text = "Passwort"
$title_password.TextAlign = 16

$2dns_gui.Controls.Add($title_password)

$textbox_username.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 15
$System_Drawing_Point.Y = 80
$textbox_username.Location = $System_Drawing_Point
$textbox_username.Name = "textbox_username"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 168
$textbox_username.Size = $System_Drawing_Size
$textbox_username.TabIndex = 3
$textbox_username.Text = "$username"

$2dns_gui.Controls.Add($textbox_username)

$title_username.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 15
$System_Drawing_Point.Y = 60
$title_username.Location = $System_Drawing_Point
$title_username.Name = "title_username"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$title_username.Size = $System_Drawing_Size
$title_username.TabIndex = 2
$title_username.Text = "Benutzername"
$title_username.TextAlign = 16

$2dns_gui.Controls.Add($title_username)

$title_hostname.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 15
$System_Drawing_Point.Y = 10
$title_hostname.Location = $System_Drawing_Point
$title_hostname.Name = "title_hostname"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 21
$System_Drawing_Size.Width = 100
$title_hostname.Size = $System_Drawing_Size
$title_hostname.TabIndex = 1
$title_hostname.Text = "Hostname"
$title_hostname.TextAlign = 16
$title_hostname.add_Click($handler_label1_Click)

$2dns_gui.Controls.Add($title_hostname)

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $2dns_gui.WindowState
#Init the OnLoad event to correct the initial state of the form
$2dns_gui.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$2dns_gui.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm
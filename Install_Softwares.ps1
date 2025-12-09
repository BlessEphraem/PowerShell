Clear-Host
Write-Host ""
Write-Host "========================================================"
Write-Host ""
Write-Host "        __  __      _ ______     __  __  ______" -ForegroundColor Cyan
Write-Host "       / / / /___  (_) ____/__  / /_/ / / /  _/" -ForegroundColor Cyan
Write-Host "      / / / / __ \/ / / __/ _ \/ __/ / / // /" -ForegroundColor Cyan
Write-Host "     / /_/ / / / / / /_/ /  __/ /_/ /_/ // /" -ForegroundColor Cyan
Write-Host "     \____/_/ /_/_/\____/\___/\__/\____/___/" -ForegroundColor Cyan
Write-Host "          UniGetUI Package Installer Script" 
Write-Host "        Created with UniGetUI Version 3.3.6"
Write-Host ""
Write-Host "========================================================"
Write-Host ""
Write-Host "NOTES:" -ForegroundColor Yellow
Write-Host "  - The install process will not be as reliable as importing a bundle with UniGetUI. Expect issues and errors." -ForegroundColor Yellow
Write-Host "  - Packages will be installed with the install options specified at the time of creation of this script." -ForegroundColor Yellow
Write-Host "  - Error/Sucess detection may not be 100% accurate." -ForegroundColor Yellow
Write-Host "  - Some of the packages may require elevation. Some of them may ask for permission, but others may fail. Consider running this script elevated." -ForegroundColor Yellow
Write-Host "  - You can skip confirmation prompts by running this script with the parameter `/DisablePausePrompts` " -ForegroundColor Yellow
Write-Host ""
Write-Host ""
if ($args[0] -ne "/DisablePausePrompts") { pause }
Write-Host ""
Write-Host "This script will attempt to install the following packages:"
Write-Host "  - Oh My Posh from WinGet"
Write-Host "  - blender from WinGet"
Write-Host "  - Java 8 from WinGet"
Write-Host "  - AutoHotkey from WinGet"
Write-Host "  - draw.io from WinGet"
Write-Host "  - 7-Zip from WinGet"
Write-Host "  - yasb from WinGet"
Write-Host "  - SumatraPDF from WinGet"
Write-Host "  - Logi Options+ from WinGet"
Write-Host "  - Pip from Pip"
Write-Host "  - komorebi from WinGet"
Write-Host "  - spacedesk Windows DRIVER from WinGet"
Write-Host "  - Git from WinGet"
Write-Host "  - Telegram Desktop from WinGet"
Write-Host "  - Bitwarden from WinGet"
Write-Host "  - Parsec from WinGet"
Write-Host "  - Steam from WinGet"
Write-Host "  - Audacity from WinGet"
Write-Host "  - Shutter Encoder from WinGet"
Write-Host "  - Bulk Crap Uninstaller from WinGet"
Write-Host "  - Auto Editor from Pip"
Write-Host "  - IrfanView from WinGet"
Write-Host "  - Google Drive from WinGet"
Write-Host "  - Python 3.9 from WinGet"
Write-Host "  - Discord from WinGet"
Write-Host "  - Manta from WinGet"
Write-Host "  - VLC media player from WinGet"
Write-Host "  - Elgato Stream Deck from WinGet"
Write-Host "  - Arc from WinGet"
Write-Host "  - PowerShell from WinGet"
Write-Host "  - Everything from WinGet"
Write-Host "  - Obsidian from WinGet"
Write-Host "  - VSCodium from WinGet"
Write-Host "  - oh-my-posh from WinGet"
Write-Host "  - fastfetch from WinGet"
Write-Host "  - Windows Terminal from WinGet"
Write-Host "  - Deluge BitTorrent Client from WinGet"
Write-Host "  - OBS Studio from WinGet"
Write-Host "  - Btop from Scoop"
Write-Host ""
if ($args[0] -ne "/DisablePausePrompts") { pause }
Clear-Host

$success_count=0
$failure_count=0
$commands_run=0
$results=""

$commands= @(
    'cmd.exe /C winget.exe install --id "JanDeDobbeleer.OhMyPosh" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "BlenderFoundation.Blender" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Oracle.JavaRuntimeEnvironment" --exact --source winget --accept-source-agreements --disable-interactivity --scope machine --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "AutoHotkey.AutoHotkey" --exact --source winget --accept-source-agreements --disable-interactivity --scope machine --silent --accept-package-agreements --force --scope machine',
    'cmd.exe /C winget.exe install --id "JGraph.Draw" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "7zip.7zip" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "AmN.yasb" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "SumatraPDF.SumatraPDF" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Logitech.OptionsPlus" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "LGUG2Z.komorebi" --exact --source winget --accept-source-agreements --disable-interactivity --scope machine --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Datronicsoft.SpacedeskDriver.Server" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Git.Git" --exact --source winget --accept-source-agreements --disable-interactivity --scope machine --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Telegram.TelegramDesktop" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Bitwarden.Bitwarden" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Parsec.Parsec" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Valve.Steam" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Audacity.Audacity" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "PaulPacifico.ShutterEncoder" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Stacher.Stacher" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Klocman.BulkCrapUninstaller" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "IrfanSkiljan.IrfanView" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Google.GoogleDrive" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Python.Python.3.9" --exact --source winget --accept-source-agreements --disable-interactivity --scope machine --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Discord.Discord" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "hql287.manta" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "VideoLAN.VLC" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Elgato.StreamDeck" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "TheBrowserCompany.Arc" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.PowerShell" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "voidtools.Everything" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Obsidian.Obsidian" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "VSCodium.VSCodium" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Fastfetch-cli.Fastfetch" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "Microsoft.WindowsTerminal" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "DelugeTeam.Deluge" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C winget.exe install --id "OBSProject.OBSStudio" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force',
    'cmd.exe /C pip install pip --no-input --no-color --no-cache',
    'cmd.exe /C pip install auto-editor --no-input --no-color --no-cache',
    'cmd.exe /C scoop install main/btop'
)

foreach ($command in $commands) {
    Write-Host "Running: $command" -ForegroundColor Yellow
    cmd.exe /C $command
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[  OK  ] $command" -ForegroundColor Green
        $success_count++
        $results += "$([char]0x1b)[32m[  OK  ] $command`n"
    }
    else {
        Write-Host "[ FAIL ] $command" -ForegroundColor Red
        $failure_count++
        $results += "$([char]0x1b)[31m[ FAIL ] $command`n"
    }
    $commands_run++
    Write-Host ""
}

Write-Host "========================================================"
Write-Host "                  OPERATION SUMMARY"
Write-Host "========================================================"
Write-Host "Total commands run: $commands_run"
Write-Host "Successful: $success_count"
Write-Host "Failed: $failure_count"
Write-Host ""
Write-Host "Details:"
Write-Host "$results$([char]0x1b)[37m"
Write-Host "========================================================"

if ($failure_count -gt 0) {
    Write-Host "Some commands failed. Please check the log above." -ForegroundColor Yellow
}
else {
    Write-Host "All commands executed successfully!" -ForegroundColor Green
}
Write-Host ""
if ($args[0] -ne "/DisablePausePrompts") { pause }
exit $failure_count
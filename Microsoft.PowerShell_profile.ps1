# I edit my profile here, then i use my PushProfile.py to push it inside C:\Users\%AppData%\Documents\Powershell

# --- CONFIGURATION ---
$Tools = "Z:\Scripts\Tools"
$ToolsExt = "$Tools\externals"
$ffmpeg = "$ToolsExt\ffmpeg\bin"
$ytdlp = "$ToolsExt\YT-DLP"

$env:Path += ";$Tools;$ToolsExt;$ffmpeg;$ytdlp"

Write-Host "Loaded external tools : ffmpeg, yt-dlp" -ForegroundColor Cyan
Import-Module -Name Terminal-Icons

if ($env:PATHEXT -notlike "*.PY*") {
    $env:PATHEXT += ";.PY"
}

function Tools {
    if (Test-Path -Path $Tools) {
        Set-Location -Path $Tools
    }
    else {
        Write-Error "Le chemin 'Tools' est introuvable."
    }
}

function Show-Tools {
    if (Test-Path -Path $Tools) {
        Get-ChildItem -Path $Tools | Format-Table -AutoSize | Out-String -Stream | Where-Object { $_ -notmatch "Directory: " }
    }
    else {
        Write-Warning "Le dossier 'pathTools' est introuvable. Vérifiez que le lecteur Z: est bien connecté."
    }
}
# --- OH-MY-POSH ---
oh-my-posh init pwsh --config "C:\Users\Ephraem\.config\powershell\myposh.omp.json" | Invoke-Expression

# --- EXECUTION ---
Show-Tools

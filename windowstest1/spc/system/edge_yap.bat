@echo off
chcp 65001 >nul
cls

echo [*] Kısayol ve İkon Yeniden Yapılandırılıyor...

set "HTA_PATH=C:\Users\pc\Desktop\spc\Uygulama.hta"
set "ICON_PATH=C:\Users\pc\Desktop\spc\logo1.ico"
set "LNK_PATH=C:\Users\pc\Desktop\spc\seta.lnk"

powershell -Command "$lnkPath = '%LNK_PATH%'; if (Test-Path $lnkPath) { (Get-Item $lnkPath).Attributes = 'Normal'; Remove-Item $lnkPath -Force }; $WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut($lnkPath); $Shortcut.TargetPath = 'mshta.exe'; $Shortcut.Arguments = '\"%HTA_PATH%\"'; $Shortcut.IconLocation = '%ICON_PATH%,0'; $Shortcut.Save();"

echo [+] İşlem başarılı! Uygulama başlatılıyor...
start "" "%LNK_PATH%"
exit
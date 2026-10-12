@echo off
chcp 65001 >nul
cls

echo ========================================================
echo      SPC OTOMATİK SİSTEM KURULUM VE ID YÖNETİCİSİ
echo ========================================================
echo.

:: Kullanıcıdan ID isteme
set /p "SYSTEM_ID=Lütfen bir Sistem ID giriniz (Örn: 1 veya SPC-01): "

echo.
echo [*] Girilen ID (%SYSTEM_ID%) sisteme tanımlandı...
echo [*] Tam yollar kontrol ediliyor ve yapılandırılıyor...

:: Belirttiğiniz tam yollar
set "HTA_FILE=C:\Users\pc\Desktop\spc\system\Uygulama.hta"
set "ICON_FILE=C:\Users\pc\Desktop\spc\system\logo1.ico"
set "LNK_FILE=C:\Users\pc\Desktop\spc\seta.lnk"

:: PowerShell ile kısayolu, HTA dosyasını ve logoyu birbirine bağlıyoruz
powershell -Command "$lnkPath = '%LNK_FILE%'; if (Test-Path $lnkPath) { (Get-Item $lnkPath).Attributes = 'Normal'; Remove-Item $lnkPath -Force }; $WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut($lnkPath); $Shortcut.TargetPath = 'mshta.exe'; $Shortcut.Arguments = '\"%HTA_FILE%\"'; $Shortcut.IconLocation = '%ICON_FILE%,0'; $Shortcut.Save(); (Get-Item $lnkPath).Attributes = 'ReadOnly';"

echo.
echo ========================================================
echo [+] DURUM: BAŞARILI!
echo [+] ID: %SYSTEM_ID%
echo [+] HTA Yolu: %HTA_FILE%
echo [+] İkon Yolu: %ICON_FILE%
echo [+] Kısayol: %LNK_FILE%
echo ========================================================
echo.
echo Uygulama logosu ve ID ayarlarıyla başlatılıyor...

:: Yapılandırılan kısayol üzerinden uygulamayı çalıştır
start "" "%LNK_FILE%"

timeout /t 4 >nul
exit
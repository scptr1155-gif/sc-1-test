@echo off
chcp 65001 >nul
cls

:: Yönetici yetkisi kontrolü
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Yönetici izni gerekiyor, lütfen sağ tıklayıp "Yönetici olarak çalıştır" deyin...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo [*] .hta dosya uzantısı varsayılan programa (mshta.exe) bağlanıyor...

:: .hta uzantısını htafile sınıfına yönlendir
assoc .hta=htafile >nul

:: htafile çalıştırıcısını varsayılan mshta.exe yap
ftype htafile="%SystemRoot%\System32\mshta.exe" "%%1" %%* >nul

:: Kullanıcı bazlı geçersiz seçimi (VS Code vb.) temizle
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.hta\UserChoice" /f >nul 2>&1

echo [*] Windows Gezgini yenileniyor...
taskkill /f /im explorer.exe >nul
start explorer.exe

echo [+] İşlem tamamlandı! .hta dosyaları artık doğrudan uygulama olarak açılacak.
timeout /t 3 >nul
exit
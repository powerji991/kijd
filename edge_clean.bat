@echo off
title Edge Browser & Trace Cleaner (HARD)
color 0A

echo ============================
echo  EDGE CLEANER (HARD RESET)
echo ============================
echo.

:: Step 1: Kill Edge completely
echo [*] Closing Microsoft Edge...
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM msedgewebview2.exe >nul 2>&1

:: Step 2: Delete Edge user profiles (main wipe)
echo [*] Deleting Edge User Data (like fresh install)...
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data"
rd /s /q "%APPDATA%\Microsoft\Edge"

:: Step 3: Clean Edge Crash Reports
echo [*] Removing Crash Reports...
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Crashpad"

:: Step 4: Clear temp folders
echo [*] Cleaning Temp files...
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%x in ("%TEMP%\*") do rd /s /q "%%x" >nul 2>&1

:: Step 5: Clean Prefetch
echo [*] Cleaning Prefetch...
del /f /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1

:: Step 6: Flush DNS
echo [*] Flushing DNS cache...
ipconfig /flushdns >nul

:: Step 7: Clear Recent Documents
echo [*] Clearing recent documents list...
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

:: Step 8: Clear Edge's cache in LocalCache
echo [*] Clearing Edge LocalCache...
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\LocalCache"

:: Step 9: Remove Service Worker cache
echo [*] Removing Service Worker Cache...
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\Service Worker"

:: Step 10: Clean Akamai / IRCTC hidden traces (common)
echo [*] Deleting Akamai / IRCTC traces (known folders)...
rd /s /q "%LOCALAPPDATA%\Akamai"
rd /s /q "%APPDATA%\Akamai"

:: Step 11: Clean Edge WebView2
echo [*] Cleaning WebView2 profiles...
rd /s /q "%LOCALAPPDATA%\Microsoft\EdgeWebView"

echo.
echo [*] Edge & system traces wiped.
echo.

:: Step 12: Relaunch Edge fresh
echo [*] Launching Microsoft Edge...
start msedge.exe

echo [*] Done.
pause

@echo off
title ПроФильтр 2.0
chcp 65001 >nul 2>nul

echo.
echo  Запускаем ПроФильтр 2.0...
echo.

python --version >nul 2>nul
if %errorlevel%==0 (
    echo  Python найден - запускаем сервер на порту 8080
    echo  Не закрывай это окно пока работаешь!
    start "" "http://localhost:8080"
    python -m http.server 8080
    goto :end
)

python3 --version >nul 2>nul
if %errorlevel%==0 (
    start "" "http://localhost:8080"
    python3 -m http.server 8080
    goto :end
)

echo  Python не найден - открываем напрямую в браузере...
timeout /t 2 >nul

set "FILEPATH=%~dp0index.html"

if exist "%PROGRAMFILES%\Google\Chrome\Application\chrome.exe" (
    start "" "%PROGRAMFILES%\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files "%FILEPATH%"
    goto :end
)
if exist "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" (
    start "" "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" --allow-file-access-from-files "%FILEPATH%"
    goto :end
)
if exist "%PROGRAMFILES%\Microsoft\Edge\Application\msedge.exe" (
    start "" "%PROGRAMFILES%\Microsoft\Edge\Application\msedge.exe" --allow-file-access-from-files "%FILEPATH%"
    goto :end
)
if exist "%PROGRAMFILES(X86)%\Microsoft\Edge\Application\msedge.exe" (
    start "" "%PROGRAMFILES(X86)%\Microsoft\Edge\Application\msedge.exe" --allow-file-access-from-files "%FILEPATH%"
    goto :end
)

start "" "%FILEPATH%"

:end
echo.
echo  Если браузер не открылся - открой файл index.html вручную двойным кликом
pause

@echo off
title Simulateur ERMET - PLCSIM Advanced
cd /d "%~dp0"
echo ==========================================
echo   Simulateur ERMET - depose de couvercle
echo ==========================================
echo.
echo  1. Demarrer une instance dans PLCSIM Advanced (bouton Start, etat RUN).
echo  2. Charger le programme TIA Portal dans cette instance.
echo  3. Le pont s'ouvre ensuite dans le navigateur : http://localhost:8080
echo.
taskkill /f /im PlcBridge.exe >nul 2>&1
"%~dp0bridge\PlcBridge.exe" "%~dp0"

REM Code 3 : le pont s'est relance en administrateur dans une autre fenetre
if "%errorlevel%"=="3" exit
pause

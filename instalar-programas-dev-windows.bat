@echo off
chcp 65001 >nul
title Instalador Ambiente Dev
color 0A

:: =========================
:: EXECUTAR COMO ADMIN
:: =========================
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Solicitando permissao de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: =========================
:: VERIFICA WINGET
:: =========================
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo Winget nao encontrado.
    echo Atualize o Windows App Installer pela Microsoft Store.
    pause
    exit /b
)

:menu
cls
echo ==========================================
echo        INSTALADOR DE PROGRAMAS
echo ==========================================
echo.
echo 1 - Ambiente de Desenvolvimento
echo 2 - Utilitarios
echo 3 - Eletronica
echo 4 - Outros
echo 0 - Sair
echo.

set /p opcao="Escolha uma opcao: "

if "%opcao%"=="1" goto desenvolvimento
if "%opcao%"=="2" goto utilitarios
if "%opcao%"=="3" goto eletronica
if "%opcao%"=="4" goto outros
if "%opcao%"=="0" goto sair

echo Opcao invalida.
pause
goto menu

:desenvolvimento
cls
echo ==========================================
echo Instalando Ambiente de Desenvolvimento
echo ==========================================
echo.
echo Serao instalados:
echo - IntelliJ IDEA Community
echo - Java 21 Amazon Corretto
echo - Visual Studio Code
echo - Git
echo - Docker Desktop
echo - Postman
echo - DBeaver
echo - Python 3.12
echo.

set /p confirmar="Deseja continuar? (S/N): "
if /I not "%confirmar%"=="S" goto menu

call :instalar "JetBrains.IntelliJIDEA.Community" "IntelliJ IDEA Community"
call :instalar "Amazon.Corretto.21.JDK" "Java 21 Amazon Corretto"
call :instalar "Microsoft.VisualStudioCode" "Visual Studio Code"
call :instalar "Git.Git" "Git"
call :instalar "Docker.DockerDesktop" "Docker Desktop"
call :instalar "Postman.Postman" "Postman"
call :instalar "dbeaver.dbeaver" "DBeaver"
call :instalar "Python.Python.3.12" "Python 3.12"

echo.
echo Ambiente de desenvolvimento instalado!
pause
goto menu

:utilitarios
cls
echo ==========================================
echo Utilitarios
echo ==========================================
echo.
echo 1 - Instalar todos
echo 2 - Escolher quais instalar
echo 0 - Voltar
echo.

set /p util="Escolha uma opcao: "

if "%util%"=="1" (
    call :instalar "Google.Chrome" "Google Chrome"
    call :instalar "Mozilla.Firefox" "Mozilla Firefox"
    call :instalar "IObit.DriverBooster" "Driver Booster"
    call :instalar "RevoUninstaller.RevoUninstaller" "Revo Uninstaller"
    call :instalar "REALiX.HWiNFO" "HWiNFO"
    call :instalar "CPUID.CPU-Z" "CPU-Z"
    pause
    goto menu
)

if "%util%"=="2" (
    call :perguntar "Google.Chrome" "Google Chrome"
    call :perguntar "Mozilla.Firefox" "Mozilla Firefox"
    call :perguntar "IObit.DriverBooster" "Driver Booster"
    call :perguntar "RevoUninstaller.RevoUninstaller" "Revo Uninstaller"
    call :perguntar "REALiX.HWiNFO" "HWiNFO"
    call :perguntar "CPUID.CPU-Z" "CPU-Z"
    pause
    goto menu
)

if "%util%"=="0" goto menu

echo Opcao invalida.
pause
goto utilitarios

:eletronica
cls
echo ==========================================
echo Eletronica
echo ==========================================
echo.
echo 1 - Instalar todos
echo 2 - Escolher quais instalar
echo 0 - Voltar
echo.

set /p elet="Escolha uma opcao: "

if "%elet%"=="1" (
    call :instalar "KiCad.KiCad" "KiCad"
    call :instalar "ArduinoSA.IDE.stable" "Arduino IDE"
    call :fritzing
    pause
    goto menu
)

if "%elet%"=="2" (

    echo.
    echo 3.1 - KiCad
    echo 3.2 - Arduino IDE
    echo 3.3 - Fritzing
    echo.

    call :perguntar "KiCad.KiCad" "KiCad"
    call :perguntar "ArduinoSA.IDE.stable" "Arduino IDE"

    set /p fritz="Deseja instalar Fritzing? (S/N): "
    if /I "%fritz%"=="S" (
        call :fritzing
    )

    pause
    goto menu
)

if "%elet%"=="0" goto menu

echo Opcao invalida.
pause
goto eletronica

:outros
cls
echo ==========================================
echo Outros
echo ==========================================
echo.
echo Nenhum programa cadastrado ainda.
echo.
pause
goto menu

:: =========================
:: FUNCOES
:: =========================

:instalar
echo.
echo Instalando %~2...
winget install -e --id %~1 --silent ::--accept-package-agreements --accept-source-agreements
goto :eof

:perguntar
echo.
set /p escolha="Deseja instalar %~2? (S/N): "
if /I "%escolha%"=="S" (
    call :instalar "%~1" "%~2"
)
goto :eof

:sair
echo.
echo Processo finalizado.
pause
exit
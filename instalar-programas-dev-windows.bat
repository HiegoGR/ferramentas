@echo off
chcp 65001 >nul
title Instalador de Programas
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

echo Atualizando fontes do Winget...
winget source update
echo.

:: =========================
:: MODO DE INSTALACAO
:: =========================
echo ==========================================
echo        TIPO DE INSTALACAO
echo ==========================================
echo.
echo 1 - Automatica (Silenciosa)
echo 2 - Manual (Assistida)
echo.

set /p modo="Escolha uma opcao: "

if "%modo%"=="1" (
    set "INSTALL_MODE=--silent"
    set "MODO_OK=1"
)

if "%modo%"=="2" (
    set "INSTALL_MODE="
    set "MODO_OK=1"
)

if not defined MODO_OK (
    echo Opcao invalida.
    pause
    exit
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
echo Ambiente de Desenvolvimento
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
echo Ambiente de desenvolvimento finalizado!
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
    call :instalar "Mozilla.Firefox.pt-BR" "Mozilla Firefox"
    call :instalar "IObit.DriverBooster" "Driver Booster"
    call :instalar "RevoUninstaller.RevoUninstaller" "Revo Uninstaller"
    call :instalar "REALiX.HWiNFO" "HWiNFO"
    call :instalar "CPUID.CPU-Z" "CPU-Z"
    pause
    goto menu
)

if "%util%"=="2" (
    call :perguntar "Google.Chrome" "Google Chrome"
    call :perguntar "Mozilla.Firefox.pt-BR" "Mozilla Firefox"
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
    call :perguntar "KiCad.KiCad" "KiCad"
    call :perguntar "ArduinoSA.IDE.stable" "Arduino IDE"

    echo.
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
echo ==========================================
echo Instalando %~2...
echo ==========================================

winget show -e --id %~1 --source winget >nul 2>nul

if %errorlevel% neq 0 (
    echo.
    echo Pacote nao encontrado:
    echo %~2
    echo.
    echo ID utilizado:
    echo %~1
    echo.
    echo Tente pesquisar manualmente com:
    echo winget search "%~2"
    goto :eof
)

winget install -e --id %~1 --source winget %INSTALL_MODE% --accept-package-agreements --accept-source-agreements

if %errorlevel% neq 0 (
    echo.
    echo Erro ao instalar %~2.
) else (
    echo.
    echo %~2 instalado com sucesso.
)

goto :eof

:perguntar
echo.
set /p escolha="Deseja instalar %~2? (S/N): "

if /I "%escolha%"=="S" (
    call :instalar "%~1" "%~2"
)

goto :eof

:fritzing
echo.
echo ==========================================
echo Instalando Fritzing...
echo ==========================================

winget show -e --id Fritzing.Fritzing --source winget >nul 2>nul

if %errorlevel% neq 0 (
    echo.
    echo Fritzing nao encontrado no Winget.
    echo Abrindo site oficial...
    start https://fritzing.org/download/
    goto :eof
)

winget install -e --id Fritzing.Fritzing --source winget %INSTALL_MODE% --accept-package-agreements --accept-source-agreements

if %errorlevel% neq 0 (
    echo.
    echo Erro ao instalar Fritzing.
    echo Abrindo site oficial...
    start https://fritzing.org/download/
) else (
    echo.
    echo Fritzing instalado com sucesso.
)

goto :eof

:sair
echo.
echo Processo finalizado.
pause
exit
@echo off

:: =========================
:: EXECUTAR COMO ADMIN
:: =========================
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Solicitando permissao de administrador...
    
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    
    exit /b
)

title Instalador Ambiente Dev
color 0A

echo ==========================================
echo Instalando programas de desenvolvimento...
echo ==========================================
echo.

:: Verifica se o winget existe
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo Winget nao encontrado.
    echo Atualize o Windows App Installer pela Microsoft Store.
    pause
    exit /b
)

:: =========================
:: PROGRAMAS OBRIGATORIOS
:: =========================

echo Instalando Google Chrome...
winget install -e --id Google.Chrome --silent

echo Instalando IntelliJ IDEA Community...
winget install -e --id JetBrains.IntelliJIDEA.Community --silent

echo Instalando Java 21 (Corretto)...
winget install -e --id Amazon.Corretto.21.JDK --silent

echo Instalando VS Code...
winget install -e --id Microsoft.VisualStudioCode --silent

echo Instalando Git...
winget install -e --id Git.Git --silent

echo Instalando Docker Desktop...
winget install -e --id Docker.DockerDesktop --silent

echo Instalando Postman...
winget install -e --id Postman.Postman --silent

echo Instalando DBeaver...
winget install -e --id dbeaver.dbeaver --silent

echo Instalando Python 3.12...
winget install -e --id Python.Python.3.12 --silent

echo Instalando Driver Booster...
winget install -e --id IObit.DriverBooster --silent

echo.
echo ==========================================
echo Instalacoes obrigatorias finalizadas!
echo ==========================================
echo.

:: =========================
:: OPCIONAIS
:: =========================

set /p cpuz="Deseja instalar CPU-Z? (S/N): "

if /I "%cpuz%"=="S" (
    echo Instalando CPU-Z...
    winget install -e --id CPUID.CPU-Z --silent
)

echo.

set /p hwinfo="Deseja instalar HWiNFO? (S/N): "

if /I "%hwinfo%"=="S" (
    echo Instalando HWiNFO...
    winget install -e --id REALiX.HWiNFO --silent
)

echo.

set /p revo="Deseja instalar Revo Uninstaller? (S/N): "

if /I "%revo%"=="S" (
    echo Instalando Revo Uninstaller...
    winget install -e --id RevoUninstaller.RevoUninstaller --silent
)

echo.
echo ==========================================
echo Processo concluido!
echo ==========================================

pause
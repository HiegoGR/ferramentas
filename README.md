
Script `.bat` para instalação automática de ferramentas de desenvolvimento no Windows utilizando `winget`.

<p align="center">
  <a href="https://github.com/HiegoGR/ferramentas/archive/refs/tags/v1.0.0.zip">
    <img src="https://img.shields.io/badge/Download-Setup Ferramentas Dev-green?style=for-the-badge">
  </a>
</p>

---

## Funcionalidades

O script instala automaticamente:

- Google Chrome
- IntelliJ IDEA Community
- Java 21 (Amazon Corretto)
- Visual Studio Code
- Git
- Docker Desktop
- Postman
- DBeaver
- Python 3.12
- Driver Booster

Também possui instalação opcional de:

- CPU-Z
- HWiNFO
- Revo Uninstaller

---

## Requisitos

- Windows 10 ou Windows 11
- Winget instalado
- Permissão de Administrador
- Conexão com internet

---

### 3. Execute o arquivo

Clique duas vezes no arquivo `.bat`.

O script solicitará permissão de administrador automaticamente.

Obs.:
- Execução como Administrador
O script detecta automaticamente se está sendo executado como administrador.
Caso não esteja, ele reinicia automaticamente com privilégios elevados utilizando UAC do Windows.
---

## Tecnologias utilizadas

- Batch Script (`.bat`)
- Windows Package Manager (`winget`)
- PowerShell

---


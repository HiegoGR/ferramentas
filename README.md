
Script `.bat` para instalação automática de ferramentas de desenvolvimento no Windows utilizando `winget`.

<p align="center">
  <a href="https://github.com/HiegoGR/ferramentas/archive/refs/tags/v1.2.2.zip">
    <img src="https://img.shields.io/badge/Download-Setup Ferramentas Dev-green?style=for-the-badge">
  </a>
</p>

---

# Funcionalidades

- Execução automática como Administrador
- Instalação automatizada via `winget`
- Menu interativo por categorias
- Instalação silenciosa dos programas
- Escolha entre instalar tudo ou selecionar programas específicos

---

# Categorias disponíveis

## 1 - Ambiente de Desenvolvimento

Instala automaticamente:

- IntelliJ IDEA Community
- Java 21 (Amazon Corretto)
- Visual Studio Code
- Git
- Docker Desktop
- Postman
- DBeaver
- Python 3.12

---

## 2 - Utilitários

Permite instalar todos ou escolher individualmente:

- Google Chrome
- Mozilla Firefox
- Driver Booster
- Revo Uninstaller
- HWiNFO
- CPU-Z

---

## 3 - Eletrônica

Permite instalar todos ou escolher individualmente:

- KiCad
- Arduino IDE
- Fritzing

---

## 4 - Outros

Categoria reservada para futuros programas e ferramentas.

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

### Observação

Este projeto foi desenvolvido com foco em aprendizado e automação de instalação de programas no Windows utilizando:

- Batch Script (`.bat`)
- Windows Package Manager (`winget`)
- PowerShell

#!/data/data/com.termux/files/usr/bin/bash

RESET='\033[0m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'

clear

printf "${YELLOW}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠞⢳⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠋⠀⢰⠎⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢆⣤⡞⠃⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢠⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣀⣾⢳⠀⠀⠀⠀⢸⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣀⡤⠴⠊⠉⠀⠀⠈⠳⡀⠀⠀⠘⢎⠢⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀
⠳⣄⠀⠀⡠⡤⡀⠀⠘⣇⡀⠀⠀⠀⠉⠓⠒⠺⠭⢵⣦⡀⠀⠀⠀
⠀⢹⡆⠀⢷⡇⠁⠀⠀⣸⠇⠀⠀⠀⠀⠀⢠⢤⠀⠀⠘⢷⣆⡀⠀
⠀⠀⠘⠒⢤⡄⠖⢾⣭⣤⣄⠀⡔⢢⠀⡀⠎⣸⠀⠀⠀⠀⠹⣿⡀
⠀⠀⢀⡤⠜⠃⠀⠀⠘⠛⣿⢸⠀⡼⢠⠃⣤⡟⠀⠀⠀⠀⠀⣿⡇
⠀⠀⠸⠶⠖⢏⠀⠀⢀⡤⠤⠇⣴⠏⡾⢱⡏⠁⠀⠀⠀⠀⢠⣿⠃
⠀⠀⠀⠀⠀⠈⣇⡀⠿⠀⠀⠀⡽⣰⢶⡼⠇⠀⠀⠀⠀⣠⣿⠟⠀
⠀⠀⠀⠀⠀⠀⠈⠳⢤⣀⡶⠤⣷⣅⡀⠀⠀⠀⣀⡠⢔⠕⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠫⠿⠿⠿⠛⠋⠁⠀⠀⠀⠀
${RESET}"

printf "${CYAN}Iniciando instalación de herramientas OSINT...${RESET}\n"

sleep 1

printf "${BLUE}[*]${RESET} Verificando si Python3 está instalado...\n"

if ! command -v python3 >/dev/null 2>&1; then
    printf "${BLUE}[*]${RESET} Python3 no encontrado. Instalando...\n"
    pkg update -y
    pkg install python -y
    if ! command -v python3 >/dev/null 2>&1; then
        printf "${RED}[!!]${RESET} No se pudo instalar Python3. Abortando.\n"
        exit 1
    fi
else
    printf "${BLUE}[*]${RESET} Python3 encontrado en %s\n" "$(command -v python3)"
fi

printf "${BLUE}[*]${RESET} Moviendo archivos a /data/data/com.termux/files/usr/bin...\n"
mv "$PWD/.osint" /data/data/com.termux/files/usr/bin/osint
mv "$PWD/.logo" /data/data/com.termux/files/usr/bin/logo

printf "${BLUE}[*]${RESET} Asignando permisos de ejecución...\n"
chmod +x /data/data/com.termux/files/usr/bin/osint
chmod +x /data/data/com.termux/files/usr/bin/logo

printf "${GREEN}[OK]${RESET} Instalación completada correctamente.\n"

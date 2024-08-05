#!/data/data/com.termux/files/usr/bin/bash

# Code by Dark-34 2024 ©

# Colours
g="\e[0;32m\033[1m"
en="\033[0m\e[0m"
re="\e[0;31m\033[1m"
b="\e[0;34m\033[1m"
y="\e[0;33m\033[1m"
p="\e[0;35m\033[1m"
c="\e[0;36m\033[1m"
gra="\e[0;37m\033[1m"

path="$PREFIX/share/ngrok"

function banner {
    clear
    echo -e "\t${b}=============================${en}"
    echo -e "\t${b}=     ${g} Code by Dark-34      ${b}=${en}"
    echo -e "\t${b}=       ${g} Version 1.0        ${b}=${en}"
    echo -e "\t${b}=============================${en}\n"
}

function install {
    banner
    echo -e "${g} ¿Deseas seguir con la instalación de Ngrok?\n"
    read -p "[Y/N]: " opt
    if [ "$opt" == "y" ]; then
        banner
        echo -e "${c} Instalando Ngrok en tu Termux......${en}\n"

        
        rm -rf $HOME/ngrok > /dev/null 2>&1
        rm -f $PREFIX/bin/ngrok > /dev/null 2>&1
        rm -rf $path > /dev/null 2>&1

        
        mkdir -p $path > /dev/null 2>&1
        cp download.sh $path > /dev/null 2>&1
        cp ngrok $PREFIX/bin > /dev/null 2>&1

        
        apt update -y > /dev/null 2>&1
        apt upgrade -y > /dev/null 2>&1
        apt install -y proot wget resolv-conf > /dev/null 2>&1
        apt clean > /dev/null 2>&1
        apt autoremove -y > /dev/null 2>&1

        
        cd $path
        bash download.sh > /dev/null 2>&1
        sleep 1

        
        if [ -f $path/ngrok ] || [ -f $PREFIX/bin/ngrok ]; then
            banner
            rm -f $path/download.sh > /dev/null 2>&1
            chmod 777 $PREFIX/bin/ngrok > /dev/null 2>&1
            chmod 777 $path/ngrok > /dev/null 2>&1
            echo -e "${b}[✓]${g} Se instaló correctamente\n${en}"
            echo -e "${c}Usa: ngrok http 8080, ngrok tcp 4546\n"
        else
            echo -e "${re} [x]${g} Algo salió mal, vuelve a ejecutar el script\n${en}"
        fi
    elif [ "$opt" == "n" ]; then
        echo -e "${c} Es una lástima, vuelve pronto${en}"
    fi
}

install


#!/data/data/com.termux/files/user/bin/bash

# Code by Dark-34 2024 

#Colours 
g="\e[0;32m\033[1m"
en="\033[0m\e[0m"
re="\e[0;31m\033[1m"
b="\e[0;34m\033[1m"
y="\e[0;33m\033[1m"                                 
p="\e[0;35m\033[1m"
c="\e[0;36m\033[1m"
gra="\e[0;37m\033[1m"


case `dpkg --print-architecture` in
aarch64)
    architectureURL="arm64" ;;
arm)
    architectureURL="arm" ;;
armhf)
    architectureURL="arm" ;;
amd64)
    architectureURL="amd64" ;;
i*86)
    architectureURL="386" ;;
x86_64)
    architectureURL="amd64" ;;
*)
    echo "${re}Arquitectura desconocida${en}"
esac

wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-${architectureURL}.zip -O ngrok.zip 
unzip ngrok.zip
rm ngrok.zip

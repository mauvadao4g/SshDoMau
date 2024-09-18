#!/bin/bash
#  MAUVADAO
#  VER 1.0.0
#  DATA: 24/08/2024
#  BAIXA OS ARQUIVOS DO GIT HUB
clear
echo 'Baixando os arquivos'
git pull

if [[ $? = 0 ]]
then
sleep 3
clear
echo
echo "MauDaVpn" | figlet
echo '##################'
echo "Baixado com Sucesso"
echo '##################'
cat ver[0-9]*.txt | tail -n 7

else
clear
echo "Algo deu errado"
fi

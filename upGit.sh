#!/bin/bash
# MAUVADAO
# VER 1.0.3
# FAÇA UPDATE DOS SEUS ARQUIVOS PRO GIT HUB DE FORMA MAIS RAPIDA E FACIL
# ATUALIZA O NUMERO DA VERSAO DO FILE AUTOMATICAMENTE
#
clear

# Pegando Token


mytoken='/storage/emulated/0/MAUVADAO/MAUVADAO_GITHHUB/MauDosBots/src/funcoes/myToken.sh'

if [ -f "$mytoken" ]; then
# echo "Encontrado"
 source "$mytoken"
# exit 0
else
# echo "Nao encontrado"
 source src/funcoes/myToken.sh
# exit 1
fi





# Função para enviar uma mensagem de texto
_enviar_msg() {

local token="$1"
local chat_id="$2"
local text="$3"
    
   response=$( url="https://api.telegram.org/bot$token/sendMessage"
    curl -s -X POST "$url" \
        -d "chat_id=$chat_id" \
        -d "text=$text" \
        -d "parse_mode=HTML"
)

  echo "$response" | grep -q '"ok":true'
  return $?

}



# Verifica se o arquivo foi encontrado
VER=$(ls *.txt | grep -oP "\bver[0-9]{1,}\.txt\b")
if [[ -z "$VER" ]]; then
    echo "Erro: Nenhum arquivo de versão encontrado."
     
    echo "#      ATUALIZADO
DATA: 27/08/2024
VER: 25
HORAS: 20:05

" > ver0.txt
    
#    exit 1
fi

# Criando as variáveis para o script
file=$(ls *.txt | grep -oP "ver[0-9]{1,}.txt" | head -n 1)
version=$(echo "$file" | grep -oP "[0-9]+")
new_version=$((version + 1))
new_file="ver${new_version}.txt"
horas="$(date +%d/%m/%Y_%R)"
# mensagem="---NEW UPDATE---"
mensagem="    ---NEW UPDATE---        "
notas="${1:-$mensagem}"



# Renomeando o arquivo para o próximo número de versão
mv "$file" "$new_file"
file="$new_file"

# Atualizando as informações de DATA, VER e HORAS no arquivo
sed -i "s|^DATA:.*|DATA: $(date +%d/%m/%Y)|" "$file"
sed -i "s|^VER:.*|VER: $new_version|" "$file"
sed -i "s|^HORAS:.*|HORAS: $(date +%R)|" "$file"

# Função para gerar logs para atualização
_logs(){
echo "............................." >> "$file"
 echo "● Update: $(date +%d/%m/%Y_%R)" >> "$file"
 echo "         VER: ${new_version}   " >> "$file"
echo "............................." >> "$file"
echo "○ $notas" >> "$file"
echo "............................." >> "$file"
echo '' >> "$file"
}

# Chamando a função de logs
_logs

echo "Atualizando repositório do GitHub"
echo ''
# Comando para fazer o upload para o GitHub
git add -A && git commit -m "Update: $(date +%d/%m/%Y_%R)" && git push && { clear; echo "Atualizado" | figlet; } || { clear; echo "ERROR" | figlet ;}


#   MOSTRANDO DADOS NA TELA
TELA=$(
GITHOME="SshDoMau"
# echo "$horas"
echo -e "\t  $GITHOME"
# echo "VER: $(echo "$file" | grep -oP "[0-9]+")"
# abrir o file.txt
 cat ver[0-9]*.txt | tail -n 7
)
# -----------||-----------#
echo "$TELA"


# Enviando mensagem ao Telegram
_enviar_msg $VENDASDOMAU $MAUVADAO "$TELA" >/dev/null 2>&1

#  Veridicar se foi envisdo corretamente
  status_msg=$?
  if [ $status_msg -eq 0 ]; then
    echo "Send: Enviada"
  else
    echo "Send: Algo deu errado"
    exit 1
  fi


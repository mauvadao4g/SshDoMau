#!/bin/bash

# Definir os termos para substituição
TERMO_ANTIGO="SshDoMau"
TERMO_NOVO="SshDoMau"

# Verificar se existem arquivos para processar
if [[ -z $(find . -type f) ]]; then
  echo "Nenhum arquivo encontrado para processar."
  exit 1
fi

# Substituir o termo em todos os arquivos da pasta atual e subpastas
find . -type f -exec sed -i "s|$TERMO_ANTIGO|$TERMO_NOVO|g" {} +

echo "Substituição concluída!"
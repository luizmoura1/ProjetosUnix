#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array associativo com chaves fixas (predefinidas)

clear
declare -A varr		
#declare -a chaves	(array indexado predefinido em design-time)
#declare -a c		(chave)
#declare -a valor	(entrada)

chaves=(iden nome sexo nota)

echo "____________________________________________________________________"
#read -p "Quantos elementos deseja inserir no array? " total
echo "Digite o valor para cada chave:"

for c in "${chaves[@]}"; do
  read -p "$c:	" valor
  varr["$c"]="$valor"
done

# Avaliação da nota
if (( ${varr[nota]} >= 7 )); then
  varr["aprv"]="true"
else
  varr["aprv"]="false"
fi

echo "____________________________________________________________________"
echo -e "Array:\t(${varr[@]})"			
echo -e "Chaves:\t${!varr[@]}"
echo -e "Número de elementos:\t${#varr[@]}"

echo "____________________________________________________________________"
echo -e "Loop pelas chaves:"
for c in "${!varr[@]}"; do
echo -e "$c\t${varr[$c]}"; done


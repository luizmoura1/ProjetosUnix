#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array associativo com chaves fixas (predefinidas)

clear
declare -A varr

# Lista de chaves predefinidas
campos=(nome email idade)

echo "____________________________________________________________________"
echo "Preencha os campos do registro:"
for chave in "${campos[@]}"; do
  read -p "$chave:	" valor
  varr["$chave"]="$valor"
done

echo "____________________________________________________________________"
echo -e "Array:\t(${varr[@]})"
echo -e "Chaves:\t${!varr[@]}"
echo -e "Número de elementos:\t${#varr[@]}"

echo "____________________________________________________________________"
echo -e "Loop pelas chaves:"
for chave in "${!varr[@]}"; do
  echo -e "$chave\t${varr[$chave]}"
done


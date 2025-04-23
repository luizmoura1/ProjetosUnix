#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array associativo com chaves predefinidas e tamanho fixo 

clear
declare -A varr		
declare -i total

chaves=(iden nome sexo nota)

read -p "Quantos registros deseja inserir? " total
echo
for ((r = 1; r <= total; r++)); do
	for c in "${chaves[@]}"; do
  		read -p "$c:	" valor
  		varr["$r,$c"]="$valor"
	done

	if (( ${varr["$r,nota"]} >= 5 )); then
  		varr["$r,aprv"]="true"
	else
  		varr["$r,aprv"]="false"
	fi
	echo
done

# Exibição dos registros usando printf
echo -e "Registros inseridos:\n"
printf "%-5s %-20s %-5s %-5s %-6s\n" "iden" "nome" "sexo" "nota" "aprv"

for ((r = 1; r <= total; r++)); do
  printf "%-5s %-20s %-5s %-5s %-6s\n" \
    "${varr["$r,iden"]}" \
    "${varr["$r,nome"]}" \
    "${varr["$r,sexo"]}" \
    "${varr["$r,nota"]}" \
    "${varr["$r,aprv"]}"
done

# Informações extras para depuração (comentadas, ative se desejar)
# echo -e "Array:\t(${varr[@]})"			
# echo -e "Chaves:\t${!varr[@]}"
# echo -e "Número de elementos:\t${#varr[@]}"


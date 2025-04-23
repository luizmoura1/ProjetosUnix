#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array associativo com chaves predefinidas e tamanho indefinido (com sentinela)

clear
declare -A varr		
declare -i total=0

chaves=(iden nome sexo nota)

echo -e "Preencha os registros. Para encerrar, deixe o campo 'iden' em branco.\n"
while true; do
	read -p "iden:	" valor
	[[ -z "$valor" ]] && break
	varr["$total,iden"]="$valor"

	for c in "${chaves[@]:1}"; do
  		read -p "$c:	" valor
  		varr["$total,$c"]="$valor"
	done

	if (( ${varr["$total,nota"]} >= 5 )); then
  		varr["$total,aprv"]="true"
	else
  		varr["$total,aprv"]="false"
	fi

	((total++))
	echo
done

echo -e "Registros inseridos:\n"
for ((r = 0; r < total; r++)); do
	for c in "${chaves[@]}"; do
		echo -ne "${varr["$r,$c"]}\t"
	done
	echo "${varr["$r,aprv"]}"
done

# echo -e "Array:\t(${varr[@]})"			
# echo -e "Chaves:\t${!varr[@]}"
# echo -e "Número de elementos:\t${#varr[@]}"


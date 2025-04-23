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

echo -e "Registros inseridos:\n"
#echo -e "iden\tnome\tsexo\tnota\taprv"
for ((r = 1; r <= total; r++)); do
	for c in "${chaves[@]}"; do
	echo -ne "${varr["$r,$c"]}\t"; done	# $c\t
  	echo "${varr["$r,aprv"]}"		# -e aprv\t
done

#echo -e "Array:\t(${varr[@]})"			
#echo -e "Chaves:\t${!varr[@]}"
#echo -e "Número de elementos:\t${#varr[@]}"


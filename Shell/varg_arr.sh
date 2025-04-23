#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array com entrada via teclado (linha única com read -a)

clear
# Definição - opcional para arrays indexados 
# declare -a varr=()

echo "____________________________________________________________________"
echo "Digite todos os valores do array em uma única linha (separados por espaço):"
read -a varr

echo "____________________________________________________________________"
echo -e "Array:\t(${varr[@]})"				#  (${varr[@|*]})
echo -e "Índices:\t${!varr[@]}"				#  ${!varr[@|*]}	
echo -e "Número de elementos:\t${#varr[@]}"		#  ${#varr[@|*]}	

echo "______________________________________________________________"
echo -e "Loop pelos índices:"
#function indices() {
	for _ in "${!varr[@]}"; do			
	echo -e "$_\t${varr[$_]}"; done
#}
#indices 	# argumento "${varr[@]}" opcional porque varr é global

echo "______________________________________________________________"




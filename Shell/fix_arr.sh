#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array com entrada via teclado (número fixo de elementos)

clear
# Definição - opcional para arrays indexados 
# declare -a varr=()
# As duas linhas a seguir são opcionais e redundantes
#declare -a varr
#varr=()

echo "____________________________________________________________________"
read -p "Quantos elementos deseja inserir no array? " total
echo "Digite o valor para cada índice:"
# Atribuição
for((i = 0; i < total; i++)); do
	read -p "$i:	" varr[i]
done

echo "____________________________________________________________________"
echo -e "Array:\t(${varr[@]})"			#  (\${varr[@|*]})			
echo -e "Índices:\t${!varr[@]}"			#  (\${!varr[@|*]})
echo -e "Número de elementos:\t${#varr[@]}"	#  (\${#varr[@|*]})

echo "______________________________________________________________"
echo -e "Loop com elementos separados:"
for _ in "${varr[@]}"; do
echo "$_"; done

echo "______________________________________________________________"
echo -e "Loop com elementos não separados:"
for _ in "${varr[*]}"; do
echo "$_"; done

echo "______________________________________________________________"
echo -e "Loop pelos índices:"
function indices() {
	for _ in "${!varr[@]}"; do
	echo -e "$_\t${varr[$_]}"; done
}
indices 	# argumento "${varr[@]}" opcional porque varr é global

echo "______________________________________________________________"
echo -e "Loop pelo comprimento:"
function length() {
	for((i = 0; i < total; i++)); do	# 'total' é igual a ${#varr[@|*]}
	echo -e "$i\t${varr[$i]}"; done
}
length		 # argumento "${varr[@]}" opcional porque varr é global

echo "______________________________________________________________"


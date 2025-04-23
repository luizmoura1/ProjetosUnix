#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array com entrada via teclado (número indefinido de elementos)

clear
declare -A varr		# declaração obrigatória de array associativo	
# declare -a chave
# declare -a valor

# varr=()		# inicialização desnecessária

echo "____________________________________________________________________"
echo "Digite os pares chave/valor (Pressione ENTER na chave para encerrar):"

while :; do
	read -p "Chave:	" chave
	[[ -z "$chave" ]] && break
	read -p "Valor para '$chave':	" valor
	varr["$chave"]="$valor"
done

echo "____________________________________________________________________"
echo -e "Array:\t(${varr[@]})"			#  (\${varr[@|*]})			
echo -e "Chaves:\t${!varr[@]}"			#  \${!varr[@|*]}
echo -e "Número de elementos:\t${#varr[@]}"	#  \${#varr[@|*]}

echo "______________________________________________________________"
echo -e "Loop pelas Chaves:"
#function keys() {
	for _ in "${!varr[@]}"; do
	echo -e "$_\t${varr[$_]}"; done
#}
#keys 	# argumento "${varr[@]}" opcional porque varr é global

echo "______________________________________________________________"


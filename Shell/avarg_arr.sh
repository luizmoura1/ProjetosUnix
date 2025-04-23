#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array com entrada via teclado (linha única com read -a)

clear
declare -A varr		# declaração obrigatória de array associativo	
# declare -a entrada
# declare -a chave
# declare -a valor
# declare -i i=0	declara e inicializa redundantemente

# varr=()		inicialização desnecessária

echo "____________________________________________________________________"
echo "Digite os pares chave/valor em uma única linha (separados por espaço):"
read -a entrada
# Aviso para número ímpar de elementos
#(( ${#entrada[@]} % 2 != 0 )) && echo -e "\n⚠️  Aviso: número ímpar de elementos; a última chave não terá valor.\n"

for ((i = 0; i < ${#entrada[@]}; i += 2)); do
  chave="${entrada[i]}"
  valor="${entrada[i+1]}"
  varr["$chave"]="$valor"
done

echo "____________________________________________________________________"
echo -e "Array:\t(${varr[@]})"				#  (${varr[@|*]})
echo -e "Chaves:\t${!varr[@]}"				#  ${!varr[@|*]}	
echo -e "Número de elementos:\t${#varr[@]}"		#  ${#varr[@|*]}	

echo "______________________________________________________________"
echo -e "Loop pelas chaves:"
#function keys() {
	for _ in "${!varr[@]}"; do			
	echo -e "$_\t${varr[$_]}"; done
#}
#keys 	# argumento "${varr[@]}" opcional porque varr é global

echo "______________________________________________________________"




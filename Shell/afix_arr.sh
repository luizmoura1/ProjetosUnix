#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array com entrada via teclado (número fixo de elementos)

clear
declare -A varr		# declaração obrigatória de array associativo	
declare -i total	# converte entrada inválida em 0 (zero) 
# declare -a chave
# declare -a valor
# declare -i i=0	declara e inicializa redundantemente

#varr=()		inicialização desnecessária

echo "____________________________________________________________________"
read -p "Quantos elementos deseja inserir no array? " total
echo "Digite o valor para cada chave:"

for ((i = 1; i <= total; i++)); do
  read -p "Chave #$i:	" chave
  read -p "Valor para '$chave':	" valor
  varr["$chave"]="$valor"
done

echo "____________________________________________________________________"
echo -e "Array:\t(${varr[@]})"			#  (\${varr[@|*]})			
echo -e "Chaves:\t${!varr[@]}"			#  (\${!varr[@|*]})
echo -e "Número de elementos:\t${#varr[@]}"	#  (\${#varr[@|*]})

echo "____________________________________________________________________"
echo -e "Loop pelas chaves:"
#function keys() {
	for _ in "${!varr[@]}"; do
	echo -e "$_\t${varr[$_]}"; done
#}
#keys 	# argumento "${varr[@]}" opcional porque varr é global


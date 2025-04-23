#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array com entrada via teclado como argumentos ????/

clear
# Definição - opcional para arrays indexados 
# declare -a varr=()
# declare -a entrada
# declare -i i=0 - opcional, declara e inicializa, dispensa a próxima linha
i=0

echo "____________________________________________________________________"
echo "Digite os valores para o array (Pressione ENTER para encerrar):"
# Atribuição
while :; do
	read -p "$i:	" entrada
	[[ -z "$entrada" ]] && break
	varr[i]="$entrada"	# Atribui o valor à variável apenas se não for vazio
	((i++))  		# Incrementa o índice após o valor ser atribuído
done

echo "____________________________________________________________________"
echo -e "Array:\t(${varr[@]})"			#  (\${varr[@|*]})			
echo -e "Índices:\t${!varr[@]}"			#  \${!varr[@|*]}
echo -e "Número de elementos:\t${#varr[@]}"	#  \${#varr[@|*]}

echo "______________________________________________________________"
echo -e "Loop pelos índices:"
#function indices() {
	for i in "${!varr[@]}"; do
	echo -e "$i\t${varr[$i]}"; done
#}
#indices 	# argumento "${varr[@]}" opcional porque varr é global

echo "______________________________________________________________"


#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array indexado

clear
declare -a index_arr
index_arr=([0]=do [1]=re [2]=mi)			# (do re mi)

echo "______________________________________________________________"
echo "Número de elementos (\$#): ${#index_arr[@]}"	# ${#index_arr[*]}

index_arr+=(fa sol la)
echo "______________________________________________________________"
echo "Número de elementos (\$#): ${#index_arr[@]}"	# ${#index_arr[*]}

index_arr[6]=si
echo "______________________________________________________________"
echo "Número de elementos (\$#): ${#index_arr[@]}"	# ${#index_arr[*]}

#index_arr=(do re mi fa sol la si)

echo "______________________________________________________________"
echo "Lista de índíces (\$_) e elementos (\${\$_}):"
for _ in "${!index_arr[@]}"; do				# ${!index_arr[*]} causa erro!
echo "$_    ${index_arr[$_]}"; done

echo "______________________________________________________________"
echo "Lista de índíces (\$i) e elementos (\${\$i}) - argumento de função:"
function Iteration
{
	size=${#index_arr[@]}
	for ((i = 0; i < size; i++)); do
	echo $i "  " ${index_arr[$i]}; done	# eval " echo \"\$i    \${index_arr[$i]}\" "
}
Iteration ${index_arr[@]}

echo "______________________________________________________________"
echo "Lista de elementos separados (\$@):"
for _ in "${index_arr[@]}"; do
echo "$_"; done

echo "______________________________________________________________"
echo "Lista de elementos interpretados como uma única string (\$*):"
for _ in "${index_arr[*]}"; do
echo "$_"; done

echo "______________________________________________________________"
echo "Listando 4 elementos a partir do terceiro:"
echo ${index_arr[@]:2:4}				# ${index_arr[*]:2:4}

echo "______________________________________________________________"
echo "Eliminando-se o quarto elemento da lista:"
unset index_arr[3]
echo "index_arr = (" ${index_arr[@]} ")"		# ${index_arr[*]}

echo "______________________________________________________________"
echo "Eliminando-se todos elementos da lista:"
unset index_arr
echo "index_arr = (" ${index_arr[@]} ")"		# ${index_arr[*]}



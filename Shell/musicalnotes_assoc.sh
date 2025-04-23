#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array associativo

clear
declare -A assoc_arr
assoc_arr=([C]=do [D]=re [E]=mi)

echo "______________________________________________________________"
echo "Número de elementos (\$#): ${#assoc_arr[@]}"	# ${#assoc_arr[*]}

assoc_arr+=([F]=fa [G]=sol [A]=la)
echo "______________________________________________________________"
echo "Número de elementos (\$#): ${#assoc_arr[@]}"	# ${#assoc_arr[*]}

assoc_arr[B]=si
echo "______________________________________________________________"
echo "Número de elementos (\$#): ${#assoc_arr[@]}"	# ${#assoc_arr[*]}

echo "______________________________________________________________"
echo "Lista de índíces (\$_) e elementos (\${\$_}):"
for _ in "${!assoc_arr[@]}"; do				# ${!assoc_arr[*]} causa erro!
echo "$_    ${assoc_arr[$_]}"; done

echo "______________________________________________________________"
echo "Lista de índíces (\$i) e elementos (\${\$i}) - argumento de função:"
function Iteration
{
	for i in "${!assoc_arr[@]}"; do
	echo "$i    ${assoc_arr[$i]}"; done	# eval " echo \"\$i    \${assoc_arr[$i]}\" "
}
Iteration ${assoc_arr[@]}

echo "______________________________________________________________"
echo "Lista de elementos separados (\$@):"
for _ in "${assoc_arr[@]}"; do
echo "$_"; done

echo "______________________________________________________________"
echo "Lista de elementos interpretados como uma única string (\$*):"
for _ in "${assoc_arr[*]}"; do
echo "$_"; done

echo "______________________________________________________________"
echo "Listando 4 elementos a partir do terceiro:"
echo ${assoc_arr[@]:2:4}				# ${assoc_arr[*]:2:4}

echo "______________________________________________________________"
echo "Eliminando-se o quarto elemento da lista:"
unset assoc_arr[F]
echo "assoc_arr = (" ${assoc_arr[@]} ")"		# ${assoc_arr[*]}

echo "______________________________________________________________"
echo "Eliminando-se todos elementos da lista:"
unset assoc_arr
echo "assoc_arr = (" ${assoc_arr[@]} ")"		# ${assoc_arr[*]}


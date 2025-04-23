#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array indexado

clear
#declare -a varr

# Definição
varr=()
echo "____________________________________________________________________"
echo -e "Array (\${varr[@|*]}):\t(${varr[@]})"
echo -e "Índices (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?	
echo -e "Número de elementos (\${#varr[@|*]}):\t${#varr[@]}"	

varr=(do re mi)						# ([0]=do [1]=re [2]=mi)
echo "____________________________________________________________________"
echo -e "Array (\${varr[@|*]}):\t(${varr[@]})"			
echo -e "Índices (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?
echo -e "Número de elementos (\${#varr[@|*]}):\t${#varr[@]}"	

varr+=([3]=fa [4]=sol [5]=la)				# (fa sol la)
echo "____________________________________________________________________"
echo -e "Array (\${varr[@|*]}):\t(${varr[@]})"			
echo -e "Índices (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?
echo -e "Número de elementos (\${#varr[@|*]}):\t${#varr[@]}"	

# Atribuição
varr[6]=si
echo "____________________________________________________________________"
echo -e "Array (\${varr[@|*]}):\t(${varr[@]})"			
echo -e "Índices (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?
echo -e "Número de elementos (\${#varr[@|*]}):\t${#varr[@]}"	

echo "______________________________________________________________"
echo -e "Loop com elementos separados (for value in \${varr[@]}):"
for _ in "${varr[@]}"; do
echo "$_"; done

echo "______________________________________________________________"
echo -e "Loop com elementos não separados (for value in \${varr[*]}):"
for _ in "${varr[*]}"; do
echo "$_"; done

echo "______________________________________________________________"
echo -e "Loop pelos índices (for _ in \${!varr[@]} ... \$_   \${varr[\$_]}):"
function indices() {
	for _ in "${!varr[@]}"; do			# [*] causa erro! Por quê?
	echo -e "$_\t${varr[$_]}"; done
}
indices ${varr[@]}

echo "______________________________________________________________"
echo -e "Loop pelo comprimento (for i < size ... \$i   \${varr[\$i]}):"
function length() {
	size=${#varr[@]}				# ${#varr[@|*]}
	for((i = 0; i < size; i++)); do
	echo -e "$i\t${varr[$i]}"; done
}
length ${varr[@]}

echo "______________________________________________________________"
echo "Listando 4 elementos a partir do terceiro:"
echo -e "\${varr[@|*]:2:4}:\t${varr[@]:2:4}"

echo "______________________________________________________________"
echo "Eliminando-se o quarto elemento da lista:"
unset varr[3]
echo -e "unset varr[3]\t\${varr[@|*]}:\t(${varr[@]})"
echo -e "Índices (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?

echo "______________________________________________________________"
echo "Eliminando-se todos elementos da lista:"
unset varr
echo -e "unset varr\t\${varr[@|*]}:\t(${varr[@]})"

# [*] funciona em ${!varr[*]}, mas não em 'for _ in "${!varr[*]}"'
# porque a expansão com [*] gera uma string única com todas as chaves,
# enquanto [@] preserva os elementos separados (mais adequado para loops)


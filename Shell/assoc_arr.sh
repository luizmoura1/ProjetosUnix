#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array associativo

clear
declare -A varr						  # Declaração obrigatória

# Definição
varr=()
echo "____________________________________________________________________"
echo -e "Array (\${varr[@|*]}):\t(${varr[@]})"
echo -e "Chaves (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?	
echo -e "Número de elementos (\${#varr[@|*]}):\t${#varr[@]}"	

varr=([C]=do [D]=re [E]=mi)
echo "____________________________________________________________________"
echo -e "Array (\${varr[@|*]}):\t(${varr[@]})"			
echo -e "Chaves (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?
echo -e "Número de elementos (\${#varr[@|*]}):\t${#varr[@]}"	

varr+=([F]=fa [G]=sol [A]=la)
echo "____________________________________________________________________"
echo -e "Array (\${varr[@|*]}):\t(${varr[@]})"			
echo -e "Chaves (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?
echo -e "Número de elementos (\${#varr[@|*]}):\t${#varr[@]}"	

# Atribuição
varr[B]=si
echo "____________________________________________________________________"
echo -e "Array (\${varr[@|*]}):\t(${varr[@]})"			
echo -e "Chaves (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?
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
echo -e "Loop pelas chaves (for _ in \${!varr[@]} ... \$_   \${varr[\$_]}):"
function keys() {
	for _ in "${!varr[@]}"; do			# [*] causa erro! Por quê?
	echo -e "$_\t${varr[$_]}"; done
}
keys "${varr[@]}"

echo "______________________________________________________________"
echo -e "Loop pelo comprimento (não aplicável diretamente a arrays associativos):"
echo -e "As chaves não são numéricas, portanto não é possível iterar com for ((... i < size ...))"

echo "______________________________________________________________"
echo "Listando 4 elementos a partir do SEGUNDO:"
echo -e "\${varr[@|*]:2:4}:\t${varr[@]:2:4}"

echo "______________________________________________________________"
echo "Eliminando-se o SEGUNDO elemento da lista:"
unset varr[F]
echo -e "unset varr[F]\t\${varr[@|*]}:\t(${varr[@]})"
echo -e "Chaves (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?

echo "______________________________________________________________"
echo "Eliminando-se todos elementos da lista:"
unset varr
echo -e "unset varr\t\${varr[@|*]}:\t(${varr[@]})"

# [*] funciona em ${!varr[*]}, mas não em 'for _ in "${!varr[*]}"'
# porque a expansão com [*] gera uma string única com todas as chaves,
# enquanto [@] preserva os elementos separados (mais adequado para loops)


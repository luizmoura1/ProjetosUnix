#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array com argumentos posicionais ($@) e índice via array nomeado

clear
#declare -a varr

# Definição
varr=("$@")
echo "____________________________________________________________________"
echo "Nome do script (\$0): $0"
echo "____________________________________________________________________"
echo -e "Array (\$@):\t($@)"				# (\${varr[@|*]}):\t(${varr[@]})
echo -e "Índices (\${!varr[@|*]}):\t${!varr[@]}"	# [*] não causa erro! Por quê?	
echo -e "Número de elementos (\$#):\t$#"		# (\${#varr[@|*]}):\t${#varr[@]}	

echo "______________________________________________________________"
echo -e "Loop com elementos separados (for value in \$@):"	# (for value in \${varr[@]})
for _ in "$@"; do						# "${varr[@]}"
echo "$_"; done

echo "______________________________________________________________"
echo -e "Loop com elementos não separados (for value in \$*):"	# (for value in \${varr[*]})
for _ in "$*"; do						# "${varr[*]}"
echo "$_"; done

echo "______________________________________________________________"
echo -e "Loop pelos índices (for _ in \${!varr[@]} ... \$_   \${varr[\$_]}):"
function indices() {
	for _ in "${!varr[@]}"; do			# [*] causa erro! Por quê?
	echo -e "$_\t${varr[$_]}"; done
}
indices "${varr[@]}"

echo "______________________________________________________________"
echo -e "Loop pelo comprimento (for i < size ... \$i   \${varr[\$i]}):"
function length() {
	size=$#						# ${#varr[@|*]}
	# for((i = 1; i <= size; i++)); do
	# eval "echo \"\$((i-1))       \${$i}\""; done
	for((i = 0; i < size; i++)); do
	echo -e "$i\t${varr[$i]}"; done
}
length "$@"

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

if [ $# == 0 ]; then
echo "______________________________________________________________"
echo "Inclua argumentos separados por espaço na linha de comando!"; fi

# [*] funciona em ${!varr[*]}, mas não em 'for _ in "${!varr[*]}"'
# porque a expansão com [*] gera uma string única com todas as chaves,
# enquanto [@] preserva os elementos separados (mais adequado para loops)

# Linhas 14, (28 e) 30, e 52:
# Para listar os índices com ${!...}, é necessário um nome de array.
# $@ não tem nome acessível para isso — por isso usamos: varr=("$@")


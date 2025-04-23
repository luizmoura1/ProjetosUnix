#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array de argumentos

clear
echo "______________________________________________________________"
echo "Nome do script (\$0): $0"
echo "______________________________________________________________"
echo "Número de argumentos (\$#): $#"
args_arr=("$@")

echo "______________________________________________________________"
echo "Lista de índíces (\$_) e elementos (\${\$_}):"
for _ in "${!args_arr[@]}"; do
echo "$_    ${args_arr[$_]}"; done

echo "______________________________________________________________"
echo "Lista de índíces (\$i) e argumentos (\${\$i}) - argumento de função:"
# for ((i = 1; i <= size; i++)); do
# eval " echo \"\$i    \${$i}\" "; done
function Iteration
{
	size=${#args_arr[@]}			# size=$#
	for ((i = 0; i < size; i++)); do
	echo "$i    ${args_arr[$i]}"; done
}
Iteration "${args_arr[@]}"

echo "______________________________________________________________"
echo "Lista de argumentos separados (\$@):"
for _ in "$@"; do				# {args_arr[@]}
echo "$_"; done
echo "______________________________________________________________"
echo "Lista de argumentos interpretados como uma única string (\$*):"
for _ in "$*"; do				# {args_arr[*]}
echo "$_"; done

if [ $# == 0 ]; then
echo "______________________________________________________________"
echo "Inclua argumentos separados por espaço na linha de comando!"; fi

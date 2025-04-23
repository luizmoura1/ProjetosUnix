#!/usr/bin/env bash
# Autor: Luiz
# Este script demonstra o uso de variáveis especiais em Shell Scripting.

clear
echo "Nome do script: $0"
echo "_____________________"
echo "Número de argumentos: $#"
for ((i = 1; i <= $#; i++)); do
    eval "echo \"Argumento \$i: \${$i}\""
done
echo "________________________________________"
echo "Lista de argumentos, mantendo separação:"
for ARG in "$@"; do
	echo "$ARG"
done
echo "________________________________________________________"
echo "Lista de argumentos interpretados como uma única string:"
for ARG in "$*"; do
	echo "$ARG"
done
echo -e "\n\nInclua argumentos na linha de comando para entender melhor as variáveis:"
echo "\$0 - Nome do script"
echo "\$# - Número total de argumentos"
echo "\$n - Enésimo argumento (ex: \$1, \$2, ...)"
echo "\$@ - Lista de argumentos, mantendo separação"
echo "\$* - Lista de argumentos interpretados como uma única string"
echo -e "\n\n📌 Outras variáveis especiais úteis:"
echo "\$? - Código de saída do último comando"
echo "\$$ - PID do shell atual"
echo "\$! - PID do último comando em background"


#!/usr/bin/env bash

SEPARADOR="---------------------"

escrever(){
	echo "$SEPARADOR"
	read -p "Informe Id: " ID
	read -p "Informe Nome: " NOME
	read -p "Informe Sexo: " SEXO
	read -p "Informe Nota: " NOTA
	echo "$SEPARADOR"
	REGISTRO+=("$ID $NOME $SEXO $NOTA")
}

ler(){
	echo "$SEPARADOR"
	echo "${REGISTRO[@]}"
	# [[ ${#REGISTRO[@]} -eq 0 ]] && echo "Nenhum registro encontrado." || printf "%s\n" "${REGISTRO[@]}"
	echo "$SEPARADOR"
	read -p "Pressione Enter para continuar..."
}

while true; do
	clear
	echo "------ M E N U ------"
	echo "1 - Inserir registro"
	echo "2 - Exibir registro"
	echo "Qualquer outra tecla para sair"
	read -p "Opção: " NUMERO

	case $NUMERO in
		1) escrever ;;
		2) ler ;;
		*) echo "FIM"; break ;;
	esac
done


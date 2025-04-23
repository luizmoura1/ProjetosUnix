#!/usr/bin/env bash

escrever(){
	echo "---------------------"
	read -p "Informe Id: " ID
	read -p "Informe Nome: " NOME
	read -p "Informe Sexo: " SEXO
	read -p "Informe Nota: " NOTA
	echo "---------------------"
	REGISTRO+=("$ID $NOME $SEXO $NOTA")
}

ler(){
	echo "--------------------"
	for i in "${REGISTRO[@]}"; do
		echo $i
	done
	echo "--------------------"
}

echo "----- M E N U -----"
echo "1 - inserir registro"
echo "2 - exibir registro"
echo "0 - sair"

NUMERO=-1
while [ $NUMERO -ne 0 ]; do
	read -p "Opção: " NUMERO
	case "$NUMERO" in		# poderia ser sem as aspas duplas, isto é, case $NUMERO in 
		1) escrever
		;;
		2) ler
		;;
	esac
done
	



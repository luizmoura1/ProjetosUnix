#!/usr/bin/env bash

escrever(){
	echo "---------------------"
	read -p "Informe Id: " ID
	read -p "Informe Nome: " NOME
	read -p "Informe Sexo: " SEXO
	read -p "Informe Nota: " NOTA
	echo "---------------------"
	REGISTRO[$CONT]="$ID $NOME $SEXO $NOTA"; CONT=$((CONT+1))
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

CONT=0
NUMERO=-1
while [ $NUMERO -ne 0 ]; do
	read -p "Opção: " NUMERO
	if [ $NUMERO == 1 ];then
		escrever
	fi		
	if [ $NUMERO == 2 ];then
		ler
	fi
done
	



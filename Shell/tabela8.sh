#!/usr/bin/env bash

escrever(){
	echo "---------------------"
	read -p "Informe Id: " ID
	read -p "Informe Nome: " NOME
	read -p "Informe Sexo: " SEXO
	read -p "Informe Nota: " NOTA
	echo "---------------------"
	REGISTRO+=("$ID $NOME $SEXO $NOTA")		# string: REGISTRO+="$ID $NOME $SEXO $NOTA"
}

ler(){
	echo "--------------------"
	for i in "${REGISTRO[@]}"; do			# aspas duplas são necessárias, * mantém registros na mesma linha, @ mantém registros em linhas separadas
		echo $i					# aspas duplas, echo "$i", dão o mesmo resultado
	done
	echo "--------------------"
}

NUMERO=-1
while [ $NUMERO -ne 0 ]; do
	echo "----- M E N U -----"
	echo "1 - inserir registro"
	echo "2 - exibir registro"
	echo "0 - sair"
	
	read -p "Opção: " NUMERO
	case $NUMERO in
		1) escrever
		;;
		2) ler
		;;
	esac
	clear						# inclusão de clear causa erro!
done
	



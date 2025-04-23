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
	echo "---------------------"
	for i in "${REGISTRO[@]}"; do
		echo $i
	done
	echo "---------------------"
}

NUMERO=-1
while [ $NUMERO -ne 0 ]; do
	clear
	echo "------ M E N U ------"
	echo "1 - Inserir registro"
	echo "2 - Exibir registro"
	echo "0 - Sair"
	
    	while true; do
		read -p "Opção: " NUMERO
        	[[ -n "$NUMERO" ]] && break
    	done

	case $NUMERO in
		1) escrever ;;
		2) ler ;;
		*) echo "FIM" ;;
	esac
	sleep 1
done
	



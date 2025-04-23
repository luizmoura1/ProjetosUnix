#!/usr/bin/env bash

escrever(){
	echo "---------------------"
	read -p "Informe Id: " id
	read -p "Informe Nome: " nome
	read -p "Informe Sexo: " sexo
	read -p "Informe Nota: " nota
	echo "---------------------"
	echo "$id $nome $sexo $nota" >> registros.txt
}

ler(){
	echo "---------------------"
	cat registros.txt 2>/dev/null
	echo "---------------------"
	read -p "Pressione Enter para continuar..."
}

while true; do
	clear
	echo "------ M E N U ------"
	echo "1 - Inserir registro"
	echo "2 - Exibir registro"
	echo "Qualquer outra tecla para sair"
	read -p "Opção: " numero

	case $numero in
		1) escrever ;;
		2) ler ;;
		*) echo "FIM"; break ;;
	esac
done


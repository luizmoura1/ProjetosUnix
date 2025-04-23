#!/usr/bin/env bash

abrir_arquivo(){
    read -p "Nome do arquivo (Enter para padrão): " arquivo
    [[ -z "$arquivo" ]] && arquivo="registros.txt"
}

escrever(){
	echo "---------------------"
	read -p "Informe Id: " iden
	read -p "Informe Nome: " nome
	read -p "Informe Sexo: " sexo
	read -p "Informe Nota: " nota
	echo "---------------------"
	echo "$iden $nome $sexo $nota" >> "$arquivo"
}

ler(){
	echo "---------------------"
	cat "$arquivo" 2>/dev/null
	echo "---------------------"
	read -p "Pressione Enter para continuar..."
}

abrir_arquivo

while :; do
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

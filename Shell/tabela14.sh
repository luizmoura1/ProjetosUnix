#!/usr/bin/env bash
arquivo="registros.txt"

escrever(){
	echo "---------------------"
	read -p "Informe Id: " id
	read -p "Informe Nome: " nome
	read -p "Informe Sexo: " sexo
	read -p "Informe Nota: " nota
	echo "---------------------"
	echo "$id $nome $sexo $nota" >> "$arquivo"
}

ler(){
	echo "---------------------"
	cat "$arquivo" 2>/dev/null
	echo "---------------------"
	read -p "Pressione Enter para continuar..."
}

renomear(){
	until [[ -n "$arquivo" || ! -e "$arquivo" ]]; do
		read -p "Nome do arquivo: " arquivo
	done
}

while :; do
	clear
	echo "------ M E N U ------"
	echo "1 - Inserir registro"
	echo "2 - Exibir registro"
	echo "3 - Novo arquivo"
	echo "Qualquer outra tecla para sair"
	read -p "Opção: " numero

	case $numero in
		1) escrever ;;
		2) ler ;;
		3) renomear ;;
		*) echo "FIM"; break ;;
	esac
done


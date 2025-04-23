#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array associativo com chaves predefinidas e tamanho indefinido
# e menu para operações de arquivo

clear
declare -A varr

chaves=(iden nome sexo nota)
arquivo=""
total=0
#registr os
abrir_arquivo(){
	read -p "Digite o nome do arquivo (ENTER para padrão): " nome
	arquivo="${nome:-registros}.txt"
	[[ ! -f "$arquivo" ]] && touch "$arquivo"
}

carregar_array(){
	while IFS=$'\t' read -r iden nome sexo nota aprv; do
        	varr["$total,iden"]="$iden"
        	varr["$total,nome"]="$nome"
        	varr["$total,sexo"]="$sexo"
        	varr["$total,nota"]="$nota"
        	varr["$total,aprv"]="$aprv"
        	((total++))
    	done < "$arquivo"
}

inserir_registros(){
    	echo -e "\nPreencha os registros.\nPara voltar ao menu, deixe o campo 'iden' em branco.\n"
    	while :; do
        	read -p "iden:	" valor
        	[[ -z "$valor" ]] && break
        	varr["$total,iden"]="$valor"
        	for c in "${chaves[@]:1}"; do
            		read -p "$c:	" valor
            		varr["$total,$c"]="$valor"
        	done
        	if (( ${varr["$total,nota"]} >= 5 )); then
            		varr["$total,aprv"]="true"
        	else
            		varr["$total,aprv"]="false"
        	fi
        	((total++))
        	echo
	done
}

exibir_registros(){
	echo "Conteúdo do arquivo '$arquivo':"
	echo "-------------------------------------"
    	for ((r = 0; r < total; r++)); do
        	printf "%s\t%s\t%s\t%s\t%s\n" \
            	"${varr["$r,iden"]}" \
            	"${varr["$r,nome"]}" \
            	"${varr["$r,sexo"]}" \
            	"${varr["$r,nota"]}" \
            	"${varr["$r,aprv"]}"
    	done
	echo "-------------------------------------"
}

salvar_array(){
	echo -e "\nDeseja salvar os registros? [s/N]"
    	read -r resposta
    	[[ ! "$resposta" =~ ^[sS]$ ]] && return

	exec 3> "$arquivo"

    	for ((r = 0; r < total; r++)); do
        	printf "%s\t%s\t%s\t%s\t%s\n" \
            	"${varr["$r,iden"]}" \
            	"${varr["$r,nome"]}" \
            	"${varr["$r,sexo"]}" \
            	"${varr["$r,nota"]}" \
            	"${varr["$r,aprv"]}" >&3
    	done
    	exec 3>&-
    	echo "Registros salvos em '$arquivo'."
}

abrir_arquivo
carregar_array

while :; do
	clear
	echo "------ M E N U ------"
	echo "1 - Inserir registro"
	echo "2 - Exibir registro"
    	echo "3 - Sair"
	read -p "Escolha uma opção: " opc
    	case "$opc" in
        	1) inserir_registros ;;
        	2) exibir_registros ;;
        	3) salvar_array; echo "FIM"; break ;;
        	*) echo "Opção inválida." ;;
    	esac
    	read -p "Pressione qualquer tecla para voltar ao menu..."
done

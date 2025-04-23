#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: chaves predefinidas e tamanho indefinido
# e menu para operações de arquivo

clear
arquivo=""

abrir_arquivo(){
	read -p "Digite o nome do arquivo (ENTER para padrão): " nome
	arquivo="${nome:-registros}.txt"
	[[ ! -f "$arquivo" ]] && touch "$arquivo"
}

carregar_arquivo() {
	linhas=""
	while IFS= read -r linha || [[ -n $linha ]]; do
        	[[ -n "$linhas" ]] && linhas+=$'\n'
        	linhas+="$linha"
        done < "$arquivo"
}

inserir_registros() {
    echo -e "\nPreencha os registros.\nPara voltar ao menu, deixe o campo 'iden' em branco.\n"
    while :; do
        read -p "iden:	" iden
        [[ -z "$iden" ]] && break
        read -p "nome:	" nome
        read -p "sexo:	" sexo
        read -p "nota:	" nota

        if (( nota >= 5 )); then
            aprv="true"
        else
            aprv="false"
        fi
        [[ -n "$linhas" ]] && linhas+=$'\n'
        linhas+="${iden}\t${nome}\t${sexo}\t${nota}\t${aprv}"
        echo
    done
}

exibir_registros(){
	echo "Conteúdo do arquivo '$arquivo':"
	echo "-------------------------------------"
	echo -e "$linhas"
	echo "-------------------------------------"
}

salvar_arquivo(){
    echo -e "\nDeseja salvar os registros? [s/N]"
    read -r resposta
    [[ ! "$resposta" =~ ^[sS]$ ]] && return
    exec 3> "$arquivo"
    echo -e "$linhas" >&3
    exec 3>&-
    echo "Registros salvos em '$arquivo'."
}


abrir_arquivo
carregar_arquivo

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
        	3) salvar_arquivo; echo "FIM"; break ;;
        	*) echo "Opção inválida." ;;
    	esac
    	read -p "Pressione qualquer tecla para voltar ao menu..."
done

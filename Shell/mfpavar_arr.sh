#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array associativo com chaves predefinidas e tamanho indefinido
# e menu para operações de arquivo

clear
declare -A varr		
declare -i total=0

chaves=(iden nome sexo nota)
arquivo="registros1.txt"

inserir(){
	echo -e "Preencha os registros. Para encerrar deixe o campo iden em branco.\n"
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

	for ((r = 0; r < total; r++)); do
		for c in "${chaves[@]}"; do
			echo -ne "${varr["$r,$c"]}\t" >> "$arquivo"
		done
  		echo "${varr["$r,aprv"]}" >> "$arquivo"
	done
	
	#0 não ok, todos true, repete todos false
    	#unset varr
    	
    	#1 ok, mas repete
    	#for k in "${!varr[@]}"; do
        #	unset "varr[$k]"
    	#done
    	
    	#2 ok, mas repete
    	#varr=()
    	
    	#3 ok, mas repete
    	#unset varr
    	#declare -gA varr
}

exibir(){
	#0 não ok
    	#unset varr
    	#declare -A varr
    	
    	#1 ok
    	#for k in "${!varr[@]}"; do
        #	unset "varr[$k]"
    	#done
    	
    	#2 ok
    	#varr=()
    	
    	#3 ok
    	#unset varr
    	#declare -gA varr
    
    	total=0

	# Verificar se o arquivo existe
    	if [[ ! -f "$arquivo" ]]; then
        	echo "Arquivo $arquivo não encontrado. Nenhum dado para carregar."
        	return
    	fi
    	
    	# Ler dados do arquivo e carregar no array
    	echo -e "Carregando dados do arquivo...\n"
    	while IFS=$'\t' read -r iden nome sexo nota aprov; do
        	varr["$total,iden"]="$iden"
        	varr["$total,nome"]="$nome"
        	varr["$total,sexo"]="$sexo"
        	varr["$total,nota"]="$nota"
        	varr["$total,aprv"]="$aprov"
        	((total++))
    	done < "$arquivo"

	for ((r = 0; r < total; r++)); do
		for c in "${chaves[@]}"; do
			echo -ne "${varr["$r,$c"]}\t"
		done
  		echo "${varr["$r,aprv"]}"
	done
}

# Menu simples
while :; do
    clear
    echo "Escolha uma opção:"
    echo "1) Teclado > Array > Disco"
    echo "2) Disco > Array > Tela"
    echo "3) Sair"
    read -p "Digite sua escolha (1, 2 ou 3): " escolha

    case $escolha in
        1)
            inserir
            read -p "Pressione qualquer tecla para voltar ao menu..."
            ;;
        2)
            exibir
            read -p "Pressione qualquer tecla para voltar ao menu..."
            ;;
        3)
            echo "Saindo..."
            break
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            read -p "Pressione qualquer tecla para continuar..."
            ;;
    esac
done


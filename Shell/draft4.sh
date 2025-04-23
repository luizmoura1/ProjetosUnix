#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: Menu para Inserção de Dados (Teclado > Array > Disco) e Exibição de Dados (Disco > Array > Tela)

clear

# Declarar as variáveis e arrays
declare -A varr
declare -i total=0
chaves=(iden nome sexo nota)
arquivo="registros1.txt"

# Função para ação 1: Teclado > Array > Disco
acao1() {
    clear
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

    # Salvar no arquivo
    echo -e "Registros inseridos:\n"
    for ((r = 0; r < total; r++)); do
        for c in "${chaves[@]}"; do
            echo -ne "${varr["$r,$c"]}\t" >> "$arquivo"
        done
        echo "${varr["$r,aprv"]}" >> "$arquivo"
    done

    echo -e "Dados salvos no arquivo: $arquivo\n"
    cat "$arquivo"
}

# Função para ação 2: Disco > Array > Tela
acao2() {
    clear
    # Limpar o array antes de carregar os dados
    unset varr
    declare -A varr
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

    # Exibir os dados carregados
    echo -e "Dados carregados do arquivo:\n"
    for ((r = 0; r < total; r++)); do
        echo -e "${varr["$r,iden"]}\t${varr["$r,nome"]}\t${varr["$r,sexo"]}\t${varr["$r,nota"]}\t${varr["$r,aprv"]}"
    done
}
# Menu simples
while true; do
    clear
    echo "Escolha uma opção:"
    echo "1) Teclado > Array > Disco"
    echo "2) Disco > Array > Tela"
    echo "3) Sair"
    read -p "Digite sua escolha (1, 2 ou 3): " escolha

    case $escolha in
        1)
            acao1
            read -p "Pressione qualquer tecla para voltar ao menu..."
            ;;
        2)
            acao2
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


#!/usr/bin/env bash

inserir() {
    for ((i = 0; i < numero_de_linhas; i++)); do
        echo "REGISTRO $((i+1))"

        while :; do
            read -p "ID: " id[i]
            [[ -n "${id[i]}" ]] && break
        done

        while :; do
            read -p "Nome: " nome[i]
            [[ -n "${nome[i]}" ]] && break
        done

        while :; do
            read -p "Sexo (M/F): " sexo[i]
            [[ "${sexo[i]}" == "M" || "${sexo[i]}" == "F" ]] && break
        done

        while :; do
            read -p "Nota (0.0-10.0): " nota[i]
            [[ $(echo "${nota[i]} >= 0 && ${nota[i]} <= 10" | bc -l) -eq 1 ]] && break
        done

        if (( $(echo "${nota[i]} >= 5" | bc -l) )); then
            aprovado[i]="Verdadeiro"
        else
            aprovado[i]="Falso"
        fi

        # Pergunta pelo nome do arquivo
        read -p "Informe o nome do arquivo (pressione Enter para manter o arquivo atual): " arquivo
        
        # Se o usuário não digitar nada, usa o nome de arquivo atual
        arquivo=${arquivo:-"dados.txt"}

        # Verifica se o arquivo existe
        if [ -e "$arquivo" ]; then
            read -p "O arquivo '$arquivo' já existe. Deseja sobrescrever (S) ou adicionar dados (A)? " opcao
            if [[ "$opcao" == [Ss] ]]; then
                > "$arquivo"  # Sobrescreve o arquivo
            fi
        fi
        
        # Insere os dados no arquivo, fazendo append
        echo "$id|$nome|$sexo|$nota|$aprovado" >> "$arquivo"
    done
}

exibir() {
    echo "----------------------------------"
    # Lê os dados do arquivo e exibe    
    if [[ -f "$arquivo" && -s "$arquivo" ]]; then
        echo "----------------------------------"
        while IFS='|' read -r id nome sexo nota aprovado; do
        echo "$id, $nome, $sexo, $nota, $aprovado"
        done < "$arquivo"
        echo "----------------------------------"
    else
        echo "Nenhum dado encontrado!"
    fi    
}

read -p "Quantos registros? " numero_de_linhas
inserir
exibir


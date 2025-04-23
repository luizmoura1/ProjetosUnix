#!/bin/bash

# Função para inserir dados
inserir() {
    for ((i = 0; i < numero_de_linhas; i++)); do
        echo "REGISTRO $((i+1))"

        while true; do
            read -p "ID: " id[i]
            [[ ${id[i]} -gt 0 ]] && break
        done

        while true; do
            read -p "Nome: " nome[i]
            [[ -n ${nome[i]} ]] && break
        done

        while true; do
            read -p "Sexo (M/F): " sexo[i]
            sexo[i]=$(echo "${sexo[i]}" | tr '[:lower:]' '[:upper:]')
            [[ ${sexo[i]} == "M" || ${sexo[i]} == "F" ]] && break
        done

        while true; do
            read -p "Nota (0.0-10.0): " nota[i]
            [[ $(echo "${nota[i]} >= 0 && ${nota[i]} <= 10" | bc) -eq 1 ]] && break
        done

        if (( $(echo "${nota[i]} >= 5" | bc) )); then
            aprovado[i]="Verdadeiro"
        else
            aprovado[i]="Falso"
        fi
    done
}

# Função para exibir dados
exibir() {
    echo "----------------------------------"
    for ((i = 0; i < numero_de_linhas; i++)); do
        echo "$((i+1)): ${id[i]}, ${nome[i]}, ${sexo[i]}, ${nota[i]}, ${aprovado[i]}"
    done
    echo "----------------------------------"
}

# Solicita o número de registros
read -p "Quantos registros? " numero_de_linhas

# Chama as funções
inserir
exibir

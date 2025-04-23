#!/bin/bash

declare -a id nome sexo nota aprovado

inserir() {
    for ((i=0; i<numero_de_linhas; i++)); do
        echo "REGISTRO $((i+1))"
        
        while :; do
            read -p "ID: " id[i]
            [[ ${id[i]} =~ ^[0-9]+$ && ${id[i]} -gt 0 ]] && break
        done
        
        while :; do
            read -p "Nome: " nome[i]
            [[ -n "${nome[i]}" ]] && break
        done
        
        while :; do
            read -p "Sexo (M/F): " sexo[i]
            sexo[i]="${sexo[i]^}"  # Converte para maiúscula
            [[ ${sexo[i]} == "M" || ${sexo[i]} == "F" ]] && break
        done
        
        while :; do
            read -p "Nota (0.0-10.0): " nota[i]
            if [[ ${nota[i]} =~ ^[0-9]+([.][0-9]+)?$ && $(echo "${nota[i]} >= 0" | bc -l) -eq 1 && $(echo "${nota[i]} <= 10" | bc -l) -eq 1 ]]; then
                break
            fi
        done
        
        if (( $(echo "${nota[i]} >= 5" | bc -l) )); then
            aprovado[i]="Verdadeiro"
        else
            aprovado[i]="Falso"
        fi
    done
}

exibir() {
    echo "----------------------------------"
    for ((i=0; i<numero_de_linhas; i++)); do
        echo "$((i+1)): ${id[i]}, ${nome[i]}, ${sexo[i]}, ${nota[i]}, ${aprovado[i]}"
    done
}

read -p "Quantos registros? " numero_de_linhas
inserir
exibir


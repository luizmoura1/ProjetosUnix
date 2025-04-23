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
            [[ "${sexo[i]^}" == "M" || "${sexo[i]^}" == "F" ]] && break
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
    done
}

exibir() {
    echo "----------------------------------"
    for ((i = 0; i < numero_de_linhas; i++)); do
        echo "$((i+1)): ${id[i]}, ${nome[i]}, ${sexo[i]}, ${nota[i]}, ${aprovado[i]}"
    done
    echo "----------------------------------"
}

read -p "Quantos registros? " numero_de_linhas
inserir
exibir

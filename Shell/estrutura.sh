#!/bin/bash

# Função para validar o sexo (M/F)
validar_sexo() {
    local sexo=$1
    [[ "$sexo" == "M" || "$sexo" == "F" ]]
}

# Função para validar a nota (0.0 a 10.0)
validar_nota() {
    local nota=$1
    [[ "$nota" =~ ^[0-9]+(\.[0-9]+)?$ ]] && (( $(echo "$nota >= 0.0 && $nota <= 10.0" | bc -l) ))
}

# Função para determinar o status com base na nota
definir_status() {
    local nota=$1
    if (( $(echo "$nota >= 5.0" | bc -l) )); then
        echo "true"
    else
        echo "false"
    fi
}

# Função para ler os dados de uma "estrutura" do usuário
ler_estrutura() {
    local id nome sexo nota status

    while true; do
        read -p "ID: " id		# (não nulo)
        [[ -n "$id" ]] && break
    done

    while true; do
        read -p "Nome: " nome		# (não nulo)
        [[ -n "$nome" ]] && break
    done

    while true; do
        read -p "Sexo (M/F): " sexo
        sexo=$(echo "$sexo" | tr '[:lower:]' '[:upper:]')  # Converte para maiúscula
        validar_sexo "$sexo" && break
    done

    while true; do
        read -p "Nota (0.0-10.0): " nota
        validar_nota "$nota" && break
    done

    # Define o status automaticamente com base na nota
    status=$(definir_status "$nota")

    # Retorna os valores como uma string formatada
    echo "$id:$nome:$sexo:$nota:$status"
}

# Pergunta ao usuário quantas estruturas ele deseja criar
read -p "Quantas estruturas você deseja criar? " TAMANHO_VETOR
echo "Por favor, insira somente valores não nulos e válidos:"

# Declarando um array indexado para o vetor de estruturas
declare -a vetor

# Populando o vetor de estruturas com entradas do usuário
for ((i = 0; i < TAMANHO_VETOR; i++)); do
    echo -e "\nEstrutura $((i + 1)) de $TAMANHO_VETOR:"
    dados=$(ler_estrutura)
    vetor[$i]=$dados
done

# Acessando e exibindo os dados do vetor
echo -e "\nDados armazenados:"
echo "----------------------------------------------"
echo -e "#\tID\tNome\tSexo\tNota\tStatus"
echo "----------------------------------------------"
for ((i = 0; i < ${#vetor[@]}; i++)); do
    IFS=':' read -r id nome sexo nota status <<< "${vetor[$i]}"
    echo -e "$((i+1))\t$id\t$nome\t$sexo\t$nota\t$status"
    echo "----------------------------------------------"
done

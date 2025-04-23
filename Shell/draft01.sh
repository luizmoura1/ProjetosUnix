#!/usr/bin/env bash
# Autor: Luiz
# Exemplo: array associativo com número fixo de registros
# Aprovado é calculado automaticamente com base na nota

clear
declare -A varr		# Declaração do array associativo
declare -i total	# Número de registros

# Chaves fixas predefinidas
chaves=(iden nome sexo nota)

echo "____________________________________________________________________"
read -p "Quantos registros deseja inserir? " total	# Pergunta pelo número de registros

# Laço para preencher os registros
for ((r = 1; r <= total; r++)); do
  echo "____________________________________________________________________"
  echo "Preenchendo o registro #$r"

  # Preenchemos as chaves para cada registro
  for c in ${chaves[@]}; do
    read -p "$c: " valor		# Recebe a entrada para a chave
    varr["$r,$c"]="$valor"	# Associa o valor ao registro e chave específica
  done

  # Calculando o valor do campo 'aprv' com base na nota
  nota=${varr["$r,nota"]}	# Pega o valor da nota para o registro atual
  if ((nota >= 6)); then
    varr["$r,aprv"]="true"	# Aprovação automática se a nota for >= 6
  else
    varr["$r,aprv"]="false"	# Caso contrário, 'false'
  fi
done

echo "____________________________________________________________________"
# Exibe todos os registros
echo "Registros inseridos:"
for ((r = 1; r <= total; r++)); do
  echo "Registro #$r:"
  for c in ${chaves[@]}; do
    echo -e "$c: ${varr["$r,$c"]}"	# Exibe o valor de cada chave do registro
  done
  echo "aprv: ${varr["$r,aprv"]}"	# Exibe o valor de 'aprv'
  echo "-------------------------"
done


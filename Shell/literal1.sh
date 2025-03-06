#!/usr/bin/env bash

# Literal definida pelo usuário em design-time
echo "Olá, mundo!"

# Variável definida pelo usuário em design-time
salve='Oi, pessoal.'
echo $salve

# Variável do sistema com literal e variável
pergunta='. Como vai?'
echo "Ei, $USER$pergunta"

echo "Oops, desculpe-me por ter escrito seu nome com inicial minúscula."

echo "Ei, ${USER^}$pergunta"



#!/usr/bin/env bash
# Autor: Luiz
# Objetivos:
# a) Demonstrar o uso de literais e variáveis
# b) Ilustrar como o shell trata a junção de strings (simulação de concatenação)
# c) Mostrar que 'readonly' impede a modificação de uma variável (mas é irrelevante neste contexto)
# d) Mostrar duas formas de atribuição de valores: explícita com '=' e implícita com 'read'

PERGUNTA="Qual é o seu nome?"	# Atribuição explícita (com '=')
readonly PERGUNTA		# Torna a variável imutável, mas sem necessidade prática aqui

echo "$PERGUNTA"		# Aspas garantem que o argumento não seja mal interpretado

read PESSOA			# Atribuição implícita (entrada do usuário)

# Testando diferentes formas de "concatenar" strings
echo "Olá, $PESSOA!"      # Forma mais comum
echo "Olá," "$PESSOA!"    # Separação explícita de argumentos (espaço entre eles)
echo "Olá," "$PESSOA""!"  # O Shell junta "$PESSOA" e "!"
echo "Olá," "$PESSOA" "!" # O Shell insere um espaço entre os argumentos
echo "Olá,""$PESSOA" "!"  # Mesmo caso anterior, o Shell insere um espaço antes do "!"
echo "Olá,""$PESSOA""!"   # Aqui tudo é tratado como uma string única
echo "Olá,""$PESSOA!"     # Aqui também é tratado como uma string única

unset PESSOA               # Remove o valor da variável PESSOA (agora ela está vazia)
echo "Olá, $PESSOA!"       # Como a variável foi deletada, nada será impresso


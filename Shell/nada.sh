#!/usr/bin/env bash
echo HelloWorld
echo Hello World
echo Hello          World	# Reduz o número de espaços a um apenas
echo '--------------------'
echo Hello;World		# Saída: Hello / não encontra comando World 
echo Hello&World		# Saída: Hello / não encontra comando World 
echo Hello|World		# Saída:       / não encontra comando World 
echo Hello*World
echo Hello$World		# Saída: Hello / não encontra valor para $World
echo '--------------------'
echo Hello ; World		# Saída: Hello / não encontra comando World
echo Hello & World		# Saída: Hello / não encontra comando World
echo Hello | World		# Saída:       / não encontra comando World
echo Hello * World		# Saída: Hello  lista_de_arquivos  World
echo Hello $ World


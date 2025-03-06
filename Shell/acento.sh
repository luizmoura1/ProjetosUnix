#!/usr/bin/env bash
echo `HelloWorld`		# comando não encontrado: HelloWorld
echo `Hello World`		# comando não encontrado: Hello
echo `Hello          World`	# comando não encontrado: Hello
echo `Hello`World		#Saída: World (após comando não encontrado: Hello)
echo `Hello` World		#Saída: World (após comando não encontrado: Hello)
echo `Hello`          World	#Saída: World (após comando não encontrado: Hello)
echo Hello `          ` World	#Saída: Hello World
echo '--------------------'
echo `Hello;World`		# comandos não encontrados: Hello e World
echo `Hello&World`		# comandos não encontrados: Hello e World
echo `Hello|World`		# comandos não encontrados: Hello e World
echo `Hello*World`		# comando não encontrado: Hello*World
echo `Hello$World`		# comando não encontrado: Hello
echo '--------------------'
echo `Hello ; World`		# comandos não encontrados: Hello e World
echo `Hello & World`		# comandos não encontrados: Hello e World
echo `Hello | World`		# comandos não encontrados: Hello e World
echo `Hello * World`		# comando não encontrado: Hello
echo `Hello $ World`		# comando não encontrado: Hello
echo '--------------------'
echo Hello `;` World		#Saída: Hello World (após command substitution; erro de sintaxe)
echo Hello `&` World		#Saída: Hello World (após command substitution; erro de sintaxe)
echo Hello `|` World		#Saída: Hello World (após command substitution; erro de sintaxe)
echo Hello `*` World		#Saída: Hello World (após comando não encontrado)
echo Hello `$` World		#Saída: Hello World (após comando não encontrado)


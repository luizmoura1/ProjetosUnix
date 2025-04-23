exec 3>trace.log; BASH_XTRACEFD=3; set -x
numero=-1
while [ "$numero" -ne 0 ]; do
	clear
	echo "------ M E N U ------"
	echo "1 - Primeira opção"
	echo "2 - Segunda opção"
	echo "3 - Terceira opção"
	echo "0 - Sair"

    	while true; do
		read -p "Opção: " numero
		echo "DEBUG: Você digitou [$numero]"
        	[[ -n "$numero" ]] && break
    	done

	if [ "$numero" -eq 1 ]; then
		echo "Você escolheu a opção 1"		
	elif [ "$numero" -eq 2 ]; then
		echo "Você escolheu a opção 2"
	else
		echo "Você escolheu a opção 0"
	fi
	sleep 10
done

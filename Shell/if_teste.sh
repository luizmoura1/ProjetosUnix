NUMERO=-1
while [ $NUMERO -ne 0 ]; do
	clear
	echo "------ M E N U ------"
	echo "1 - Primeira opção"
	echo "2 - Segunda opção"
	echo "3 - Terceira opção"
	echo "0 - Sair"

    	while true; do
		read -p "Opção: " NUMERO
        	[[ -n "$NUMERO" ]] && break
    	done

	if [ $NUMERO == 1 ]; then
		echo "Você escolheu a opção $NUMERO"		
	elif [ $NUMERO == 2 ]; then
		echo "Você escolheu a opção $NUMERO"
	else
		echo "Você escolheu a opção $NUMERO"
	fi
	sleep 2
done

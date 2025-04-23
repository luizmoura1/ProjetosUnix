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

	case $NUMERO in
		1) echo "Você escolheu a opção $NUMERO"	;;	
		2) echo "Você escolheu a opção $NUMERO" ;;
		3) echo "Você escolheu a opção $NUMERO" ;;
		*) echo "Você escolheu a opção $NUMERO" ;;
	esac
done

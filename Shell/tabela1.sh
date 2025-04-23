escrever(){
	echo "---------------------"
	echo -n "Informe Id: "
	read ID
	echo -n "Informe Nome: "
	read NOME
	echo -n "Informe Sexo: "
	read SEXO
	echo -n "Informe Nota: "
	read NOTA
	echo "---------------------"
	REGISTRO[$CONT]="$ID $NOME $SEXO $NOTA"
	CONT=$((CONT+1))
}

ler(){
	echo "--------------------"
	for i in "${REGISTRO[@]}"; do
		echo $i
	done
	echo "--------------------"
}

echo "----- M E N U -----"
echo "1 - inserir registro"
echo "2 - exibir registro"
echo "0 - sair"

CONT=0
NUMERO=-1
while [ $NUMERO -ne 0 ]; do
	echo -n "Opção: "
	read NUMERO
	if [ $NUMERO == 1 ];then
		escrever
	fi		
	if [ $NUMERO == 2 ];then
		ler
	fi
done
	



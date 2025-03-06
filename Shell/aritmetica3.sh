#!/usr/bin/env bash
echo 'O P E R A Ç Õ E S  A R I T M É T I C A S'
echo '-----------------------------------------------------------'
echo 'Operandos: literais definidas pelo usuário em design-time.'
echo -n "echo '2+3' | bc = "; echo '2+3' | bc
echo -n "echo '2-3' | bc = "; echo '2-3' | bc
echo -n "echo '2*3' | bc = "; echo '2*3' | bc
echo -n "echo 'scale=2;2/3' | bc = "; echo 'scale=2;2/3' | bc
echo -n "echo '2%3' | bc = "; echo '2%3' | bc
echo -n "echo '2^3' | bc = "; echo '2^3' | bc
echo '-----------------------------------------------------------'
echo 'Operandos: variáveis definidas pelo usuário em design-time.'
a=2; b=3
echo 'a='$a; echo 'b='$b
echo -n "echo "\"\$a+\$b\"" | bc = "; echo "$a+$b" | bc
echo -n "echo "\"\$a-\$b\"" | bc = "; echo "$a-$b" | bc
echo -n "echo "\"\$a*\$b\"" | bc = "; echo "$a*$b" | bc
echo -n "echo \"scale=2;\$a/\$b\" | bc = "; echo "scale=2;$a/$b" | bc
echo -n "echo "\"\$a%\$b\"" | bc = "; echo "$a%$b" | bc
echo -n "echo "\"\$a^\$b\"" | bc = " ; echo "$a^$b" | bc
echo '-----------------------------------------------------------'
echo 'Observações:'
echo 'A potenciação requer ^ em lugar de **'
echo "Com literais, pode-se usar aspas simples: echo '2 + 3' | bc, mas com variáveis deve-se usar aspas duplas: echo \"\$a + \$b\" | bc."
#echo 'Para obter a formatação com 0 antes do ponto decimal (0.66) devemos alterar result dessa forma: result="0$result".'

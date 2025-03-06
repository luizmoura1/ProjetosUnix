#!/usr/bin/env bash
echo 'O P E R A Ç Õ E S  R E L A C I O N A I S'
echo '-----------------------------------------------------------'
echo 'Operandos: literais definidas pelo usuário em design-time.'
echo -n "[ 2 -eq 3 ]; echo \$? = "; [ 2 -eq 3 ]; echo $?
echo -n "[ 2 -ne 3 ]; echo \$? = "; [ 2 -ne 3 ]; echo $?
echo -n "[ 2 -lt 3 ]; echo \$? = "; [ 2 -lt 3 ]; echo $?
echo -n "[ 2 -le 3 ]; echo \$? = "; [ 2 -le 3 ]; echo $?
echo -n "[ 2 -gt 3 ]; echo \$? = "; [ 2 -gt 3 ]; echo $?
echo -n "[ 2 -ge 3 ]; echo \$? = "; [ 2 -ge 3 ]; echo $?
echo '-----------------------------------------------------------'
echo 'Operandos: variáveis definidas pelo usuário em design-time.'
a=2; b=3
echo 'a=2'; echo 'b=3'
echo -n "[ \$a -eq \$b ]; echo \$? = "; [ $a -eq $b ]; echo $?
echo -n "[ \$a -ne \$b ]; echo \$? = "; [ $a -ne $b ]; echo $?
echo -n "[ \$a -lt \$b ]; echo \$? = "; [ $a -lt $b ]; echo $?
echo -n "[ \$a -le \$b ]; echo \$? = "; [ $a -le $b ]; echo $?
echo -n "[ \$a -gt \$b ]; echo \$? = "; [ $a -gt $b ]; echo $?
echo -n "[ \$a -ge \$b ]; echo \$? = "; [ $a -ge $b ]; echo $?
echo '-----------------------------------------------------------'



#!/usr/bin/env bash
echo 'O P E R A Ç Õ E S  L Ó G I C A S'
echo '-----------------------------------------------------------'
echo 'Operandos: literais definidas pelo usuário em design-time.'
echo -n "[ 2 -eq 3 ] && [ 2 -ne 3 ]; echo \$? = "; [ 2 -eq 3 ] && [ 2 -ne 3 ]; echo $?
echo -n "[ 2 -eq 3 ] || [ 2 -ne 3 ]; echo \$? = "; [ 2 -eq 3 ] || [ 2 -ne 3 ]; echo $?
echo -n "! [ 2 -eq 3 ]; echo \$? = "; ! [ 2 -eq 3 ]; echo $?
echo '-----------------------------------------------------------'
echo 'Operandos: variáveis definidas pelo usuário em design-time.'
a=2; b=3
echo 'a=2'; echo 'b=3'
echo -n "[ \$a -eq \$b ] && [ \$a -ne \$b ]; echo \$? = "; [ $a -eq $b ] && [ $a -ne $b ]; echo $?
echo -n "[ \$a -eq \$b ] || [ \$a -ne \$b ]; echo \$? = "; [ $a -eq $b ] || [ $a -ne $b ]; echo $?
echo -n "! [ \$a -eq \$b ]; echo \$? = "; ! [ $a -eq $b ]; echo $?
echo '-----------------------------------------------------------'



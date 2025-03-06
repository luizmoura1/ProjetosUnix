#!/usr/bin/env bash
printf '%sO P E R A Ç Õ E S  L Ó G I C A S\n'
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: literais definidas pelo usuário em design-time.\n'
printf '%s' "[ 2 -eq 3 ] && [ 2 -ne 3 ]; printf '%s\n' \$? = "; [ 2 -eq 3 ] && [ 2 -ne 3 ]; printf '%s\n' $?
printf '%s' "[ 2 -eq 3 ] || [ 2 -ne 3 ]; printf '%s\n' \$? = "; [ 2 -eq 3 ] || [ 2 -ne 3 ]; printf '%s\n' $?
printf '%s' "! [ 2 -eq 3 ]; printf '%s\n' \$? = "; ! [ 2 -eq 3 ]; printf '%s\n' $?
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: variáveis definidas pelo usuário em design-time.\n'
a=2; b=3
printf 'a=%d\n' $a; printf 'b=%d\n' $b
printf '%s' "[ \$a -eq \$b ] && [ \$a -ne \$b ]; printf '%s\n' \$? = "; [ $a -eq $b ] && [ $a -ne $b ]; printf '%s\n' $?
printf '%s' "[ \$a -eq \$b ] || [ \$a -ne \$b ]; printf '%s\n' \$? = "; [ $a -eq $b ] || [ $a -ne $b ]; printf '%s\n' $?
printf '%s' "! [ \$a -eq \$b ]; printf '%s\n' \$? = "; ! [ $a -eq $b ]; printf '%s\n' $?
printf '%s-----------------------------------------------------------\n'



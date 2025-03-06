#!/usr/bin/env bash
printf '%sO P E R A Ç Õ E S  R E L A C I O N A I S\n'
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: literais definidas pelo usuário em design-time.\n'
printf '%s' "[ 2 -eq 3 ]; printf '%s\n' \$? = "; [ 2 -eq 3 ]; printf '%s\n' $?
printf '%s' "[ 2 -ne 3 ]; printf '%s\n' \$? = "; [ 2 -ne 3 ]; printf '%s\n' $?
printf '%s' "[ 2 -lt 3 ]; printf '%s\n' \$? = "; [ 2 -lt 3 ]; printf '%s\n' $?
printf '%s' "[ 2 -le 3 ]; printf '%s\n' \$? = "; [ 2 -le 3 ]; printf '%s\n' $?
printf '%s' "[ 2 -gt 3 ]; printf '%s\n' \$? = "; [ 2 -gt 3 ]; printf '%s\n' $?
printf '%s' "[ 2 -ge 3 ]; printf '%s\n' \$? = "; [ 2 -ge 3 ]; printf '%s\n' $?
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: variáveis definidas pelo usuário em design-time.\n'
a=2; b=3
printf 'a=%d\n' $a; printf 'b=%d\n' $b
printf '%s' "[ \$a -eq \$b ]; printf '%s\n' \$? = "; [ $a -eq $b ]; printf '%s\n' $?
printf '%s' "[ \$a -ne \$b ]; printf '%s\n' \$? = "; [ $a -ne $b ]; printf '%s\n' $?
printf '%s' "[ \$a -lt \$b ]; printf '%s\n' \$? = "; [ $a -lt $b ]; printf '%s\n' $?
printf '%s' "[ \$a -le \$b ]; printf '%s\n' \$? = "; [ $a -le $b ]; printf '%s\n' $?
printf '%s' "[ \$a -gt \$b ]; printf '%s\n' \$? = "; [ $a -gt $b ]; printf '%s\n' $?
printf '%s' "[ \$a -ge \$b ]; printf '%s\n' \$? = "; [ $a -ge $b ]; printf '%s\n' $?
printf '%s-----------------------------------------------------------\n'



#!/usr/bin/env bash
printf '%sO P E R A Ç Õ E S  A R I T M É T I C A S\n'
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: literais definidas pelo usuário em design-time.\n'
printf '%s' 'expr 2 + 3 = '; expr 2 + 3
printf '%s' 'expr 2 - 3 = '; expr 2 - 3
printf '%s' 'expr 2 \* 3 = '; expr 2 \* 3
printf '%s' 'expr 2 / 3 = '; expr 2 / 3
printf '%s' 'expr 2 % 3 = '; expr 2 % 3
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: variáveis definidas pelo usuário em design-time.\n'
a=2; b=3
printf 'a=%d\n' $a; printf 'b=%d\n' $b
printf '%s' 'expr $a + $b = '; expr $a + $b
printf '%s' 'expr $a - $b = '; expr $a - $b
printf '%s' 'expr $a \* $b = '; expr $a \* $b
printf '%s' 'expr $a / $b = '; expr $a / $b
printf '%s' 'expr $a % $b = '; expr $a % $b
printf '%s-----------------------------------------------------------\n'
printf '%sObservações:\n'
printf '%sexpr suporta multiplicação apenas se for usado escape (\*).\n'
printf '%sexpr, assim como $(()), não dá suporte a números reais ou de ponto flutuante.\n'
printf '%sexpr não suporta outras operações aritméticas mais complexas (ex.: potenciação).\n'


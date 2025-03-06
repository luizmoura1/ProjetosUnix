#!/usr/bin/env bash
echo 'O P E R A Ç Õ E S  A R I T M É T I C A S'
echo '-----------------------------------------------------------'
echo 'Operandos: literais definidas pelo usuário em design-time.'
echo -n "expr 2 + 3 = "; expr 2 + 3
echo -n "expr 2 - 3 = "; expr 2 - 3
echo -n "expr 2 \* 3 = "; expr 2 \* 3
echo -n "expr 2 / 3 = "; expr 2 / 3
echo -n "expr 2 % 3 = "; expr 2 % 3
echo '-----------------------------------------------------------'
echo 'Operandos: variáveis definidas pelo usuário em design-time.'
a=2; b=3
echo 'a='$a; echo 'b='$b
echo -n "expr \$a + \$b = "; expr $a + $b
echo -n "expr \$a - \$b = "; expr $a - $b
echo -n "expr \$a \* \$b = "; expr $a \* $b
echo -n "expr \$a / \$b = "; expr $a / $b
echo -n "expr \$a % \$b = "; expr $a % $b
echo '-----------------------------------------------------------'
echo 'Observações:'
echo 'expr suporta multiplicação apenas se for usado escape (\*).'
echo 'expr, assim como $(()), não dá suporte a números reais ou de ponto flutuante.'
echo 'expr não suporta outras operações aritméticas mais complexas (ex.: potenciação).'


#!/usr/bin/env bash
echo 'O P E R A Ç Õ E S  A R I T M É T I C A S'
echo '-----------------------------------------------------------'
echo 'Operandos: literais definidas pelo usuário em design-time.'
echo -n "echo \$((2+3)) = "; echo $((2+3))
echo -n "echo \$((2-3)) = "; echo $((2-3))
echo -n "echo \$((2*3)) = "; echo $((2*3))
echo -n "echo \$((2/3)) = "; echo $((2/3))
echo -n "echo \$((2%3)) = "; echo $((2%3))
echo -n "echo \$((2**3)) = "; echo $((2**3))
echo '-----------------------------------------------------------'
echo 'Operandos: variáveis definidas pelo usuário em design-time.'
a=2; b=3
echo 'a='$a; echo 'b='$b
echo -n "echo \$((\$a+\$b)) = "; echo $(($a+$b))
echo -n "echo \$((\$a-\$b)) = "; echo $(($a-$b))
echo -n "echo \$((\$a*\$b)) = "; echo $(($a*$b))
echo -n "echo \$((\$a/\$b)) = "; echo $(($a/$b))
echo -n "echo \$((\$a%\$b)) = "; echo $(($a%$b))
echo -n "echo \$((\$a**\$b)) = "; echo $(($a**$b))
echo '-----------------------------------------------------------'
echo 'Observações:'
echo '$(()), assim como expr, não dá suporte a números reais ou de ponto flutuante.'


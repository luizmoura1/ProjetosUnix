#!/usr/bin/env bash
printf '%sO P E R A Ç Õ E S  A R I T M É T I C A S\n'
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: literais definidas pelo usuário em design-time.\n'
printf '%s' "printf '%s\\n' \$((2+3)) = "; printf '%s\n' $((2+3))
printf '%s' "printf '%s\\n' \$((2-3)) = "; printf '%s\n' $((2-3))
printf '%s' "printf '%s\\n' \$((2*3)) = "; printf '%s\n' $((2*3))
printf '%s' "printf '%s\\n' \$((2/3)) = "; printf '%s\n' $((2/3))
printf '%s' "printf '%s\\n' \$((2%3)) = "; printf '%s\n' $((2%3))
printf '%s' "printf '%s\\n' \$((2**3)) = "; printf '%s\n' $((2**3))
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: variáveis definidas pelo usuário em design-time.\n'
a=2; b=3
printf 'a=%d\n' $a; printf 'b=%d\n' $b
printf '%s' "printf '%s\\n' \$(($a+$b)) = "; printf '%s\n' $(($a+$b))
printf '%s' "printf '%s\\n' \$(($a-$b)) = "; printf '%s\n' $(($a-$b))
printf '%s' "printf '%s\\n' \$(($a*$b)) = "; printf '%s\n' $(($a*$b))
printf '%s' "printf '%s\\n' \$(($a/$b)) = "; printf '%s\n' $(($a/$b))
printf '%s' "printf '%s\\n' \$(($a%$b)) = "; printf '%s\n' $(($a%$b))
printf '%s' "printf '%s\\n' \$(($a**$b)) = "; printf '%s\n' $(($a**$b))
printf '%s-----------------------------------------------------------\n'
printf '%sObservações:\n'
printf '%s$(()), assim como expr, não dá suporte a números reais ou de ponto flutuante.\n'


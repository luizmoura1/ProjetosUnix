#!/usr/bin/env bash
printf '%sO P E R A Ç Õ E S  A R I T M É T I C A S\n'
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: literais definidas pelo usuário em design-time.\n'
printf '%s = %s\n' "printf '%s\n' \$(echo '2+3' | bc)" $(echo '2+3' | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo '2-3' | bc)" $(echo '2-3' | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo '2*3' | bc)" $(echo '2*3' | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo 'scale=2;2/3' | bc)" $(echo 'scale=2;2/3' | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo '2%3' | bc)" $(echo '2%3' | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo '2^3' | bc)" $(echo '2^3' | bc)
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: variáveis definidas pelo usuário em design-time.\n'
a=2; b=3
printf 'a=%d\n' $a; printf 'b=%d\n' $b
printf '%s = %s\n' "printf '%s\n' \$(echo \"\$a+\$b\" | bc)" $(echo "$a+$b" | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo \"\$a-\$b\" | bc)" $(echo "$a-$b" | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo \"\$a*\$b\" | bc)" $(echo "$a*$b" | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo \"scale=2;\$a/\$b\" | bc)" $(echo "scale=2;$a/$b" | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo \"\$a%\$b\" | bc)" $(echo "$a%$b" | bc)
printf '%s = %s\n' "printf '%s\n' \$(echo \"\$a^\$b\" | bc)" $(echo "$a^$b" | bc)
printf '%s-----------------------------------------------------------\n'
printf '%sObservações:\n'
printf '%sA potenciação requer ^ em lugar de **\n'
printf "%sCom literais, pode-se usar aspas simples: echo '2 + 3' | bc, mas com variáveis deve-se usar aspas duplas: echo \"\$a + \$b\" | bc\n"
#printf '%sPara obter a formatação com 0 antes do ponto decimal (0.66) devemos alterar result dessa forma: result="0$result".\n'


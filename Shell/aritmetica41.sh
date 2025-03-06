#!/usr/bin/env bash
printf '%sO P E R A Ç Õ E S  A R I T M É T I C A S\n'
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: literais definidas pelo usuário em design-time.\n'
printf '%s = %s\n' "printf '%s\\n' \$(echo '2 3 + p' | dc)" $(echo '2 3 + p' | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo '2 3 - p' | dc)" $(echo '2 3 - p' | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo '2 3 * p' | dc)" $(echo '2 3 * p' | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo '2 k 2 3 / p' | dc)" $(echo '2 k 2 3 / p' | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo '2 3 % p' | dc)" $(echo '2 3 % p' | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo '2 3 ^ p' | dc)" $(echo '2 3 ^ p' | dc)
printf '%s-----------------------------------------------------------\n'
printf '%sOperandos: variáveis definidas pelo usuário em design-time.\n'
a=2; b=3
printf 'a=%d\n' $a; printf 'b=%d\n' $b
printf '%s = %s\n' "printf '%s\\n' \$(echo \"\$a \$b + p\" | dc)" $(echo "$a $b + p" | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo \"\$a \$b - p\" | dc)" $(echo "$a $b - p" | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo \"\$a \$b * p\" | dc)" $(echo "$a $b * p" | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo \"2 k \$a \$b / p\" | dc)" $(echo "2 k $a $b / p" | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo \"\$a \$b % p\" | dc)" $(echo "$a $b % p" | dc)
printf '%s = %s\n' "printf '%s\\n' \$(echo \"\$a \$b ^ p\" | dc)" $(echo "$a $b ^ p" | dc)
printf '%s-----------------------------------------------------------\n'
printf '%sObservações:\n'
printf '%sA operação de potenciação é feita com o símbolo ^\n'
printf '%sCom dc a ordem dos operandos segue a notação polonesa reversa (RPN).\n'
#printf '%sPara obter a formatação com 0 antes do ponto decimal (0.66) devemos alterar result dessa forma: result="0$result".\n'


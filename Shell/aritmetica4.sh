#!/usr/bin/env bash
echo 'O P E R A Ç Õ E S  A R I T M É T I C A S'
echo '-----------------------------------------------------------'
echo 'Operandos: literais definidas pelo usuário em design-time.'
echo -n "echo '2 3 + p' | dc = "; echo '2 3 + p' | dc
echo -n "echo '2 3 - p' | dc = "; echo '2 3 - p' | dc
echo -n "echo '2 3 * p' | dc = "; echo '2 3 * p' | dc
echo -n "echo '2 k 2 3 / p' | dc = "; echo '2 k 2 3 / p' | dc
echo -n "echo '2 3 % p' | dc = "; echo '2 3 % p' | dc
echo -n "echo '2 3 ^ p' | dc = "; echo '2 3 ^ p' | dc
echo '-----------------------------------------------------------'
echo 'Operandos: variáveis definidas pelo usuário em design-time.'
a=2; b=3
echo 'a='$a; echo 'b='$b
echo -n "echo \"\$a \$b + p\" | dc = "; echo "$a $b + p" | dc
echo -n "echo \"\$a \$b - p\" | dc = "; echo "$a $b - p" | dc
echo -n "echo \"\$a \$b * p\" | dc = "; echo "$a $b * p" | dc
echo -n "echo \"2 k \$a \$b / p\" | dc = "; echo "2 k $a $b / p" | dc
echo -n "echo \"\$a \$b % p\" | dc = "; echo "$a $b % p" | dc
echo -n "echo \"\$a \$b ^ p\" | dc = "; echo "$a $b ^ p" | dc
echo '-----------------------------------------------------------'
echo 'Observações:'
echo 'A operação de potenciação é feita com o símbolo ^'
echo 'Com dc a ordem dos operandos segue a notação polonesa reversa (RPN).'
#echo 'Para obter a formatação com 0 antes do ponto decimal (0.66) devemos alterar result dessa forma: result="0$result".'

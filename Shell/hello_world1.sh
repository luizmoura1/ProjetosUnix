#!/usr/bin/env bash
texto="Oi,          mundo!"
echo texto
echo ${texto}
echo $texto
echo "$texto"
echo "----------"
texto="Oi,\nmundo!"
echo $texto
echo -e $texto
echo -E $texto
echo "----------"
echo "$texto"
echo -e "$texto"
echo -E "$texto"
echo "----------"
texto="Oi,\n          mundo!"
echo $texto
echo -e $texto
echo -E $texto
echo "----------"
echo "$texto"
echo -e "$texto"
echo -E "$texto"



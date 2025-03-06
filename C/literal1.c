#gcc font.c |-o exe|	em caso de omissão, a.out é gerado automaticamente
#./exe
#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("Olá, mundo!\n");
    printf("Oi, pessoal.\n");

    printf("Ei, %s. Como vai?\n", getenv("USER"));  
    printf("Oops, desculpe-me por ter escrito seu nome com inicial minúscula.\n");
    printf("Ei, %c%s. Como vai?\n", getenv("USER")[0] - 32, getenv("USER") + 1);  

    return 0;
}


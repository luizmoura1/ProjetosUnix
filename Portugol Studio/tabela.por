//O comando programa é obrigatório
programa
{
    inteiro id[128]
    cadeia nome[128]
    caracter sexo[128]
    real nota[128]
    logico aprovado[128]
    cadeia aux = ""
    inteiro pos = 0
    const inteiro MAX = 4
    funcao mostrar_menu()
    {
    		escreva("Menu\n")
    		escreva("1. Inserir registro\n")
		escreva("2. Exibir registo\n")
		escreva("3. Sair\n")
		leia(aux)
    }
    funcao escrever_registro()
    {
    		escreva("Registros sendo inseridos...\n")
    		pos = pos + 1
    		se(pos <= MAX)
    		{
			escreva("Informe o ID: ")
    			leia(id[pos])
			escreva("Informe o Nome: ")
    			leia(nome[pos])
			escreva("Informe o Sexo (m / f): ")
			enquanto(sexo[pos] != 'm' e sexo[pos] != 'f')
			{
    				leia(sexo[pos])
			}
			escreva("Informe a Nota (0 - 10): ")
    			nota[pos] = 100.0
    			enquanto(nota[pos] < 0 ou nota[pos] > 10)
    			{
	    			leia(nota[pos])			
    			}
			escreva("Informe se Aprovado (v / f): ")
    			aux =""
    			enquanto(aux != "v" e aux != "f")
    			{
    				leia(aux)
    			}
    			se(aux == "v")
    			{
    				aprovado[pos] = verdadeiro
    			}
    			senao
    			{
    				aprovado[pos] = falso
    			}
    		}
    		senao
    		{
    			escreva(MAX, " registros!\n")
    			pos = pos - 1
    		}
    }
    funcao ler_registro()
    {
    		escreva("Registros sendo lidos...\n")
    		para(inteiro j=1;j <= pos; j++)
    		{
    			escreva(id[j], "\t", nome[j], "\t", sexo[j], "\t", nota[j], "\t", aprovado[j], "\n")
    		}
    }
    
    funcao inicio()
    {
     	enquanto(aux != "3")
     	{
	     	mostrar_menu()		
     		se(aux == "1")
     		{
     			escrever_registro()	
     		}
     		se(aux == "2")
     		{
     			ler_registro()	
     		}
     	}
 
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1043; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
Algoritmo "semnome"

Var
   n, resultado: inteiro

funcao somar(n: inteiro): inteiro

inicio

   se n < 10 entao
      retorne n
   senao
        retorne (n mod 10) + somar(n div 10)
   fimse

fimfuncao

Inicio

   escreval("+-----------------+")
   escreval("| Soma de Dígitos |")
   escreval("+-----------------+")

   escreval("Digite um número inteiro e positivo: ")
   leia(n)

   resultado <- somar(n)

   escreval("")
   escreval("A soma dos dígitos é: ", resultado)

Fimalgoritmo
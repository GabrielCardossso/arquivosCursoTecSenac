Algoritmo "semnome"

Var
n: inteiro

procedimento contar(atual, limite: inteiro)
inicio
      se atual <= limite entao
         escreval(atual)
         contar(atual+1, limite)
      fimse
fimprocedimento

Inicio
escreval("+------------------------------+")
escreval("| CONTAGEM CRESCENTE RECURSIVA |")
escreval("+------------------------------+")

   escreval("Digite até quanto você deseja contar: ")
   leia(n)
   
escreval("+-----------+")
escreval("| CONTAGEM: |")
escreval("+-----------+")
   
   contar(1, n)


Fimalgoritmo
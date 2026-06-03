algoritmo "fibonacci"
var
   n, i: inteiro
   a, b, prox: inteiro

inicio
   escreva("Quantos termos deseja mostrar? ")
   leia(n)

   a <- 0
   b <- 1

   escreval("Sequência: ")
   para i de 1 ate n faca
      escreva(a, " ")

      prox <- a + b
      a <- b
      b <- prox
   fimpara

fimalgoritmo
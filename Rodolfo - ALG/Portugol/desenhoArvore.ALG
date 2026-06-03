algoritmo "DesenharArvore"

var
   i, j, altura: inteiro

inicio

   escreva("Digite a altura da árvore: ")
   leia(altura)

   // Parte das folhas
   para i de 1 ate altura faca
      // espaços
      para j de 1 ate (altura - i) faca
         escreva(" ")
      fimpara

      // folhas (*)
      para j de 1 ate (2 * i - 1) faca
         escreva("*")
      fimpara

      escreval("")
   fimpara

   // Tronco
   para i de 1 ate 2 faca
      para j de 1 ate (altura - 1) faca
         escreva(" ")
      fimpara
      escreval("|")
   fimpara

fimalgoritmo
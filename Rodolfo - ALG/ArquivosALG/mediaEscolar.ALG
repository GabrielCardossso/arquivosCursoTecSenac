algoritmo "SituacaoAluno"
var
   nota1, nota2, nota3, media: real

procedimento verificarSituacao()
inicio
   escreva("Digite a primeira nota: ")
   leia(nota1)

   escreva("Digite a segunda nota: ")
   leia(nota2)

   escreva("Digite a terceira nota: ")
   leia(nota3)

   media <- (nota1 + nota2 + nota3) / 3

   escreval("Média: ", media:0:2)

   se (media >= 7) entao
      escreval("Situação: Aprovado")
   senao
      se (media >= 5) entao
         escreval("Situação: Recuperação")
      senao
         escreval("Situação: Reprovado")
      fimse
   fimse
fimprocedimento

inicio
   verificarSituacao()
fimalgoritmo

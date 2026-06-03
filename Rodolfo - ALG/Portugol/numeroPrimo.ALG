Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 30/03/2026
Var
numero, numeroDigitado, contador: inteiro

Inicio
escreva("Digite um número: ")
leia(numeroDigitado)

contador <- 0

para numero de 1 ate numeroDigitado faca
     se numeroDigitado % numero = 0 entao
        contador <- contador + 1
     fimse
fimpara

se contador = 2 entao
   escreva("Número primo!")
senao
   escreva("Não é primo!")
fimse

Fimalgoritmo
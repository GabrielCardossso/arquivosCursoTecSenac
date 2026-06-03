Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 30/03/2026
Var
numeroDigitado, numero, contador: inteiro


Inicio
contador <- 0

para numero de 1 ate 10 faca
     escreva("Digite um número: ")
     leia(numeroDigitado)
     
     se numeroDigitado % 2 = 0 entao
        contador <- contador + 1
     fimse
fimpara

escreva("Quantidade de numeros pares: ", contador)

Fimalgoritmo
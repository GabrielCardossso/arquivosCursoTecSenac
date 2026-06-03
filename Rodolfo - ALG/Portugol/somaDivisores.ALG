Algoritmo "somaDivisores"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 30/03/2026
Var
numero, numeroDigitado, soma: inteiro

Inicio
escreva("Digite um número: ")
leia(numeroDigitado)
soma <- 0

para numero de 1 ate numeroDigitado faca
     se numeroDigitado % numero = 0 entao
        soma <- soma + numero
     fimse
fimpara

escreval("A soma dos divisores de ", numeroDigitado, " é: ", soma)
Fimalgoritmo
Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 30/03/2026
Var
numero, numeroDigitado, maior: inteiro

Inicio
para numero de 1 ate 5 faca
     escreva("Digite um numero: ")
     leia(numeroDigitado)
     
     se numeroDigitado = 1 entao
        maior <- numeroDigitado
        senao
             se numeroDigitado > maior entao
             maior <- numeroDigitado
             fimse
        fimse
fimpara

escreva("Maior numero: ", maior)

Fimalgoritmo
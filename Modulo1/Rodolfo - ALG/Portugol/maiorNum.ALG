Algoritmo "provaDiagnosticaQ1"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : maior valor (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 02/04/2026
Var
// Seção de Declarações das variáveis 
numero, numeroDigitado, maior: inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...

para numero de 1 ate 5 faca
     escreva("Digite um número: ")
     leia(numeroDigitado)

     se numeroDigitado = 1 entao
        maior <- numeroDigitado
        senao
             se numeroDigitado > maior entao
             maior <- numeroDigitado
             fimse
        fimse
fimpara

escreva("O maior número é: ", maior)


Fimalgoritmo
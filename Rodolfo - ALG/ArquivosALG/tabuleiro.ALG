Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 27/03/2026
Var
// Seção de Declarações das variáveis 
linha, coluna: inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
   escreval("Tabuleiro de Xadrez")

   escreva("   ")
   para coluna de 1 ate 8 faca
      escreva(" ", carac(64 + coluna), " ")
   fimpara
   escreval("")

   para linha de 1 ate 8 faca
      escreva(linha, " ")

      para coluna de 1 ate 8 faca
         se((linha + coluna) % 2 = 0) entao
            escreva("[#]")
         senao
            escreva("[ ]")
         fimse
      fimpara

      escreval("")
   fimpara

Fimalgoritmo
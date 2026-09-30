Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 17/04/2026
Var
// Seção de Declarações das variáveis 
A, B, C: inteiro
D, X: inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite A (0 ou 1): ")
leia(a)
escreval("Digite B (0 ou 1): ")
leia(b)
escreval("Digite C (0 ou 1): ")
leia(c)

se (A = 1) e (b = 1) entao
   D <- 1
   senao
   D <- 0
   fimse
   
   se (D = 1) ou (C = 1) entao
   X <- 1
   senao
   x <- 0
   fimse
   
   escreval("Saida X = ", X)

Fimalgoritmo
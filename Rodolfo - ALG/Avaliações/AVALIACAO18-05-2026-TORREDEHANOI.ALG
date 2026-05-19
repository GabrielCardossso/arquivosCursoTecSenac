Algoritmo "avaliacao18-05-2026-TorreDeHanoi"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Rodolfo

Var
   n : Inteiro
// inicio do procedimento que faz os movimentos dos discos de uma torre para outra
Procedimento Hanoi(discos: Inteiro; origem, destino, auxiliar: Caractere)
Inicio
   se discos = 1 entao
      Escreval("Mover disco ", discos, " de ", origem, " para ", destino)
   senao
      Hanoi(discos - 1, origem, auxiliar, destino)
      EscrevaL("Mover disco ", discos, " de ", origem, " para ", destino)
      Hanoi(discos - 1, auxiliar, destino, origem)
   fimse
fimProcedimento

Inicio
   Escreva("Informe a quantidade de discos: ")
   Leia(n)
   Escreval("=========================")
   Escreval("--- Movimentos para ", n, " disco(s) ---")
   Escreval("=========================")
   Hanoi(n, "A", "C", "B")
   Escreval("=========================")
   Escreval("Total de movimentos: ", (2^n) - 1)
FimAlgoritmo
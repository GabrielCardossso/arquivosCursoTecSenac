Algoritmo "avaliacao18-05-2026-quickSort"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Rodolfo

Var
   vet: vetor[1..100] de inteiro
   n, i, contador: inteiro

// inicio do procedimento responsavel para fazer a ordenação
procedimento quicksort(comeco, fim:inteiro)
var
    i, j, pivot, temporario: inteiro

inicio
   i <- comeco
   j <- fim

   // escolher o pivô
   pivot <- vet[(comeco + fim) div 2]

   enquanto i <= j faca
      // procurar o elemento maior que o pivo
      enquanto vet[i] < pivot faca
           i <- i+1
      fimenquanto
      // procurar o elemento menor que o pivo
      enquanto vet[j] > pivot faca
           j <- j-1
      fimenquanto

      // trocar elementos
      se i<=j entao
         temporario <-vet[i]
         vet[i] <- vet[j]
         vet[j] <- temporario

         i <- i + 1
         j <- j - 1
      fimse
   fimenquanto

   // recursao lado esquedo
   se comeco < j entao
      quicksort(comeco, j)
   fimse

   // recursao lado direito
   se i < fim entao
      quicksort(i, fim)
   fimse
   contador <-contador + 1
fimprocedimento


Inicio
   contador <- 0
   escreval("Quick Sort")
   escreval("=||==||==||==||=")

   escreval("Digite a quantidade de numeros (max 100): ")
   leia(n)

   // leitura do vetor
   para i de 1 ate n faca
      escreval("Digite o valor da posicao ", i, ": ")
      leia(vet[i])
   fimpara

   // chamando quicksort com parametros
   quicksort(1, n)

   escreval("=||==||==||==||==||==||=")
   escreva(" Vetor ordenado: ")
   para i de 1 ate n faca
     escreva(vet[i], ", ")
   fimpara
   escreval(" Vezes que o procedimento foi chamado: ", contador)
Fimalgoritmo
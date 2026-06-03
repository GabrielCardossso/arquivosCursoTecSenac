Algoritmo "InsertionSort"

Var
vet: vetor[1..100] de inteiro
n, i, j, chave: inteiro

Inicio

escreval("INSERTION SORT")
escreval("Digite a quantidade de números (Máx 100)")
leia(n)

// leitura do vetor
para i de 1 ate n faca
   escreval("Digite o valor da posição ", i, ": ")
   leia(vet[i])
fimpara

// algoritmo insertion sort
para i de 2 ate n faca
   chave <- vet[i]
   j <- i - 1

   enquanto j >= 1 faca
      se vet[j] > chave entao
         vet[j+1] <- vet[j]
         j <- j - 1
      senao
         interrompa
      fimse
   fimenquanto

   vet[j+1] <- chave
fimpara
// exibir vetor ordenado
escreval("Vetor ordenado: ")
para i de 1 ate n faca
   escreval(vet[i], " ")
fimpara

Fimalgoritmo
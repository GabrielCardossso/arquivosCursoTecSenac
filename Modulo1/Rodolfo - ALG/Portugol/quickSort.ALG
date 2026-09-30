Algoritmo "QuickSort"

Var
vet: vetor[1..100] de inteiro
n: inteiro
i: inteiro
procedimento quickSort (start, end: inteiro)
var
i, j, pivo, temp: inteiro

inicio
i <- start
j <- end

// escolher pivot
pivo <- vet[(start + end) div 2]

 enquanto i <= j faca
// procurar elemento maior que o pivot
   enquanto vet[i] < pivo faca
            i <- i+1
   fimenquanto
// procurar elemento menor que o pivot
   enquanto vet[j] > pivo faca
            j <- j-1
   fimenquanto
   // trocar elementos
   se i <= j entao
      temp <- vet[i]
      vet[i] <- vet[j]
      vet[j] <- temp
      
      i <- i + 1
      j <- j - 1
   fimse
 fimenquanto

// recursao lado esquerdo
 se start < j entao
   quickSort(start, j)
 fimse

// recursao lado direito
 se start < end entao
   quickSort(i, end)
 fimse
fimprocedimento

Inicio
  escreval("Quick Sort")
  escreval("Digite a quantidade de numeros (max 100): ")
  leia(n)

// leitura do vetor
   para i de 1 ate n faca
        escreval("Digite o valor da posicao ", i, ": ")
        leia(vet[i])
   fimpara

// ordenamento usando quickSort
   quickSort(1, n)
   escreval("__________________________________________")
   escreval("Vetor ordenado: ")
   para i de 1 ate n faca
        escreva(vet[i], " ")
   fimpara

Fimalgoritmo
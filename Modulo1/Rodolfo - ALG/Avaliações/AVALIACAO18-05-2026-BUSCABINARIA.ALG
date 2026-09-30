Algoritmo "avaliacao18-05-2026-BUSCABINARIA"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Rodolfo

Var
  vet: vetor[1..100] de inteiro
  n, i, valor: inteiro
  comeco, fim, meio: inteiro
  encontrado: logico

Inicio
  escreval("Digite a quantidade de números (máx 100): ")
  leia(n)

  escreval("Digite os valores em ORDEM CRESCENTE!")
  // laço de repetição para inserir o valor das posições
  para i de 1 ate n faca
       escreval("Digite o valor da posição: ", i, ": ")
       leia(vet[i])
  fimpara

  escreval("Digite o valor que deseja buscar: ")
  leia(valor)

  comeco <- 1
  fim <- n
  encontrado <- falso
  // inicio da operação de busca
  enquanto (comeco <= fim) e (encontrado = falso) faca
     meio <- (comeco + fim) div 2
     se vet[meio] = valor entao
        encontrado <- verdadeiro
     senao
        se valor < vet[meio] entao
           fim <- meio -1
        senao
           comeco <- meio + 1
        fimse
     fimse
  fimenquanto
  // resultado
  se encontrado entao
     escreval("Valor encontrado na posição: ", meio)
  senao
     escreval("Valor não encontrado!")
  fimse
Fimalgoritmo
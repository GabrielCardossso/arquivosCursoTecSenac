algoritmo "buscaLinear"

Var
vet: vetor[1..100] de inteiro
n, i, valor: inteiro

Inicio

escreval("Digite a quantidade de números (max100): ")
leia(n)
escreval("Informe todos os valores em ordem crescente")
para i de 1 ate n faca
escreval("Digite o valor da posição ", i, ": ")
leia(vet[i])
fimpara
escreval("Informe o valor a ser buscado")
leia(valor)
i <- 1
enquanto (i <= n) e (vet[i]<>valor) faca
i <- i+1
fimenquanto

se i>n entao
escreval("Valor não encontrado")
senao
escreval("Valor encontrado na posição ", i)
fimse
fimalgoritmo
algoritmo "MDC_Recursivo_Euclides"
var
    a, b, resultado: inteiro

// Função recursiva para calcular o MDC
funcao inteiro mdc(inteiro x, inteiro y)
inicio
    // Caso base: se y for zero, o MDC é x
    se (y = 0) entao
        retorne x
    fimse

    // Chamada recursiva: mdc(y, x mod y)
    retorne mdc(y, x % y)
fimfuncao

inicio
    escreva("Digite o primeiro número inteiro: ")
    leia(a)

    escreva("Digite o segundo número inteiro: ")
    leia(b)

    // Garantir que os números sejam positivos para evitar problemas
    se (a < 0) entao
        a := -a
    fimse
    se (b < 0) entao
        b := -b
    fimse

    resultado := mdc(a, b)

    escreval("O MDC de ", a, " e ", b, " é: ", resultado)
fimalgoritmo

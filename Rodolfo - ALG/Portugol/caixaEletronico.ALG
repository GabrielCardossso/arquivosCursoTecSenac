algoritmo "caixa_eletronico"
var
   saldo, saque: real
inicio
   saldo <- 1000

   enquanto saldo > 0 faca
      escreval("Saldo atual: ", saldo)
      escreval("Digite valor do saque: ")
      leia(saque)

      se (saque <= 0) ou (saque > saldo) entao
         escreval("Valor inválido")
      senao
         saldo <- saldo - saque
      fimse
   fimenquanto

   escreva("Saldo zerado. Encerrando...")
fimalgoritmo
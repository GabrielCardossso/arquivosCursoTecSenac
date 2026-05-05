algoritmo "temperatura"
var
   temp: real
   critico: inteiro
inicio
   critico <- 0

   escreva("Digite temperaturas (-1 para sair): ")
   leia(temp)

   enquanto temp <> -1 faca
      se temp > 80 entao
         escreval("ALERTA: Temperatura crítica")
         critico <- critico + 1
      senao
         se temp >= 50 entao
            escreval("Temperatura elevada")
         senao
            escreval("Temperatura normal")
         fimse
      fimse

      leia(temp)
   fimenquanto

   escreva("Quantidade de críticas: ", critico)
fimalgoritmo
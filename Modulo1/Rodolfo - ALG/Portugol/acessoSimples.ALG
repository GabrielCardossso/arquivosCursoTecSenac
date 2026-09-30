algoritmo "acesso_simples"
var
   senha, tentativas: inteiro
inicio
   tentativas <- 0

   enquanto tentativas < 3 faca
      escreva("Digite a senha: ")
      leia(senha)

      se senha = 1234 entao
         escreva("Acesso permitido")
         interrompa
      senao
         escreval("Senha incorreta")
         tentativas <- tentativas + 1
      fimse
   fimenquanto

   se tentativas = 3 entao
      escreva("Acesso bloqueado")
   fimse
fimalgoritmo
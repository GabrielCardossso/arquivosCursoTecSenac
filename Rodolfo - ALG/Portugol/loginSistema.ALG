algoritmo "loginSistema"
var
   login: caractere
   senha: caractere
   tentativas: inteiro
inicio
   tentativas <- 0

   enquanto tentativas < 5 faca
      escreva("Login: ")
      leia(login)
      escreva("Senha: ")
      leia(senha)

      se login = "admin" entao
         se senha = "senha123" entao
            escreva("Bem-vindo ao sistema")
            interrompa
         senao
            escreval("Senha incorreta")
         fimse
      senao
         escreval("Usuário não encontrado")
      fimse

      tentativas <- tentativas + 1
   fimenquanto

   se tentativas = 5 entao
      escreva("Acesso bloqueado")
   fimse
fimalgoritmo
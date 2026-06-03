Algoritmo "batalha"

Var
opcao: inteiro
vidaJogador, vidaMonstro: inteiro
defendendo: logico

Inicio
vidaJogador <- 100
vidaMonstro <- 100
escreval("Controles e Info")
escreval("Você deve terminar a luta com mais de 15 de vida para derrota-lo")
escreval("O seu ataque e o ataque do monstro tira 15HP")
escreval("Ao se defender, não leva dano")
escreval("Ao se curar, você ganha 15 de vida")

enquanto (vidaJogador > 0) e (vidaMonstro > 0) faca

defendendo <- falso

         escreval("Sua vida: ", vidaJogador)
         escreval("Vida do monstro: ", vidaMonstro)

         escreval("=== BATALHA CONTRA MONSTRO ===")
         escreval("1 - Atacar")
         escreval("2 - Defender")
         escreval("3 - Curar")
         leia(opcao)
         
         se (opcao = 1) entao
            vidaMonstro <- vidaMonstro - 15
            escreval("Você atacou o Monstro! -15HP dele.")
         fimse
         
         se (opcao = 2) entao
            escreval("Você se defendeu!")
            defendendo <- verdadeiro
         fimse
         
         se (opcao = 3) entao
            vidaJogador <- vidaJogador + 20
            escreval("Você se curou! +10HP!")
         fimse
         
         se (defendendo = verdadeiro) entao
            vidaJogador <- vidaJogador - 0
            escreval("Você se defendeu! Nenhum dano sofrido")
         senao
            vidaJogador <- vidaJogador - 15
            escreval("O Monstro te atacou! Cuidado! -15HP.")
         fimse

fimEnquanto

se (vidaJogador <= 0) entao
   escreval("O Monstro acabou com você, tente denovo! :(")
senao
   escreval("Você acabou com ele, é isso aí! :)")
fimse

Fimalgoritmo
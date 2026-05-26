algoritmo "SistemaPadaria"

// ============================================================
// VARIAVEIS GLOBAIS
// Todas as variaveis locais foram movidas para o escopo global
// pois o VisualG3 tem bugs com muitas variaveis locais em procedimentos
// ============================================================
var
   // --- Vetores de produtos ---
   prodCodigo   : vetor[1..20] de inteiro
   prodNome     : vetor[1..20] de caractere
   prodPreco    : vetor[1..20] de real
   prodCusto    : vetor[1..20] de real
   prodEstoque  : vetor[1..20] de inteiro
   prodEstqMin  : vetor[1..20] de inteiro
   prodValidade : vetor[1..20] de inteiro

   // --- Matriz de vendas [produto, dia] ---
   matVendas    : vetor[1..20, 1..7] de inteiro

   // --- Controle geral ---
   totalProdutos : inteiro
   opcao         : caractere

   // --- Variaveis de cadastro ---
   cCod      : inteiro
   cNome     : caractere
   cPreco    : real
   cCusto    : real
   cEstq     : inteiro
   cEstqMin  : inteiro
   cValid    : inteiro
   cPosExist : inteiro
   cPodeCad  : inteiro

   // --- Variaveis de venda ---
   vCod       : inteiro
   vQtd       : inteiro
   vPagamento : inteiro
   vDia       : inteiro
   vPos       : inteiro
   vTotal     : real
   vDesconto  : real
   vTemDesc   : inteiro
   vPodeVend  : inteiro

   // --- Variaveis de busca e ordenacao ---
   bTermo    : caractere
   bCod      : inteiro
   bPInicio  : inteiro
   bPFim     : inteiro
   bMeio     : inteiro
   bAchou    : inteiro
   bEncontrou: inteiro

   // --- Variaveis de ordenacao ---
   oI      : inteiro
   oJ      : inteiro
   oMinIdx : inteiro
   oTmpInt : inteiro
   oTmpReal: real
   oTmpChr : caractere

   // --- Variaveis de relatorio ---
   rI            : inteiro
   rTotalVendido : inteiro
   rMaisVend     : inteiro
   rIndMaisVend  : inteiro
   rFaturamento  : real
   rLucro        : real
   rFatTotal     : real
   rLucroTotal   : real
   rVendasProd   : inteiro
   rContador     : inteiro

   // --- Variaveis auxiliares gerais ---
   auxI : inteiro
   auxJ : inteiro

// ============================================================
// FUNCOES
// ============================================================

funcao totalSemanaRecursivo(prod: inteiro; dia: inteiro): inteiro
var
   res : inteiro
inicio
   se dia > 7 entao
      retorne 0
   fimse
   res <- matVendas[prod, dia] + totalSemanaRecursivo(prod, dia + 1)
   retorne res
fimfuncao

funcao codigoExiste(cod: inteiro): inteiro
var
   fi    : inteiro
   fachou: inteiro
inicio
   fachou <- 0
   para fi <- 1 ate totalProdutos faca
      se prodCodigo[fi] = cod entao
         fachou <- fi
      fimse
   fimpara
   retorne fachou
fimfuncao

// ============================================================
// PROCEDIMENTOS
// ============================================================

procedimento inicializarSistema
inicio
   totalProdutos <- 0
   para auxI <- 1 ate 20 faca
      prodCodigo[auxI]   <- 0
      prodNome[auxI]     <- ""
      prodPreco[auxI]    <- 0.0
      prodCusto[auxI]    <- 0.0
      prodEstoque[auxI]  <- 0
      prodEstqMin[auxI]  <- 0
      prodValidade[auxI] <- 0
      para auxJ <- 1 ate 7 faca
         matVendas[auxI, auxJ] <- 0
      fimpara
   fimpara
   escreval("  Sistema inicializado.")
fimprocedimento

procedimento cadastrarProduto
inicio
   cPodeCad <- 1

   se totalProdutos >= 20 entao
      escreval("  [!] Limite de 20 produtos atingido.")
      cPodeCad <- 0
   fimse

   se cPodeCad = 1 entao
      escreval("")
      escreval("  ==============================")
      escreval("       CADASTRO DE PRODUTO      ")
      escreval("  ==============================")

      repita
         escreva("  Codigo do produto: ")
         leia(cCod)
         se cCod <= 0 entao
            escreval("  [!] Codigo invalido.")
         fimse
      ate cCod > 0

      cPosExist <- codigoExiste(cCod)
      se cPosExist > 0 entao
         escreval("  [!] Codigo ja cadastrado para: ", prodNome[cPosExist])
         cPodeCad <- 0
      fimse
   fimse

   se cPodeCad = 1 entao
      escreva("  Nome do produto: ")
      leia(cNome)

      repita
         escreva("  Preco de venda (R$): ")
         leia(cPreco)
         se cPreco <= 0 entao
            escreval("  [!] Preco invalido.")
         fimse
      ate cPreco > 0

      repita
         escreva("  Custo de producao (R$): ")
         leia(cCusto)
         se cCusto < 0 entao
            escreval("  [!] Custo invalido.")
         fimse
      ate cCusto >= 0

      repita
         escreva("  Quantidade em estoque: ")
         leia(cEstq)
         se cEstq < 0 entao
            escreval("  [!] Estoque invalido.")
         fimse
      ate cEstq >= 0

      repita
         escreva("  Estoque minimo: ")
         leia(cEstqMin)
         se cEstqMin < 0 entao
            escreval("  [!] Estoque minimo invalido.")
         fimse
      ate cEstqMin >= 0

      repita
         escreva("  Dias para vencer: ")
         leia(cValid)
         se cValid < 0 entao
            escreval("  [!] Validade invalida.")
         fimse
      ate cValid >= 0

      totalProdutos <- totalProdutos + 1
      prodCodigo[totalProdutos]   <- cCod
      prodNome[totalProdutos]     <- cNome
      prodPreco[totalProdutos]    <- cPreco
      prodCusto[totalProdutos]    <- cCusto
      prodEstoque[totalProdutos]  <- cEstq
      prodEstqMin[totalProdutos]  <- cEstqMin
      prodValidade[totalProdutos] <- cValid

      escreval("")
      escreval("  [OK] '", cNome, "' cadastrado! (Pos: ", totalProdutos, ")")
      escreval("")
      escreva("  Pressione ENTER para continuar...")
      leia(cNome)
   fimse
fimprocedimento

procedimento registrarVenda
inicio
   vPodeVend <- 1
   escreval("")
   escreval("  ==============================")
   escreval("       REGISTRO DE VENDA        ")
   escreval("  ==============================")

   se totalProdutos = 0 entao
      escreval("  [!] Nenhum produto cadastrado.")
      vPodeVend <- 0
   fimse

   se vPodeVend = 1 entao
      repita
         escreva("  Codigo do produto: ")
         leia(vCod)
         vPos <- codigoExiste(vCod)
         se vPos = 0 entao
            escreval("  [!] Produto nao encontrado.")
         fimse
      ate vPos > 0

      escreval("  Produto: ", prodNome[vPos], " | Estoque: ", prodEstoque[vPos])

      se prodEstoque[vPos] = 0 entao
         escreval("  [!] Sem estoque. Venda cancelada.")
         vPodeVend <- 0
      fimse
   fimse

   se vPodeVend = 1 entao
      repita
         escreva("  Quantidade: ")
         leia(vQtd)
         se vQtd <= 0 entao
            escreval("  [!] Quantidade invalida.")
         senao
            se vQtd > prodEstoque[vPos] entao
               escreval("  [!] Insuficiente! Disponivel: ", prodEstoque[vPos])
               vQtd <- 0
            fimse
         fimse
      ate vQtd > 0

      escreval("  Pagamento: 1-Dinheiro 2-Debito 3-Credito 4-PIX")
      repita
         escreva("  Opcao: ")
         leia(vPagamento)
         se (vPagamento < 1) ou (vPagamento > 4) entao
            escreval("  [!] Opcao invalida.")
         fimse
      ate (vPagamento >= 1) e (vPagamento <= 4)

      repita
         escreva("  Dia (1=Seg...7=Dom): ")
         leia(vDia)
         se (vDia < 1) ou (vDia > 7) entao
            escreval("  [!] Dia invalido.")
         fimse
      ate (vDia >= 1) e (vDia <= 7)

      vTemDesc <- 0
      se (vQtd >= 10) ou (vPagamento = 1) entao
         vTemDesc <- 1
      fimse

      vTotal <- prodPreco[vPos] * vQtd

      se vTemDesc = 1 entao
         vDesconto <- vTotal * 0.05
         vTotal    <- vTotal - vDesconto
         escreval("  [DESCONTO] 5%! Desconto: R$ ", vDesconto:0:2)
      senao
         vDesconto <- 0.0
      fimse

      prodEstoque[vPos]       <- prodEstoque[vPos] - vQtd
      matVendas[vPos, vDia]   <- matVendas[vPos, vDia] + vQtd

      escreval("")
      escreval("  --- RESUMO ---")
      escreval("  Produto : ", prodNome[vPos])
      escreval("  Qtd     : ", vQtd)
      escreval("  Unitario: R$ ", prodPreco[vPos]:0:2)
      se vTemDesc = 1 entao
         escreval("  Desconto: R$ ", vDesconto:0:2)
      fimse
      escreval("  Total   : R$ ", vTotal:0:2)
      escreval("  Estoque : ", prodEstoque[vPos], " restantes")

      se prodEstoque[vPos] <= prodEstqMin[vPos] entao
         escreval("  [ALERTA] Estoque baixo!")
      fimse

      se (prodValidade[vPos] <= 2) e (prodEstoque[vPos] > 0) entao
         escreval("  [PROMOCAO] Vence em ", prodValidade[vPos], " dia(s)!")
      fimse

      escreval("  [OK] Venda registrada!")
      escreval("")
   fimse
fimprocedimento

procedimento buscaLinearNome
inicio
   escreval("")
   escreval("  ==============================")
   escreval("     BUSCA LINEAR POR NOME      ")
   escreval("  ==============================")

   se totalProdutos = 0 entao
      escreval("  [!] Nenhum produto cadastrado.")
   senao
      escreva("  Nome do produto: ")
      leia(bTermo)

      bEncontrou <- 0
      para auxI <- 1 ate totalProdutos faca
         se prodNome[auxI] = bTermo entao
            bEncontrou <- 1
            escreval("")
            escreval("  Codigo  : ", prodCodigo[auxI])
            escreval("  Nome    : ", prodNome[auxI])
            escreval("  Preco   : R$ ", prodPreco[auxI]:0:2)
            escreval("  Estoque : ", prodEstoque[auxI], " un.")
            escreval("  Validade: ", prodValidade[auxI], " dia(s)")
         fimse
      fimpara

      se bEncontrou = 0 entao
         escreval("  Nenhum produto com nome: '", bTermo, "'")
      fimse

      escreval("")
      escreva("  ENTER para continuar...")
      leia(bTermo)
   fimse
fimprocedimento

procedimento selectionSort
inicio
   para oI <- 1 ate totalProdutos - 1 faca
      oMinIdx <- oI
      para oJ <- oI + 1 ate totalProdutos faca
         se prodCodigo[oJ] < prodCodigo[oMinIdx] entao
            oMinIdx <- oJ
         fimse
      fimpara

      se oMinIdx <> oI entao
         oTmpInt            <- prodCodigo[oI]
         prodCodigo[oI]     <- prodCodigo[oMinIdx]
         prodCodigo[oMinIdx]<- oTmpInt

         oTmpChr            <- prodNome[oI]
         prodNome[oI]       <- prodNome[oMinIdx]
         prodNome[oMinIdx]  <- oTmpChr

         oTmpReal           <- prodPreco[oI]
         prodPreco[oI]      <- prodPreco[oMinIdx]
         prodPreco[oMinIdx] <- oTmpReal

         oTmpReal           <- prodCusto[oI]
         prodCusto[oI]      <- prodCusto[oMinIdx]
         prodCusto[oMinIdx] <- oTmpReal

         oTmpInt             <- prodEstoque[oI]
         prodEstoque[oI]     <- prodEstoque[oMinIdx]
         prodEstoque[oMinIdx]<- oTmpInt

         oTmpInt              <- prodEstqMin[oI]
         prodEstqMin[oI]      <- prodEstqMin[oMinIdx]
         prodEstqMin[oMinIdx] <- oTmpInt

         oTmpInt               <- prodValidade[oI]
         prodValidade[oI]      <- prodValidade[oMinIdx]
         prodValidade[oMinIdx] <- oTmpInt

         oTmpInt              <- matVendas[oI, 1]
         matVendas[oI, 1]     <- matVendas[oMinIdx, 1]
         matVendas[oMinIdx, 1]<- oTmpInt

         oTmpInt              <- matVendas[oI, 2]
         matVendas[oI, 2]     <- matVendas[oMinIdx, 2]
         matVendas[oMinIdx, 2]<- oTmpInt

         oTmpInt              <- matVendas[oI, 3]
         matVendas[oI, 3]     <- matVendas[oMinIdx, 3]
         matVendas[oMinIdx, 3]<- oTmpInt

         oTmpInt              <- matVendas[oI, 4]
         matVendas[oI, 4]     <- matVendas[oMinIdx, 4]
         matVendas[oMinIdx, 4]<- oTmpInt

         oTmpInt              <- matVendas[oI, 5]
         matVendas[oI, 5]     <- matVendas[oMinIdx, 5]
         matVendas[oMinIdx, 5]<- oTmpInt

         oTmpInt              <- matVendas[oI, 6]
         matVendas[oI, 6]     <- matVendas[oMinIdx, 6]
         matVendas[oMinIdx, 6]<- oTmpInt

         oTmpInt              <- matVendas[oI, 7]
         matVendas[oI, 7]     <- matVendas[oMinIdx, 7]
         matVendas[oMinIdx, 7]<- oTmpInt
      fimse
   fimpara
   escreval("  [OK] Ordenado por codigo!")
fimprocedimento

procedimento buscaBinariaCodigo
inicio
   escreval("")
   escreval("  ==============================")
   escreval("   BUSCA BINARIA POR CODIGO     ")
   escreval("  ==============================")

   se totalProdutos = 0 entao
      escreval("  [!] Nenhum produto cadastrado.")
   senao
      selectionSort

      escreva("  Codigo do produto: ")
      leia(bCod)

      bPInicio <- 1
      bPFim    <- totalProdutos
      bAchou   <- 0

      enquanto (bPInicio <= bPFim) e (bAchou = 0) faca
         bMeio <- (bPInicio + bPFim) div 2
         se prodCodigo[bMeio] = bCod entao
            bAchou <- 1
         senao
            se bCod < prodCodigo[bMeio] entao
               bPFim <- bMeio - 1
            senao
               bPInicio <- bMeio + 1
            fimse
         fimse
      fimenquanto

      se bAchou = 1 entao
         escreval("")
         escreval("  [OK] Produto encontrado!")
         escreval("  Codigo  : ", prodCodigo[bMeio])
         escreval("  Nome    : ", prodNome[bMeio])
         escreval("  Preco   : R$ ", prodPreco[bMeio]:0:2)
         escreval("  Custo   : R$ ", prodCusto[bMeio]:0:2)
         escreval("  Estoque : ", prodEstoque[bMeio], " unidades")
         escreval("  Est.Min : ", prodEstqMin[bMeio], " unidades")
         escreval("  Validade: ", prodValidade[bMeio], " dia(s)")
      senao
         escreval("  [!] Codigo ", bCod, " nao encontrado.")
      fimse
      escreval("")
   fimse
fimprocedimento

procedimento ordenarProdutos
inicio
   se totalProdutos = 0 entao
      escreval("  [!] Nenhum produto cadastrado.")
   senao
      selectionSort
      escreval("")
      escreval("  Pos | Codigo | Nome                 | Preco    | Estoque")
      escreval("  ----|--------|----------------------|----------|--------")
      para auxI <- 1 ate totalProdutos faca
         escreva("  ", auxI:3, " | ", prodCodigo[auxI]:6, " | ")
         escreva(prodNome[auxI]:20, " | ")
         escreval("R$", prodPreco[auxI]:7:2, " | ", prodEstoque[auxI]:6)
      fimpara
      escreval("")
   fimse
fimprocedimento

procedimento relatorioGeral
inicio
   escreval("")
   escreval("  ============================================")
   escreval("         RELATORIO GERAL DO SISTEMA           ")
   escreval("  ============================================")

   se totalProdutos = 0 entao
      escreval("  Nenhum produto cadastrado.")
   senao
      rFatTotal    <- 0.0
      rLucroTotal  <- 0.0
      rMaisVend    <- 0
      rIndMaisVend <- 1

      para rI <- 1 ate totalProdutos faca
         rVendasProd  <- totalSemanaRecursivo(rI, 1)
         rFaturamento <- rVendasProd * prodPreco[rI]
         rLucro       <- rVendasProd * (prodPreco[rI] - prodCusto[rI])
         rFatTotal    <- rFatTotal  + rFaturamento
         rLucroTotal  <- rLucroTotal + rLucro

         escreval("  Produto : ", prodNome[rI], " (cod:", prodCodigo[rI], ")")
         escreval("    Vendas  : ", rVendasProd, " un. | Fat: R$", rFaturamento:0:2, " | Lucro: R$", rLucro:0:2)
         escreval("    Estoque : ", prodEstoque[rI], " unidades")
         escreval("")

         se rVendasProd > rMaisVend entao
            rMaisVend    <- rVendasProd
            rIndMaisVend <- rI
         fimse
      fimpara

      escreval("  ============================================")
      escreval("  FATURAMENTO TOTAL: R$ ", rFatTotal:0:2)
      escreval("  LUCRO TOTAL      : R$ ", rLucroTotal:0:2)
      escreval("  ============================================")
      escreval("  MAIS VENDIDO: ", prodNome[rIndMaisVend], " (", rMaisVend, " un.)")
      escreval("")

      escreval("  --- Estoque Abaixo do Minimo ---")
      rTotalVendido <- 0
      para rI <- 1 ate totalProdutos faca
         se prodEstoque[rI] < prodEstqMin[rI] entao
            escreval("  [!] ", prodNome[rI], " estoque:", prodEstoque[rI], " min:", prodEstqMin[rI])
            rTotalVendido <- rTotalVendido + 1
         fimse
      fimpara
      se rTotalVendido = 0 entao
         escreval("  Todos adequados.")
      fimse

      escreval("")
      escreval("  --- Validade <= 2 dias ---")
      rTotalVendido <- 0
      para rI <- 1 ate totalProdutos faca
         se (prodValidade[rI] <= 2) e (prodEstoque[rI] > 0) entao
            escreval("  [PROMO] ", prodNome[rI], " vence em ", prodValidade[rI], " dia(s)!")
            rTotalVendido <- rTotalVendido + 1
         fimse
      fimpara
      se rTotalVendido = 0 entao
         escreval("  Nenhum proximo ao vencimento.")
      fimse
      escreval("")
   fimse
fimprocedimento

procedimento relatorioEstoqueBaixo
inicio
   escreval("")
   escreval("  ==============================")
   escreval("   PRODUTOS COM ESTOQUE BAIXO   ")
   escreval("  ==============================")

   se totalProdutos = 0 entao
      escreval("  Nenhum produto cadastrado.")
   senao
      rContador <- 0
      para rI <- 1 ate totalProdutos faca
         se prodEstoque[rI] < prodEstqMin[rI] entao
            rContador <- rContador + 1
            escreval("")
            escreval("  Produto : ", prodNome[rI])
            escreval("  Codigo  : ", prodCodigo[rI])
            escreval("  Estoque : ", prodEstoque[rI], " unidades")
            escreval("  Minimo  : ", prodEstqMin[rI], " unidades")
            escreval("  Deficit : ", prodEstqMin[rI] - prodEstoque[rI], " unidades")
         fimse
      fimpara

      se rContador = 0 entao
         escreval("  Todos com estoque adequado!")
      senao
         escreval("")
         escreval("  Total com estoque baixo: ", rContador)
      fimse
      escreval("")
   fimse
fimprocedimento

procedimento exibirMenu
inicio
   escreval("")
   escreval("  ============================================")
   escreval("     SISTEMA DE GERENCIAMENTO DE PADARIA      ")
   escreval("  ============================================")
   escreval("   1 - Cadastrar produto")
   escreval("   2 - Registrar venda")
   escreval("   3 - Buscar por nome  (Busca Linear)")
   escreval("   4 - Buscar por codigo (Busca Binaria)")
   escreval("   5 - Ordenar produtos")
   escreval("   6 - Relatorio geral")
   escreval("   7 - Estoque baixo")
   escreval("   0 - Sair")
   escreval("  ============================================")
   escreva("   Opcao: ")
fimprocedimento

// ============================================================
// PROGRAMA PRINCIPAL
// ============================================================
inicio
   inicializarSistema

   escreval("")
   escreval("  Bem-vindo ao Sistema de Padaria!")
   escreval("")

   repita
      exibirMenu
      leia(opcao)

      se opcao = "1" entao
         cadastrarProduto
      senao
         se opcao = "2" entao
            registrarVenda
         senao
            se opcao = "3" entao
               buscaLinearNome
            senao
               se opcao = "4" entao
                  buscaBinariaCodigo
               senao
                  se opcao = "5" entao
                     ordenarProdutos
                  senao
                     se opcao = "6" entao
                        relatorioGeral
                     senao
                        se opcao = "7" entao
                           relatorioEstoqueBaixo
                        senao
                           se opcao = "0" entao
                              escreval("  Ate logo!")
                           senao
                              escreval("  [!] Opcao invalida.")
                           fimse
                        fimse
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse

   ate opcao = "0"

fimalgoritmo

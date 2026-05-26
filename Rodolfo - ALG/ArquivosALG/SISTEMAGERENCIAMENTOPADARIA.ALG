Algoritmo "SistemaGerenciamentoPadaria"
Const
   MAX_PRODUTOS = 20
   MAX_DIAS = 7

Var
   codigos: vetor[1..MAX_PRODUTOS] de inteiro
   nomes: vetor[1..MAX_PRODUTOS] de caractere
   precos: vetor[1..MAX_PRODUTOS] de real
   custo: vetor[1..MAX_PRODUTOS] de real
   estoques: vetor[1..MAX_PRODUTOS] de inteiro
   estoquesMinimos: vetor[1..MAX_PRODUTOS] de inteiro
   diasParaVencer: vetor[1..MAX_PRODUTOS] de inteiro

   vendas: vetor[1..MAX_PRODUTOS, 1..MAX_DIAS] de inteiro

   faturamentoProduto: vetor[1..MAX_PRODUTOS] de real
   lucroProduto: vetor[1..MAX_PRODUTOS] de real
   qtdProdutos: inteiro
   opcao: inteiro


funcao buscarIndicePorCodigo(codigoBusca: inteiro): inteiro
  var
   i: inteiro
  inicio
    para i de 1 ate qtdProdutos faca
       se codigos[i]= codigoBusca entao
         retorne i
       fimse
    fimpara
    retorne -1
fimfuncao

funcao buscaLinearPorNome(nomeBusca: caractere): inteiro
  var
   i: inteiro
  inicio
    para i de 1 ate qtdProdutos faca
       se nomes[i] = nomeBusca entao
         retorne i
       fimse
    fimpara
    retorne -1
fimfuncao

procedimento trocarProdutos(pos1,pos2:inteiro)
  var
    tempInt: inteiro
    tempReal: real
    tempChar: caractere
    d: inteiro
  inicio

    tempInt <- codigos[pos1]
    codigos[pos1] <- codigos[pos2]
    codigos[pos2] <- tempInt

    tempChar <-nomes[pos1]
    nomes[pos1] <- nomes[pos2]
    nomes[pos2] < tempChar

    tempReal <- custos[pos1]
    custos[pos1] <- custos[pos2]
    custos[pos2] <- tempReal

    tempInt <- estoques[pos1]
    estoques[pos1] <- estoques[pos2]
    estoques[pos2] <- tempInt

    tempInt <- estoquesMinimos[pos1]
    estoquesMinimos[pos1] <- estoquesMinimos[pos2]
    estoquesMinimos[pos2] <- tempInt

    tempInt <- diasParaVencer[pos1]
    diasParaVencer[pos1] <- diasParaVencer[pos2]
    diasParaVencer[pos2] <- tempInt

    tempReal <- faturamentoProduto[pos1]
    faturamentoProduto[pos1] <- faturamentoProduto[pos2]
    faturamentoProduto[pos2] <- tempReal

    tempReal <- lucroProduto[pos1]
    lucroProduto[pos1] <- lucroProduto[pos2]
    lucroProduto[pos2] <- tempReal

    para d de 1 ate MAX_DIAS faca
      tempInt <- vendas[pos1,d]
      vendas[pos1,d] <- vendas[pos2,d]
      vendas[pos2,d] <- tempInt
    fimpara
fimprocedimento

procedimento ordenarPorPreco()
  var
   i,j,menos: inteiro
  inicio
    se qtdProdutos = 0 entao
      escreval("Nenhum produto cadastrado.")
    senao
      para i de 1 ate qtdProdutos - 1 faca
           menor <- i
           para j de i+1 ate qtdProdutos faca
                se precos[j] < precos[menor] entao
                  menor <- j
                fimse
           fimpara
           se menor <> i entao
             trocarProdutos(i, menor)
           fimse
      fimpara
      escreval("Produtos ordenados por preço com Selection Sort")
    fimse
fimprocedimento

procedimento ordenarPorCodigo()
  var
    i, j, menor: inteiro
  inicio
    se qtdProdutos > 1 entao
      para i de 1 ate qtdProdutos - 1 faca
        menor <- i
        para j de i+1 ate qtdProdutos faca
          se codigos[j] <  codigos[menor] entao
            menor <- j
          fimse
        fimpara
        se menor <> i entao
         trocarProdutos(i, menor)
        fimse
      fimpara
    fimse
fimprocedimento

funcao buscaBinariaPorCodigo(codigoBusca: inteiro): inteiro
   var
      inicioBusca, fimBusca, meio: inteiro
   inicio
     ordenarPorCodigo()

     inicioBusca <- 1
     fimBusca <- qtdProdutos

     enquanto inicioBusca <= fimBusca faca
       meio <- (inicioBusca + fimBusca) div 2
       se codigos[meio] = codigoBusca entao
        retorne meio
       senao
        se codigoBusca < codigo[meio] entao
         fimBusca <- meio -1
        senao
         inicioBusca <- meio + 1
        fimse
       fimse
     fimenquanto
     retorne -1
fimfuncao

funcao totalSemana(produto: inteiro; dia: inteiro): inteiro
  inicio
    se dia > MAX_DIAS entao
      retorne 0
    senao
      retorne vendas[produto, dia] + totalSemana(produto, dia+1)
    fimse
fimfuncao

procedimento inicializarMatrizes()
  var
    i, d: inteiro
  inicio
    para i de 1 ate MAX_PRODUTOS faca
      faturamentoProduto[i] <- 0
      lucroProduto[i] <- 0

      para d de 1 ate MAX_DIAS faca
        vendas[i,d] <- 0
      fimpara
    fimpara
fimprocedimento

procedimento cadastrarProdutos()
var
  continuar: caractere
  codigoDigitado: inteiro
  indiceExistente: inteiro
  inicio
    continuar <- "S"

    enquanto (continuar = "S") ou (continuar = "s") faca
       se qtdProdutos >= MAX_PRODUTOS entao
         escreval("Limite máximo de produtos atingido")
         continuar <- "N"
       senao
         escreval("")
         escreval("++++++++++CADASTRO DE PRODUTOS++++++++++++")
         escreva("Codigo: ")
         leia(codigoDigitado)
         indiceExistente <- buscarIndicePorCodigo(codigoDigitado)
         se indiceExistente <> -1 entao
           escreval("Erro: já existe um produto com esse código.")
         senao
           qtdProdutos <- qtdProdutos + 1
           codigos[qtdProdutos] <- codigoDigitado
           escreva("Nome: ")
           leia(nomes[qtdProdutos])

           escreva("Preço de venda: R$ ")
           leia(precos[qtdProdutos])

           escreva("Custo de produção: R$ ")
           leia(custos[qtdProdutos])

           escreva("Quantidade em estoque: ")
           leia(estoques[qtdProdutos])

           escreva("Estoque mínimo: ")
           leia(estoquesMinimos[qtdProdutos])

           escreva("Dias para vencer: ")
           leia(diasParaVencer[qtdProdutos])

           escreval("Produto cadastrado com sucesso")

           se (diasParaVencer[qtdProdutos] <=2) e (estoques[qtdProdutos] > 0) entao
             escreval("Atenção: produto perto do vencimento. Sugerir promocao.")
           fimse
         fimse
         escreva("Deseja cadastrar outro produto? (S/N): ")
         leia(continuar)
       fimse
    fimenquanto
fimprocedimento

procedimento registrarVenda()
   var
     codigoBusca, quantidade, dia: inteiro
     formaPagamento: caractere
     indice: inteiro
     valorBruto, desconto, valorFinal, lucroVendaTotal: real
   inicio
     se qtdProdutos = 0 entao
        escreval("Nenhum produto cadastrado.")
     senao
        escreval("")
        escreval("+++++++++++REGISTRO DE VENDA++++++++++++)
        escreva("Informe o dia da venda, de 1 a 7: ")
        leia(dia)

        se (dia<1)ou (dia>7) entao
          escreval("Dia inválido.")
        senao
          escreval("Codigo do produto.")
          leia(codigoBusca)

          indice <- buscaIndicePorCodigo(codigoBusca)

          se indide = -1 entao
            escreval("Produto não encontrado.")
          senao
            escreval("Produto encontrado: ", nomes[indice])
            escreval("Estoque atual: ", estoques[indice])
            escreva("Quantidade vendida: ")
            leia(quantidade)

            escreva("Forma de pagamento, ex: dinheiro, cartao, pix: ")
            leia(formaPagamento)

            se quantidade <=0 entao
              escreval("Quantidade inválida.")
            senao
              se estoques[indice] >= quantidade entao

                valorBruto <- precos[indice] * quantidade
                desconto <- 0

                se (quantidade >=10) ou (formaPagamento = "dinheiro") entao
                  desconto <- valorBruto * 0.05
                fimse

                valorFinal <- valorBruto - desconto
                lucroVendaAtual <- valorFinal - (custos[indice]*quantidade)

                estoques[indice] <- estoques[indice] - quantidade
                vendas[indice,dia] <- vendas[indice,dia] + quantidade

                faturamentoProduto[indice] <- faturamentoProduto[indice] + valorFinal
                lucroProduto[indice] <- lucroProduto[indice] + lucroVendaAtual

                escreval("")
                escreval("Venda realizada com sucesso")
                escreval("Valor Bruto: R$ ", valorBruto:6:2)
                escreval("Desconto: R$ ", desconto:6:2)
                escreval("Valor final: R$ ", valorFinal:6:2)
                escreval("Lucro da venda: R$ ", lucroVendaAtual:6:2)
                escreval("Estoque atualizado: ", estoques[indice])

                se estoques[indice]<estoquesMinimos[indice] entao
                  escreval("ALERTA: estoque abaixo do mínimo. Reposição necessária.")
                fimse
                se (diasParaVencer[indice] <= 2) e (estoques[indice] >0) entao
                  escreval("SUGESTÃO: produto perto do vencimento. Criar promoção.")
                fimse
              senao
                escreval("Erro: estoque insuficiente.")
              fimse
            fimse
           fimse
          fimse
        fimse
fimprocedimento

procedimento buscarProdutoPorNome()
    var
       nomeBusca: caractere
       indice: inteiro
    inicio
      se qtdProdutos = 0 entao
        escreval("Nenhum produto cadastrado.")
      senao
        escreval("")
        escreval("++++++++++++BUSCA LINEAR POR NOME+++++++++++++)
        escreva("Digite o nome do produto: ")
        leia(nomeBusca)

        indice <- buscaLinearPorNome(nomeBusca)

        se indice = -1 entao
          escreval("Produto não encontrado.")
        senao
          escreval("Produto encontrado!")
          escreval("Código: ", codigos[indice])
          escreval("Nome: ", nomes[indice])
          escreval("Preço: R$ ", precos[indice])
          escreval("Custo: R$ ",  custos[indice])
          escreval("Estoque: ", estoques[indice])
          escreval("Estoque mínimo: ", estoquesMinimos[indice])
          escreval("Dias para vencer: ", diasParaVencer[indice])
        fimse
      fimse
fimprocedimento

procedimento mostrarMenu()
inicio
   escreval("")
   escreval("===========================================")
   escreval(" SISTEMA DE GERENCIAMENTO DE PADARIA ")
   escreval("===========================================")
   escreval("1 - Cadastrar produtos")
   escreval("2 - Registrar venda")
   escreval("3 - Buscar produto por nome")
   escreval("4 - Buscar produto por código")
   escreval("5 - Ordenar produtos")
   escreval("6 - Relatório geral")
   escreval("7 - Produtos com estoque baixo")
   escreval("0 - Sair")
fimprocedimento

Inicio
  qtdProdutos<-0
  inicializarMatrizes()

  repita
     mostrarMenu()
     leia(opcao)

     escolha opcao
        caso 1
           cadastrarProdutos()
        caso 2
           registrarVendas()
        caso 3
           buscarProdutoPorNome()
        caso 4
           //buscaProdutoPorCodigo()
        caso 5
          //ordenarPorPreco()
          //listarProdutos()

        caso 6
           //relatoriGeral()
        caso 7
           // produtosEstoqueBaixo()
        caso 8
           //listaProdutos
        caso 0
           escreval("Encerrando o sistema .... ")
        outrocaso
           escreval("Opção inválida")
      fimescolha
     ate opcao = 0

Fimalgoritmo
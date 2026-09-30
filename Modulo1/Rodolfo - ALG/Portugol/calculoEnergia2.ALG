Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 27/04/2026
Var
// Seção de Declarações das variáveis
consumoMensal, geracaoSolar, tarifa, taxaFixa, consumoLiquido, total: real
taxaBandeira: real
bandeira: caractere

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
escreval("+-------------------------------+")
escreval("| CALCULO DE CONSUMO DE ENERGIA |")
escreval("+-------------------------------+")

escreval("Informe as informações e o")
escreval("sistema calculará o total R$ para você!")

escreval("Digite o consumo mensal (kWh): ")
leia(consumoMensal)
escreval("Digite a geração solar mensal (kWh): ")
leia(geracaoSolar)
escreval("Digite o valor da tarifa (R$/kWh): ")
leia(tarifa)
escreval("Digite a taxa fixa (R$): ")
leia(taxaFixa)
escreval("Digite o tipo de bandeira (verde, amarela, vermelha): ")
leia(bandeira)
escreva("Digite o valor da taxa da bandeira (R$/kWh): ")
leia(taxaBandeira)

consumoLiquido <- consumoMensal - geracaoSolar

se (consumoLiquido <= 0) entao
   total <- taxaFixa
senao
   total <- (consumoLiquido * tarifa) + (consumoLiquido * taxaBandeira) + taxaFixa
fimse

escreval("+-------------------------------+")
escreval("|         - RESULTADO -         |")
escreval("+-------------------------------+")

escreval("Consumo líquido: ", consumoLiquido, " kWh")
escreval("Bandeira: ", bandeira)
escreval("Valor total da conta: R$ ", total:0:2)
   
Fimalgoritmo
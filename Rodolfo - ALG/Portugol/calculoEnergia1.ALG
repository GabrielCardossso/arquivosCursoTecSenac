Algoritmo "calculoEnergia"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 27/04/2026
Var
// Seção de Declarações das variáveis 
consumoMensal, geracaoSolar, tarifa, taxaFixa, consumoLiquido, total: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Digite o consumo mensal (kWh): ")
leia(consumoMensal)
escreval("Digite a geração solar mensal (kWh): ")
leia(geracaoSolar)
escreval("Digite o valor da tarifa (R$/kWh): ")
leia(tarifa)
escreval("Digite a taxa fixa (R$): ")
leia(taxaFixa)

consumoLiquido <- consumoMensal - geracaoSolar

se (consumoLiquido <= 0) entao
   total <- taxaFixa
senao
   total <- (consumoLiquido * tarifa) + taxaFixa
fimse

escreval("Consumo líquido: ", consumoLiquido, " kWh")
escreval("Valor total da conta: R$", total:0:2)

Fimalgoritmo
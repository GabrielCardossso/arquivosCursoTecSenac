Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi 
// Descrição   : Fazer um sistema que pega informações do usuário e salva, e mostra na tela (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 01/04/2026
Var
// Seção de Declarações das variáveis 
nome, email, rua, bairro, cidade, estado, pais, telefone, dataNascimento, cpf: caracter
numeroCasa: inteiro

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc... 
escreval("Informe o seu nome: ")
leia(nome)
escreval("Informe a sua data de nascimento: ")
leia(dataNascimento)
escreval("Informe o seu número de telefone: ")
leia(telefone)
escreval("Informe o seu email: ")
leia(email)
escreval("Informe o seu CPF: ")
leia(cpf)
escreval("Informe seu país: ")
leia(pais)
escreval("Informe seu estado: ")
leia(estado)
escreval("Informe sua cidade: ")
leia(cidade)
escreval("Informe seu bairro: ")
leia(bairro)
escreval("Informe sua rua: ")
leia(rua)
escreval("Informe o número da sua casa: ")
leia(numeroCasa)

escreval("Olá, ", nome, ", tudo bem? Aqui está as informações que eu sei sobre você:")
escreval("Sua data de nascimento é: ", dataNascimento)
escreval("Seu telefone é: ", telefone)
escreval("Seu email é: ", email)
escreval("Seu CPF é: ", cpf)
escreval("Você mora em: ", rua, ", ", numeroCasa, ", ", bairro, ", ", cidade, ", ", estado,", ", pais)
escreval("Esse foi o relátorio, tenha um bom dia!")
Fimalgoritmo
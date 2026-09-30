-- criação da tabela cliente
CREATE TABLE cliente (
idCliente SERIAL PRIMARY KEY,
nomeCliente VARCHAR(100) NOT NULL, 
cpfCliente VARCHAR(14) UNIQUE NOT NULL,
telefoneCliente VARCHAR(20) NOT NULL, 
emailCliente VARCHAR(100), 
enderecoCliente VARCHAR(150), 
dataCadastroCliente DATE NOT NULL
);
-- criação da tabela funcionario
CREATE TABLE funcionario (
idFuncionario SERIAL PRIMARY KEY, 
nomeFuncionario VARCHAR(100) NOT NULL, 
cpfFuncionario VARCHAR(14) UNIQUE NOT NULL, 
telefoneFuncionario VARCHAR(20), 
cargoFuncionario VARCHAR(50) NOT NULL, 
salarioFuncionario DECIMAL(10,2),
dataAdmissaoFuncionario DATE
);
-- criação da tabela categoria
CREATE TABLE categoria (
idCategoria SERIAL PRIMARY KEY, 
nomeCategoria VARCHAR(50) NOT NULL, 
descricaoCategoria VARCHAR(150) 
);
-- criação da tabela produto
CREATE TABLE produto (
idProduto SERIAL PRIMARY KEY, 
nomeProduto VARCHAR(100) NOT NULL, 
descricaoProduto VARCHAR(200), 
valorProduto DECIMAL(10,2) NOT NULL, 
estoqueProduto INTEGER NOT NULL, 
categoriaId INTEGER, 
ativoProduto BOOLEAN
);
-- criação da tabela pedido
CREATE TABLE pedido (
idPedido SERIAL PRIMARY KEY, 
clienteId INTEGER, 
funcionarioId INTEGER, 
dataPedido TIMESTAMP NOT NULL, 
valorTotalPedido DECIMAL(10,2), 
statusPedido VARCHAR(30) 
);
-- criação da tabela itemPedido
CREATE TABLE itemPedido (
idItemPedido SERIAL PRIMARY KEY, 
pedidoId INTEGER, 
produtoId INTEGER, 
quantidadeItemPedido INTEGER NOT NULL, 
valorUnitarioItemPedido DECIMAL(10,2) NOT NULL, 
subtotalItemPedido DECIMAL(10,2)
);
-- criação da tabela pagamento
CREATE TABLE pagamento (
idPagamento SERIAL PRIMARY KEY, 
pedidoId INTEGER, 
formaPagamentoPagamento VARCHAR(30) NOT NULL, 
valorPagoPagamento DECIMAL(10,2) NOT NULL, 
dataPagamentoPagamento TIMESTAMP, 
statusPagamentoPagamento VARCHAR(30)
);

-- 2)
-- produto referencia ao categoria
ALTER TABLE produto
ADD CONSTRAINT fk_produto_categoria
FOREIGN KEY (categoriaId)
REFERENCES categoria(idCategoria);

-- pedido referencia ao cliente
ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (clienteId)
REFERENCES cliente(idCliente);

-- pedido referencia ao funcionario
ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_funcionario
FOREIGN KEY (funcionarioId)
REFERENCES funcionario(idFuncionario);

-- itemPedido referencia ao pedido
ALTER TABLE itemPedido
ADD CONSTRAINT fk_itemPedido_pedido
FOREIGN KEY (pedidoId)
REFERENCES pedido(idPedido);

-- itemPedido referencia ao produto
ALTER TABLE itemPedido
ADD CONSTRAINT fk_itemPedido_produto
FOREIGN KEY (produtoId)
REFERENCES produto(idProduto);

-- pagamento referencia ao pedido
ALTER TABLE pagamento
ADD CONSTRAINT fk_pagamento_pedido
FOREIGN KEY (pedidoId)
REFERENCES pedido(idPedido);

-- 3) fazendo os 3 inserts nas tabelas
-- cliente
INSERT INTO cliente (nomeCliente, cpfCliente, telefoneCliente, emailCliente, enderecoCliente, dataCadastroCliente)
VALUES
('Gabriel Cardoso', '111.111.111-11', '48999990001', 'gabriel@gmail.com', 'Rua A', '2026-01-10'),
('Ana Beatriz', '222.222.222-22', '48999990002', 'ana@gmail.com', 'Rua B', '2026-02-15'),
('Gustavo Pacheco', '333.333.333-33', '48999990003', 'gustavo@gmail.com', 'Rua C', '2026-03-20');

-- funcionario
INSERT INTO funcionario (nomeFuncionario, cpfFuncionario, telefoneFuncionario, cargoFuncionario, salarioFuncionario, dataAdmissaoFuncionario)
VALUES
('Carlos Claudino', '444.444.444-44', '48999990004', 'Atendente', 2000.00, '2025-05-10'),
('Kauan Germano', '555.555.555-55', '48999990005', 'Caixa', 2200.00, '2025-06-12'),
('Kauã Cascaes', '666.666.666-66', '48999990006', 'Cozinheiro', 2500.00, '2025-07-01');

-- categoria
INSERT INTO categoria (nomeCategoria, descricaoCategoria)
VALUES
('Salgados', 'Pastéis salgados'),
('Doces', 'Pastéis doces'),
('Bebidas', 'Refrigerantes e sucos');

-- produto
INSERT INTO produto (nomeProduto, descricaoProduto, valorProduto, estoqueProduto, categoriaId, ativoProduto)
VALUES
('Pastel de Carne', 'Carne moída', 8.50, 50, 1, true),
('Pastel de Chocolate', 'Chocolate ao leite', 9.00, 40, 2, true),
('Refrigerante Lata', 'Coca-Cola 350ml', 5.00, 100, 3, true);

-- pedido
INSERT INTO pedido (clienteId, funcionarioId, dataPedido, valorTotalPedido, statusPedido)
VALUES
(1, 1, NOW(), 13.50, 'Finalizado'),
(2, 2, NOW(), 9.00, 'Finalizado'),
(3, 3, NOW(), 5.00, 'Pendente');

-- itemPedido
INSERT INTO itemPedido (pedidoId, produtoId, quantidadeItemPedido, valorUnitarioItemPedido, subtotalItemPedido)
VALUES
(1, 1, 1, 8.50, 8.50),
(1, 3, 1, 5.00, 5.00),
(2, 2, 1, 9.00, 9.00);

-- pagamento
INSERT INTO pagamento (pedidoId, formaPagamentoPagamento, valorPagoPagamento, dataPagamentoPagamento, statusPagamentoPagamento)
VALUES
(1, 'Dinheiro', 13.50, NOW(), 'Pago'),
(2, 'Cartão', 9.00, NOW(), 'Pago'),
(3, 'Pix', 5.00, NOW(), 'Pendente');

-- 4) listando
-- a) listar todos os produtos cadastrados
SELECT * FROM produto;
-- b) listar os clientes que começam o nome com A
SELECT * FROM cliente WHERE nomeCliente LIKE 'A%';
-- c) listar os produtos com valor entre 8 e 9 reais
SELECT * FROM produto WHERE valorProduto BETWEEN 8 AND 9;
-- d) listar os produtos em ordem alfabética pelo nome
SELECT * FROM produto ORDER BY nomeProduto ASC;
-- e) listar os produtos do mais caro ao mais barato
SELECT * FROM produto ORDER BY valorProduto DESC;
-- f) exibir os 3 primeiros clientes cadastrados
SELECT * FROM cliente WHERE idCliente <= 3;
-- g) listar os produtos que possuem o valor maior que 8 e estoque maior que 35 unidades
SELECT * FROM produto WHERE valorProduto > 8 AND estoqueProduto > 35;
-- h) listar os funcionarios que possuem cargo Atendente ou Caixa
SELECT * FROM funcionario WHERE cargoFuncionario = 'Atendente' OR cargoFuncionario = 'Caixa';
-- i) listar os produtos que possuem o estoque maior que 5 unidades e ordenar pelo valor sendo do maior para o menor
SELECT * FROM produto WHERE estoqueProduto > 5 ORDER BY valorProduto DESC;
-- j) listar os clientes que possuem a letra Z no final do nome (nao tinha nenhum que terminasse com A, então fiz com Z)
SELECT * FROM cliente WHERE nomeCliente ILIKE '%Z';
-- k) criar uma consulta usando WHERE, AND ou OR e ORDER BY
SELECT * FROM pagamento WHERE statusPagamentoPagamento = 'Pago'
AND formaPagamentoPagamento = 'Cartão' 
ORDER BY valorPagoPagamento DESC;
-- Explicando oque fiz: Selecionei os pagamentos onde o status é 'Pago' e que a forma de pagamento é 'Cartão'
-- em seguida, ordenei a ordem de exibição, usando o valor pago do maior para o menor
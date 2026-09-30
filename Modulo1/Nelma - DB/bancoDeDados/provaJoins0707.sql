-- ===== CREATES =====

CREATE TABLE cliente (
    idCliente SERIAL PRIMARY KEY,
    nomeCliente VARCHAR(100),
    telefoneCliente VARCHAR(20),
    emailCliente VARCHAR(100)
);

CREATE TABLE categoria (
    idCategoria SERIAL PRIMARY KEY,
    nomeCategoria VARCHAR(50)
);

CREATE TABLE fornecedor (
    idFornecedor SERIAL PRIMARY KEY,
    nomeFornecedor VARCHAR(100),
    cidadeFornecedor VARCHAR(100)
);

CREATE TABLE produto (
    idProduto SERIAL PRIMARY KEY,
    nomeProduto VARCHAR(100),
    precoProduto DECIMAL(10,2),
    categoriaId INTEGER,
    fornecedorId INTEGER,
    FOREIGN KEY (categoriaId) REFERENCES categoria(idCategoria),
    FOREIGN KEY (fornecedorId) REFERENCES fornecedor(idFornecedor)
);

CREATE TABLE funcionario (
    idFuncionario SERIAL PRIMARY KEY,
    nomeFuncionario VARCHAR(100),
    cargoFuncionario VARCHAR(50)
);

CREATE TABLE pedido (
    idPedido SERIAL PRIMARY KEY,
    dataPedido DATE,
    clienteId INTEGER,
    funcionarioId INTEGER,
    FOREIGN KEY (clienteId) REFERENCES cliente(idCliente),
    FOREIGN KEY (funcionarioId) REFERENCES funcionario(idFuncionario)
);

CREATE TABLE itemPedido (
    idItemPedido SERIAL PRIMARY KEY,
    pedidoId INTEGER,
    produtoId INTEGER,
    quantidadeItemPedido INTEGER,
    FOREIGN KEY (pedidoId) REFERENCES pedido(idPedido),
    FOREIGN KEY (produtoId) REFERENCES produto(idProduto)
);

CREATE TABLE entrega (
    idEntrega SERIAL PRIMARY KEY,
    pedidoId INTEGER,
    statusEntrega VARCHAR(50),
    dataEntrega DATE,
    FOREIGN KEY (pedidoId) REFERENCES pedido(idPedido)
);

CREATE TABLE receita (
    idReceita SERIAL PRIMARY KEY,
    produtoId INTEGER,
    tempoPreparoReceita INTEGER,
    nivelDificuldadeReceita VARCHAR(50),
    FOREIGN KEY (produtoId) REFERENCES produto(idProduto)
);


-- ===== INSERTS ======

INSERT INTO cliente (nomeCliente, telefoneCliente, emailCliente) VALUES
('Ana Souza', '119999999', 'ana@email.com'),
('Bruno Lima', '219888888', 'bruno@email.com'),
('Carla Mendes', '319777777', 'carla@email.com'),
('Daniel Rocha', '419666666', 'daniel@email.com'),
('Fernanda Alves', '519555555', 'fernanda@email.com');

INSERT INTO categoria (nomeCategoria) VALUES
('Bolos'),
('Donuts'),
('Bebidas'),
('Salgados');

INSERT INTO fornecedor (nomeFornecedor, cidadeFornecedor) VALUES
('Dona Farinha LTDA', 'São Paulo'),
('Açúcar & Cia', 'Curitiba'),
('Leite Puro', 'Porto Alegre'),
('Chocolate Belga Import', 'Bruxelas');

INSERT INTO produto (nomeProduto, precoProduto, categoriaId, fornecedorId) VALUES
('Donut de Chocolate', 8.50, 2, 4),
('Bolo Red Velvet', 35.00, 1, 1),
('Cappuccino Cremoso', 12.00, 3, 3),
('Donut Simples', 6.00, 2, 2),
('Bolo de Cenoura', 30.00, 1, 1),
('Cookie Americano', 10.00, 4, 2),
('Brownie Especial', 15.00, 1, 3);

INSERT INTO funcionario (nomeFuncionario, cargoFuncionario) VALUES
('João Silva', 'Atendente'),
('Mariana Alves', 'Barista'),
('Pedro Santos', 'Confeiteiro'),
('Lucas Pereira', 'Gerente');

INSERT INTO pedido (dataPedido, clienteId, funcionarioId) VALUES
('2026-06-01', 1, 1),
('2026-06-02', 2, 2),
('2026-06-03', 3, 1),
('2026-06-04', 1, 3),
('2026-06-05', 2, 2),
('2026-06-06', 5, 1);

INSERT INTO itemPedido (pedidoId, produtoId, quantidadeItemPedido) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 4, 3),
(4, 5, 1),
(5, 6, 2),
(6, 7, 1);

INSERT INTO entrega (pedidoId, statusEntrega, dataEntrega) VALUES
(1, 'Entregue', '2026-06-02'),
(2, 'Entregue', '2026-06-03'),
(3, 'Em rota', NULL),
(4, 'Pendente', NULL),
(5, 'Entregue', '2026-06-06');

INSERT INTO receita (produtoId, tempoPreparoReceita, nivelDificuldadeReceita) VALUES
(1, 15, 'Fácil'),
(2, 60, 'Difícil'),
(3, 10, 'Fácil'),
(4, 12, 'Fácil'),
(5, 55, 'Médio'),
(6, 20, 'Fácil');


-- ===== RESOLUÇÃO =====

-- 3) A)

SELECT pedido.idPedido, cliente.nomeCliente, funcionario.nomeFuncionario
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
INNER JOIN funcionario
ON pedido.funcionarioId = funcionario.idFuncionario;

-- 3) B)

SELECT itemPedido.idItemPedido, produto.nomeProduto, itemPedido.quantidadeItemPedido
FROM itemPedido
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto;

-- 3) C) 

SELECT produto.nomeProduto, categoria.nomeCategoria
FROM produto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria;

-- 3) D)

SELECT pedido.idPedido, pedido.dataPedido, cliente.nomeCliente
FROM pedido
INNER JOIN cliente
ON pedido.clienteId = cliente.idCliente
WHERE cliente.nomeCliente = 'Ana Souza';

-- 3) E)

SELECT produto.nomeProduto, categoria.nomeCategoria
FROM produto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria
WHERE categoria.nomeCategoria = 'Donuts';

-- 3) F)

SELECT produto.nomeProduto, receita.niveldificuldadereceita
FROM produto
INNER JOIN receita
ON produto.idProduto = receita.produtoId
WHERE receita.niveldificuldadereceita = 'Fácil';

-- 3) G)

SELECT pedido.idPedido, pedido.dataPedido, funcionario.nomeFuncionario, funcionario.cargofuncionario
FROM pedido
INNER JOIN funcionario
ON pedido.funcionarioId = funcionario.idFuncionario
WHERE funcionario.cargoFuncionario = 'Barista';

-- 3) H)

SELECT cliente.nomeCliente, pedido.idPedido, pedido.dataPedido
FROM cliente
LEFT JOIN pedido
ON cliente.idCliente = pedido.clienteId;

-- 3) I)

SELECT funcionario.nomeFuncionario, pedido.idPedido, pedido.dataPedido
FROM funcionario
LEFT JOIN pedido
ON funcionario.idFuncionario = pedido.funcionarioId;

-- 3) J)

SELECT fornecedor.nomeFornecedor, fornecedor.cidadeFornecedor, produto.nomeProduto
FROM fornecedor
LEFT JOIN produto
ON fornecedor.idFornecedor = produto.fornecedorId;

-- 3) K)

SELECT pedido.idPedido, pedido.dataPedido, entrega.statusEntrega, entrega.dataEntrega
FROM pedido
LEFT JOIN entrega
ON pedido.idPedido = entrega.pedidoId;


-- 4) A)

SELECT pedido.idPedido, pedido.dataPedido, entrega.statusEntrega, entrega.dataEntrega
FROM pedido
RIGHT JOIN entrega
ON pedido.idPedido = entrega.pedidoId;

-- 4) B)

SELECT pedido.idPedido, cliente.nomeCliente, funcionario.nomeFuncionario
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
RIGHT JOIN funcionario
ON pedido.funcionarioId = funcionario.idFuncionario;

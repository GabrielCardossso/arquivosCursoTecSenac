-- Criando

CREATE TABLE cliente (
    idCliente SERIAL PRIMARY KEY,
    nomeCliente VARCHAR(100) NOT NULL,
    cidadeCliente VARCHAR(50) NOT NULL
);

CREATE TABLE vendedor (
    idVendedor SERIAL PRIMARY KEY,
    nomeVendedor VARCHAR(100) NOT NULL
);

CREATE TABLE categoria (
    idCategoria SERIAL PRIMARY KEY,
    nomeCategoria VARCHAR(50) NOT NULL
);

CREATE TABLE produto (
    idProduto SERIAL PRIMARY KEY,
    nomeProduto VARCHAR(100) NOT NULL,
    precoProduto NUMERIC(10,2) NOT NULL,

    categoriaId INTEGER NOT NULL,

    CONSTRAINT fkProdutoCategoria
        FOREIGN KEY (categoriaId)
        REFERENCES categoria(idCategoria)
);

CREATE TABLE pedido (
    idPedido SERIAL PRIMARY KEY,

    dataPedido DATE NOT NULL,

    clienteId INTEGER NOT NULL,
    vendedorId INTEGER NOT NULL,

    CONSTRAINT fkPedidoCliente
        FOREIGN KEY (clienteId)
        REFERENCES cliente(idCliente),

    CONSTRAINT fkPedidoVendedor
        FOREIGN KEY (vendedorId)
        REFERENCES vendedor(idVendedor)
);

CREATE TABLE itemPedido (
    idItemPedido SERIAL PRIMARY KEY,

    quantidadeItemPedido INTEGER NOT NULL,

    pedidoId INTEGER NOT NULL,
    produtoId INTEGER NOT NULL,

    CONSTRAINT fkItemPedidoPedido
        FOREIGN KEY (pedidoId)
        REFERENCES pedido(idPedido),

    CONSTRAINT fkItemPedidoProduto
        FOREIGN KEY (produtoId)
        REFERENCES produto(idProduto)
);

-- Inserts

INSERT INTO cliente
(nomeCliente, cidadeCliente)
VALUES
('João Silva', 'Tubarão'),
('Maria Souza', 'Jaguaruna'),
('Carlos Lima', 'Criciúma'),
('Fernanda Rocha', 'Braço do Norte'),
('Juliana Costa', 'Imbituba'),
('Pedro Gomes', 'Laguna'),
('Ana Martins', 'Araranguá'),
('Marcos Pereira', 'Içara');

INSERT INTO vendedor
(nomeVendedor)
VALUES
('Ricardo Alves'),
('Ana Oliveira'),
('Pedro Martins'),
('Lucas Mendes');

INSERT INTO categoria
(nomeCategoria)
VALUES
('Informática'),
('Periféricos'),
('Games'),
('Escritório'),
('Rede');

INSERT INTO produto
(nomeProduto, precoProduto, categoriaId)
VALUES
('Notebook Dell', 4500.00, 1),
('Notebook Lenovo', 3900.00, 1),
('Mouse Gamer', 180.00, 2),
('Teclado Mecânico', 320.00, 2),
('Monitor LG', 1200.00, 1),
('Headset Gamer', 450.00, 3),
('Cadeira Gamer', 1700.00, 3),
('Impressora Epson', 980.00, 4),
('Switch 24 Portas', 850.00, 5),
('Roteador TP-Link', 290.00, 5),
('Webcam Logitech', 260.00, 2),
('Microfone USB', 390.00, 3);

INSERT INTO pedido
(dataPedido, clienteId, vendedorId)
VALUES
('2026-01-10', 1, 1),
('2026-01-11', 2, 2),
('2026-01-12', 3, 1),
('2026-01-15', 1, 3),
('2026-01-20', 5, 2),
('2026-01-22', 6, 4),
('2026-01-25', 7, 3),
('2026-01-27', 4, 1),
('2026-01-29', 8, 4),
('2026-02-01', 2, 2);

INSERT INTO itemPedido
(quantidadeItemPedido, pedidoId, produtoId)
VALUES
(1,1,1),
(2,1,3),
(1,2,4),
(1,2,8),
(1,3,5),
(1,4,6),
(1,4,7),
(3,5,3),
(2,5,4),
(1,6,9),
(2,6,10),
(1,7,2),
(1,7,6),
(1,8,1),
(2,8,5),
(2,9,11),
(1,9,12),
(1,10,3),
(1,10,4);

-- Consultas Atividade
-- 1) A)

SELECT cliente.nomeCliente, cliente.cidadeCliente, pedido.dataPedido
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId;

-- B)

SELECT pedido.idPedido, vendedor.nomeVendedor
FROM pedido
INNER JOIN vendedor
ON vendedor.idVendedor = pedido.vendedorId;

-- C) 

SELECT produto.nomeProduto, produto.precoProduto, categoria.nomeCategoria
FROM produto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria;

-- D) 

SELECT cliente.nomeCliente, vendedor.nomeVendedor, pedido.dataPedido
FROM pedido
INNER JOIN vendedor
ON pedido.vendedorId = vendedor.idVendedor
INNER JOIN cliente
ON pedido.clienteId = cliente.idCliente;

-- E) 

SELECT produto.nomeProduto, categoria.nomeCategoria, produto.precoProduto
FROM produto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria
ORDER BY categoria.nomeCategoria ASC;

-- F)

SELECT cliente.nomeCliente, cliente.cidadeCliente, produto.nomeProduto, categoria.nomeCategoria
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
INNER JOIN itemPedido
ON pedido.idPedido = itemPedido.pedidoId
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria;

-- G)

SELECT cliente.nomeCliente, vendedor.nomeVendedor, produto.nomeProduto
FROM pedido
INNER JOIN cliente
ON pedido.clienteId = cliente.idCliente
INNER JOIN vendedor
ON pedido.vendedorId = vendedor.idVendedor
INNER JOIN itemPedido
ON itemPedido.pedidoId = pedido.IdPedido
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto;

-- H)

SELECT cliente.nomeCliente, vendedor.nomeVendedor, produto.nomeProduto, categoria.nomeCategoria
FROM pedido
INNER JOIN cliente
ON pedido.clienteId = cliente.idCliente
INNER JOIN vendedor
ON pedido.vendedorId = vendedor.idVendedor
INNER JOIN itemPedido
ON itemPedido.pedidoId = pedido.IdPedido
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria
ORDER BY cliente.nomeCliente ASC;

-- I) 

SELECT produto.nomeProduto, cliente.nomeCliente
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
INNER JOIN itemPedido
ON pedido.idPedido = itemPedido.pedidoId
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria
WHERE categoria.nomeCategoria = 'Games';

-- J)

SELECT cliente.nomeCliente, produto.nomeProduto
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
INNER JOIN itemPedido
ON pedido.idPedido = itemPedido.pedidoId
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria
WHERE categoria.nomeCategoria = 'Periféricos';

-- K)

SELECT pedido.idPedido
FROM pedido
INNER JOIN vendedor
ON pedido.vendedorId = vendedor.idVendedor
WHERE vendedor.nomeVendedor = 'Ricardo Alves';

-- L.1)
-- Exibir nome do cliente e o nome do produto comprado pelo cliente Ana Martins

SELECT cliente.nomeCliente, produto.nomeProduto
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
INNER JOIN itemPedido
ON pedido.idPedido = itemPedido.pedidoId
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto
WHERE cliente.nomeCliente = 'Ana Martins';

-- L.2)
-- Exibir o nome dos produtos que pertencem a categoria Rede
SELECT produto.nomeProduto
FROM produto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria
WHERE categoria.nomeCategoria = 'Rede';

-- L.3)
-- Exibir nome dos clientes e nome do produto dos clientes que compraram algum produto da categoria Escritório
SELECT cliente.nomeCliente, produto.nomeProduto
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
INNER JOIN itemPedido
ON pedido.idPedido = itemPedido.pedidoId
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria
WHERE categoria.nomeCategoria = 'Escritório';

-- L.4)
-- Exibir o nome do cliente e o nome do produto que foram comprados em mais de uma quantidade
SELECT cliente.nomeCliente, produto.nomeProduto
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
INNER JOIN itemPedido
ON pedido.idPedido = itemPedido.pedidoId
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto
WHERE itemPedido.quantidadeitempedido > 1;

-- L.5)
-- Exibir o nome dos clientes que fizeram pedidos no dia 2026-01-29
SELECT cliente.nomeCliente
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
WHERE pedido.datapedido = '2026-01-29';

-- L.6)
-- Exibir o nome do produto e o preco do produto que pertence a categoria Games
SELECT produto.nomeProduto, produto.precoProduto
FROM produto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria
WHERE categoria.nomeCategoria = 'Games';

-- L.7)
-- Exibir o nome do cliente, a cidade do cliente e o produto dos clientes que compraram um produto da
-- categoria Periféricos OU Informática, e que são da cidade de tubarão
SELECT cliente.nomeCliente, produto.nomeProduto
FROM cliente
INNER JOIN pedido
ON cliente.idCliente = pedido.clienteId
INNER JOIN itemPedido
ON pedido.idPedido = itemPedido.pedidoId
INNER JOIN produto
ON itemPedido.produtoId = produto.idProduto
INNER JOIN categoria
ON produto.categoriaId = categoria.idCategoria
WHERE categoria.nomeCategoria IN ('Periféricos', 'Informática')
AND cliente.cidadeCliente = 'Tubarão';

-- Obrigado!
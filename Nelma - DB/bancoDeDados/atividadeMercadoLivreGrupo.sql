CREATE DATABASE mercado_livre;

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome_usuario VARCHAR(100) NOT NULL,
    email_usuario VARCHAR(150) NOT NULL,
    senha_usuario VARCHAR(255) NOT NULL,
    telefone_usuario VARCHAR(20),
    cpf_usuario VARCHAR(14) UNIQUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fornecedor (
    id_fornecedor SERIAL PRIMARY KEY,
    nome_fornecedor VARCHAR(150) NOT NULL,
    email_fornecedor VARCHAR(150),
    telefone_fornecedor VARCHAR(20),
    cnpj_fornecedor VARCHAR(18) UNIQUE
);

CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria TEXT
);

CREATE TABLE produto (
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(150) NOT NULL,
    descricao_produto TEXT,
    preco_produto NUMERIC(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

CREATE TABLE pedido (
    id_pedido SERIAL PRIMARY KEY,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pedido VARCHAR(50),
    valor_total NUMERIC(10,2)
);

CREATE TABLE item_pedido (
    id_item_pedido SERIAL PRIMARY KEY,
    quantidade_produto INT NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL
);

CREATE TABLE pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    forma_pagamento VARCHAR(50),
    status_pagamento VARCHAR(50),
    valor_pagamento NUMERIC(10,2)
);

CREATE TABLE entrega (
    id_entrega SERIAL PRIMARY KEY,
    endereco_entrega VARCHAR(255),
    cidade_entrega VARCHAR(100),
    estado_entrega VARCHAR(50),
    cep_entrega VARCHAR(10),
    status_entrega VARCHAR(50),
    data_entrega DATE
);

ALTER TABLE produto
ADD COLUMN usuario_id INT;

ALTER TABLE produto
ADD CONSTRAINT fk_produto_usuario
FOREIGN KEY (usuario_id)
REFERENCES usuario(id_usuario);

ALTER TABLE produto
ADD COLUMN categoria_id INT;

ALTER TABLE produto
ADD CONSTRAINT fk_produto_categoria
FOREIGN KEY (categoria_id)
REFERENCES categoria(id_categoria);

ALTER TABLE produto
ADD COLUMN fornecedor_id INT;

ALTER TABLE produto
ADD CONSTRAINT fk_produto_fornecedor
FOREIGN KEY (fornecedor_id)
REFERENCES fornecedor(id_fornecedor);

ALTER TABLE pedido
ADD COLUMN usuario_id INT;

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_usuario
FOREIGN KEY (usuario_id)
REFERENCES usuario(id_usuario);

ALTER TABLE item_pedido
ADD COLUMN pedido_id INT;

ALTER TABLE item_pedido
ADD CONSTRAINT fk_itempedido_pedido
FOREIGN KEY (pedido_id)
REFERENCES pedido(id_pedido);

ALTER TABLE item_pedido
ADD COLUMN produto_id INT;

ALTER TABLE item_pedido
ADD CONSTRAINT fk_itempedido_produto
FOREIGN KEY (produto_id)
REFERENCES produto(id_produto);

ALTER TABLE pagamento
ADD COLUMN pedido_id INT;

ALTER TABLE pagamento
ADD CONSTRAINT fk_pagamento_pedido
FOREIGN KEY (pedido_id)
REFERENCES pedido(id_pedido);

ALTER TABLE entrega
ADD COLUMN pedido_id INT;

ALTER TABLE entrega
ADD CONSTRAINT fk_entrega_pedido
FOREIGN KEY (pedido_id)
REFERENCES pedido(id_pedido);

INSERT INTO usuario (
    nome_usuario,
    email_usuario,
    senha_usuario,
    telefone_usuario,
    cpf_usuario
)
VALUES
('Gabriel Marcos', 'gabriel@gmail.com', '123456', '48999999999', '111.111.111-11'),
('Richard Marcos', 'richard@gmail.com', '654321', '48988888888', '222.222.222-22'),
('Carlos Silva', 'carlos@gmail.com', 'abcdef', '48977777777', '333.333.333-33'),
('Ana Souza', 'ana@gmail.com', 'ana123', '48966666666', '444.444.444-44'),
('Lucas Martins', 'lucas@gmail.com', 'lucas123', '48955555555', '555.555.555-55'),
('Fernanda Lima', 'fernanda@gmail.com', 'fernanda123', '48944444444', '666.666.666-66'),
('Pedro Henrique', 'pedro@gmail.com', 'pedro123', '48933333333', '777.777.777-77'),
('Julia Costa', 'julia@gmail.com', 'julia123', '48922222222', '888.888.888-88');

INSERT INTO fornecedor (
    nome_fornecedor,
    email_fornecedor,
    telefone_fornecedor,
    cnpj_fornecedor
)
VALUES
('Tech Imports', 'contato@techimports.com', '4833333333', '11.111.111/0001-11'),
('Mega Eletronicos', 'vendas@mega.com', '4844444444', '22.222.222/0001-22'),
('Global Games', 'suporte@globalgames.com', '4855555555', '33.333.333/0001-33'),
('Lux Joias', 'contato@luxjoias.com', '4866666666', '44.444.444/0001-44'),
('Style Fashion', 'vendas@stylefashion.com', '4877777777', '55.555.555/0001-55'),
('StreetWear Brasil', 'contato@streetwear.com', '4888888888', '66.666.666/0001-66'),
('Casa Tech', 'suporte@casatech.com', '4899999999', '77.777.777/0001-77'),
('Top Imports', 'imports@topimports.com', '4811111111', '88.888.888/0001-88');

INSERT INTO categoria (
    nome_categoria,
    descricao_categoria
)
VALUES
('Games', 'Produtos relacionados a jogos'),
('Eletronicos', 'Produtos eletrônicos em geral'),
('Informatica', 'Produtos de informática'),
('Roupas', 'Produtos de vestuário'),
('Joias', 'Joias e acessórios'),
('Tenis', 'Tênis esportivos e casuais'),
('Celulares', 'Smartphones e acessórios'),
('Moveis', 'Móveis para casa'),
('Perifericos', 'Teclados, mouses e headsets'),
('Relogios', 'Relógios masculinos e femininos');

INSERT INTO produto (
    nome_produto,
    descricao_produto,
    preco_produto,
    quantidade_estoque,
    usuario_id,
    categoria_id,
    fornecedor_id
)
VALUES
(
    'Playstation 5',
    'Console Sony Playstation 5',
    4500.00,
    10,
    1,
    1,
    3
),
(
    'Notebook Gamer',
    'Notebook com GTX 1650',
    5200.00,
    5,
    2,
    3,
    1
),
(
    'iPhone 15',
    'Smartphone Apple',
    7000.00,
    8,
    3,
    2,
    2
),
(
    'Corrente Prata',
    'Corrente de prata masculina',
    299.90,
    15,
    4,
    5,
    4
),
(
    'Camiseta Oversized',
    'Camiseta streetwear preta',
    119.90,
    30,
    5,
    4,
    6
),
(
    'Nike Air Force',
    'Tênis Nike Air Force branco',
    799.90,
    12,
    6,
    6,
    5
),
(
    'iPhone 14',
    'Smartphone Apple 128GB',
    5200.00,
    7,
    7,
    7,
    8
),
(
    'Mesa Gamer',
    'Mesa gamer com LED',
    950.00,
    4,
    8,
    8,
    7
),
(
    'Headset Redragon',
    'Headset gamer RGB',
    250.00,
    20,
    1,
    9,
    7
),
(
    'Rolex Premium',
    'Relógio de luxo masculino',
    1500.00,
    5,
    2,
    10,
    4
);

INSERT INTO pedido (
    usuario_id,
    status_pedido,
    valor_total
)
VALUES
(1, 'Aprovado', 4500.00),
(2, 'Em andamento', 5200.00),
(3, 'Enviado', 7000.00),
(4, 'Entregue', 299.90),
(5, 'Em transporte', 119.90),
(6, 'Aprovado', 799.90),
(7, 'Preparando envio', 5200.00),
(8, 'Entregue', 950.00);

INSERT INTO item_pedido (
    pedido_id,
    produto_id,
    quantidade_produto,
    valor_unitario
)
VALUES
(1, 1, 1, 4500.00),
(2, 2, 1, 5200.00),
(3, 3, 1, 7000.00),
(4, 4, 1, 299.90),
(5, 5, 1, 119.90),
(6, 6, 1, 799.90),
(7, 7, 1, 5200.00),
(8, 8, 1, 950.00);

INSERT INTO pagamento (
    pedido_id,
    forma_pagamento,
    status_pagamento,
    valor_pagamento
)
VALUES
(1, 'PIX', 'Pago', 4500.00),
(2, 'Cartao de Credito', 'Pendente', 5200.00),
(3, 'Boleto', 'Pago', 7000.00),
(4, 'PIX', 'Pago', 299.90),
(5, 'Cartao de Debito', 'Pago', 119.90),
(6, 'Cartao de Credito', 'Pago', 799.90),
(7, 'Boleto', 'Pendente', 5200.00),
(8, 'PIX', 'Pago', 950.00);

INSERT INTO entrega (
    pedido_id,
    endereco_entrega,
    cidade_entrega,
    estado_entrega,
    cep_entrega,
    status_entrega,
    data_entrega
)
VALUES
(
    1,
    'Rua A, 100',
    'Capivari de Baixo',
    'SC',
    '88745-000',
    'Entregue',
    '2026-05-20'
),
(
    2,
    'Rua B, 200',
    'Tubarão',
    'SC',
    '88701-000',
    'Em transporte',
    '2026-05-22'
),
(
    3,
    'Rua C, 300',
    'Florianopolis',
    'SC',
    '88000-000',
    'Preparando envio',
    '2026-05-25'
),
(
    4,
    'Rua das Flores, 55',
    'Tubarão',
    'SC',
    '88700-000',
    'Entregue',
    '2026-05-18'
),
(
    5,
    'Avenida Central, 99',
    'Laguna',
    'SC',
    '88790-000',
    'Em transporte',
    '2026-05-22'
),
(
    6,
    'Rua XV de Novembro, 120',
    'Criciuma',
    'SC',
    '88800-000',
    'A caminho',
    '2026-05-23'
),
(
    7,
    'Rua Beira Mar, 777',
    'Florianopolis',
    'SC',
    '88000-000',
    'Preparando envio',
    '2026-05-25'
),
(
    8,
    'Rua São José, 450',
    'Braço do Norte',
    'SC',
    '88750-000',
    'Entregue',
    '2026-05-17'
);

SELECT * FROM usuario;

SELECT * FROM fornecedor;

SELECT * FROM categoria;

SELECT * FROM produto;

SELECT * FROM pedido;

SELECT * FROM item_pedido;

SELECT * FROM pagamento;

SELECT * FROM entrega;
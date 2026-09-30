-- CREATE TABLES
CREATE TABLE cliente (
    idCliente SERIAL PRIMARY KEY,
    nomeCliente VARCHAR(100),
    cidadeCliente VARCHAR(50),
    telefoneCliente VARCHAR(20)
);

CREATE TABLE funcionario (
    idFuncionario SERIAL PRIMARY KEY,
    nomeFuncionario VARCHAR(100),
    cargoFuncionario VARCHAR(50)
);

CREATE TABLE quarto (
    idQuarto SERIAL PRIMARY KEY,
    numeroQuarto INTEGER,
    tipoQuarto VARCHAR(50),
    valorDiaria DECIMAL(10,2)
);

CREATE TABLE reserva (
    idReserva SERIAL PRIMARY KEY,
    dataEntradaReserva DATE,
    dataSaidaReserva DATE,
    statusReserva VARCHAR(20),
    clienteId INTEGER,
    funcionarioId INTEGER,
    quartoId INTEGER,
    FOREIGN KEY (clienteId) REFERENCES cliente(idCliente),
    FOREIGN KEY (funcionarioId) REFERENCES funcionario(idFuncionario),
    FOREIGN KEY (quartoId) REFERENCES quarto(idQuarto)
);

CREATE TABLE pagamento (
    idPagamento SERIAL PRIMARY KEY,
    valorPagamento DECIMAL(10,2),
    formaPagamento VARCHAR(30),
    reservaId INTEGER,
    FOREIGN KEY (reservaId) REFERENCES reserva(idReserva)
);

-- INSERT CLIENTE
INSERT INTO cliente VALUES
(1,'Ana Souza','Tubarão','9999-1111'),
(2,'Bruno Lima','Laguna','9999-2222'),
(3,'Carlos Mendes','Jaguaruna','9999-3333'),
(4,'Daniela Rocha','Capivari','9999-4444'),
(5,'Eduardo Alves','Tubarão','9999-5555'),
(6,'Fernanda Costa','Imbituba','9999-6666'),
(7,'Gabriel Pereira','Laguna','9999-7777'),
(8,'Helena Martins','Blumenau','9999-8888');

-- INSERT FUNCIONARIO
INSERT INTO funcionario VALUES
(1,'João Silva','Recepção'),
(2,'Marcos Souza','Gerência'),
(3,'Patrícia Lima','Limpeza'),
(4,'Ricardo Alves','Recepção');

-- INSERT QUARTO
INSERT INTO quarto VALUES
(1,101,'Standard',120),
(2,102,'Standard',120),
(3,201,'Luxo',200),
(4,202,'Luxo',200),
(5,203,'Luxo',200),
(6,301,'Master',350),
(7,302,'Master',350),
(8,303,'Presidencial',500);

-- INSERT RESERVA
INSERT INTO reserva VALUES
(1,'2026-07-01','2026-07-05','Confirmada',1,1,1),
(2,'2026-07-03','2026-07-06','Cancelada',2,2,2),
(3,'2026-07-10','2026-07-12','Confirmada',3,1,3),
(4,'2026-07-15','2026-07-18','Confirmada',4,3,4),
(5,'2026-07-20','2026-07-22','Pendente',5,4,6),
(6,'2026-07-25','2026-07-28','Confirmada',6,NULL,7),
(7,'2026-08-01','2026-08-05','Confirmada',1,2,5);

-- INSERT PAGAMENTO
INSERT INTO pagamento VALUES
(1,600,'Cartão',1),
(2,400,'Pix',2),
(3,1000,'Dinheiro',3),
(4,1200,'Cartão',4);

-- ATIVIDADE
-- EXERCÍCIO 1
SELECT cliente.nomeCliente, cliente.cidadeCliente, reserva.dataEntradaReserva
FROM cliente
INNER JOIN reserva
ON cliente.idCliente = reserva.clienteId
WHERE cliente.cidadeCliente = 'Tubarão'
ORDER BY cliente.nomeCliente;


-- EXERCÍCIO 2
SELECT cliente.nomeCliente, cliente.cidadeCliente, reserva.dataEntradaReserva
FROM cliente
LEFT JOIN reserva 
ON cliente.idCliente = reserva.clienteId
ORDER BY cliente.nomeCliente;


-- EXERCÍCIO 3
SELECT funcionario.nomeFuncionario, funcionario.cargoFuncionario, reserva.dataEntradaReserva
FROM funcionario
INNER JOIN reserva
ON funcionario.idFuncionario = reserva.funcionarioId
WHERE funcionario.cargoFuncionario = 'Recepção'
ORDER BY funcionario.nomeFuncionario;


-- EXERCÍCIO 4
SELECT quarto.numeroQuarto, quarto.tipoQuarto, reserva.statusReserva
FROM quarto
LEFT JOIN reserva
ON quarto.idQuarto = reserva.quartoId
WHERE quarto.tipoQuarto = 'Luxo'
ORDER BY quarto.numeroQuarto;


-- EXERCÍCIO 5
SELECT reserva.idReserva, pagamento.valorPagamento, pagamento.formaPagamento
FROM reserva
LEFT JOIN pagamento
ON reserva.idReserva = pagamento.reservaId
WHERE pagamento.formaPagamento = 'Cartão' 
OR pagamento.idPagamento IS NULL
ORDER BY reserva.idReserva;


-- EXERCÍCIO 6
SELECT cliente.nomeCliente, funcionario.nomeFuncionario, reserva.statusReserva
FROM cliente 
INNER JOIN reserva 
ON cliente.idCliente = reserva.clienteId
LEFT JOIN funcionario
ON reserva.funcionarioId = funcionario.idFuncionario
WHERE reserva.statusReserva = 'Confirmada'
ORDER BY cliente.nomeCliente;


-- EXERCÍCIO 7
SELECT cliente.nomeCliente, reserva.statusReserva, reserva.dataEntradaReserva
FROM cliente
LEFT JOIN reserva 
ON cliente.idCliente = reserva.clienteId
WHERE reserva.statusReserva = 'Cancelada' 
OR reserva.idReserva IS NULL
ORDER BY cliente.nomeCliente;


-- EXERCÍCIO 8
SELECT cliente.nomeCliente, reserva.dataEntradaReserva, reserva.statusReserva
FROM cliente
INNER JOIN reserva 
ON cliente.idCliente = reserva.clienteId
WHERE reserva.statusReserva = 'Pendente'
ORDER BY cliente.nomeCliente;


-- EXERCÍCIO 9
SELECT cliente.nomeCliente, funcionario.nomeFuncionario, quarto.numeroQuarto, pagamento.valorPagamento, reserva.statusReserva
FROM cliente
INNER JOIN reserva 
ON cliente.idCliente = reserva.clienteId
INNER JOIN quarto 
ON reserva.quartoId = quarto.idQuarto
LEFT JOIN funcionario 
ON reserva.funcionarioId = funcionario.idFuncionario
LEFT JOIN pagamento 
ON reserva.idReserva = pagamento.reservaId
WHERE reserva.statusReserva = 'Confirmada'
ORDER BY cliente.nomeCliente;


-- EXERCÍCIO 10 - QUERY 1: INNER JOIN
-- Enunciado: Listar apenas quartos que estão ocupados (com reserva confirmada)
SELECT quarto.numeroQuarto, quarto.tipoQuarto, cliente.nomeCliente, reserva.statusReserva
FROM quarto
INNER JOIN reserva 
ON quarto.idQuarto = reserva.quartoId
INNER JOIN cliente
ON reserva.clienteId = cliente.idCliente
WHERE reserva.statusReserva = 'Confirmada'
ORDER BY quarto.numeroQuarto;


-- EXERCÍCIO 10 - QUERY 2: LEFT JOIN
-- Enunciado: Listar todos os funcionários com suas reservas (se houver)
SELECT  funcionario.nomeFuncionario, funcionario.cargoFuncionario, cliente.nomeCliente, reserva.statusReserva
FROM funcionario
LEFT JOIN reserva 
ON funcionario.idFuncionario = reserva.funcionarioId
LEFT JOIN cliente 
ON reserva.clienteId = cliente.idCliente
ORDER BY funcionario.nomeFuncionario;


-- EXERCÍCIO 10 - QUERY 3: RIGHT JOIN
-- Enunciado: Listar todos os quartos mostrando se têm reserva ou não
SELECT  quarto.numeroQuarto, quarto.tipoQuarto, reserva.statusReserva, cliente.nomeCliente
FROM reserva
RIGHT JOIN quarto 
ON reserva.quartoId = quarto.idQuarto
LEFT JOIN cliente 
ON reserva.clienteId = cliente.idCliente
ORDER BY quarto.numeroQuarto;
CREATE TABLE continente (
    idContinente SERIAL PRIMARY KEY,
    nomeContinente VARCHAR(100)
);

CREATE TABLE pais (
    idPais SERIAL PRIMARY KEY,
    nomePais VARCHAR(100),
    continenteId INT,
    FOREIGN KEY (continenteId)
    REFERENCES continente(idContinente)
);

CREATE TABLE estado (
    idEstado SERIAL PRIMARY KEY,
    nomeEstado VARCHAR(100),
    siglaEstado CHAR(2),
    paisId INT,
    FOREIGN KEY (paisId)
    REFERENCES pais(idPais)
);

CREATE TABLE cidade (
    idCidade SERIAL PRIMARY KEY,
    nomeCidade VARCHAR(100),
    estadoId INT,
    FOREIGN KEY (estadoId)
    REFERENCES estado(idEstado)
);

INSERT INTO continente (nomeContinente) VALUES
('América'),
('Europa');

INSERT INTO pais (nomePais, continenteId) VALUES
('Brasil', 1),
('Argentina', 1),
('Portugal', 2);

INSERT INTO estado (nomeEstado, siglaEstado, paisId) VALUES
('Santa Catarina', 'SC', 1),
('Paraná', 'PR', 1),
('Buenos Aires', 'BA', 2);

INSERT INTO cidade (nomeCidade, estadoId) VALUES
('Jaguaruna', 1),
('Tubarão', 1),
('Curitiba', 2),
('La Plata', 3);

SELECT * FROM continente;

SELECT * FROM pais;

SELECT * FROM estado;

SELECT * FROM cidade;

-- alteração da aula
SELECT cidade.nomeCidade, estado.nomeEstado, pais.nomePais
FROM cidade
INNER JOIN estado -- junta a tabela estado com a tabela cidade
ON cidade.estadoId = estado.IdEstado
INNER JOIN pais
ON estado.paisId = pais.IdPais; -- junta a tabela pais com as tabelas estado e cidade

-- atividade
SELECT pais.nomePais, continente.nomeContinente
FROM pais
INNER JOIN continente -- junta a tabela continente com a tabela pais
ON pais.continenteId = continente.IdContinente
WHERE nomeContinente = 'América'; -- mostra os dados se o nome do continente é igual a 'América'

-- atividade 2
SELECT cidade.nomeCidade, estado.nomeEstado, siglaEstado
FROM cidade
INNER JOIN estado -- junta a tabela estado com a tabela cidade
ON cidade.estadoId = estado.IdEstado
WHERE siglaEstado = 'SC'; -- mostra os dados se a sigla do estado é igual a 'SC'

-- atividade 3
SELECT estado.nomeEstado, pais.nomePais, continente.nomeContinente
FROM estado
INNER JOIN pais -- junta a tabela pais com a tabela estado
ON estado.paisId = pais.IdPais
INNER JOIN continente -- junta a tabela continente com as tabelas pais e estado
ON pais.continenteId = continente.IdContinente
ORDER BY nomeContinente DESC; -- ordernado continente em ordem decrescente

-- atividade 4
SELECT cidade.nomeCidade, estado.nomeEstado, pais.nomePais
FROM cidade
INNER JOIN estado -- junta a tabela estado com a tabela cidade
ON cidade.estadoId = estado.IdEstado
INNER JOIN pais
ON estado.paisId = pais.IdPais -- junta a tabela pais com as tabelas estado e cidade
WHERE nomePais = 'Brasil'; -- mostra os dados se o nome do pais for igual a 'Brasil'

-- atividade 5
SELECT cidade.nomeCidade, estado.nomeEstado, pais.nomePais, continente.nomeContinente
FROM cidade
INNER JOIN estado
ON cidade.estadoId = estado.IdEstado
INNER JOIN pais
ON estado.paisId = pais.IdPais
INNER JOIN continente
ON pais.continenteId = continente.IdContinente; 
-- junta todas as tabelas, mostrando o nome de cada cidade, estado, pais e continente
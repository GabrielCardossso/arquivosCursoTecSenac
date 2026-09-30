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

-- 16/06
INSERT INTO pais (idPais, nomePais, continenteId) VALUES
(4, 'Espanha', 2),
(5, 'França', 2);

INSERT INTO estado (idEstado, nomeEstado, siglaEstado, paisId) VALUES
(4, 'Rio Grande do Sul', 'RS', 1),
(5, 'Lisboa', 'LI', 3);

INSERT INTO continente VALUES
(3, 'Ásia');

INSERT INTO pais VALUES
(4, 'Espanha', 2);

INSERT INTO pais VALUES
(5, 'França', 2);

-- 1
SELECT pais.nomePais, estado.nomeEstado
FROM pais
LEFT JOIN estado
ON pais.idPais = estado.paisId;

-- 2
SELECT estado.nomeEstado, cidade.nomeCidade
FROM estado
LEFT JOIN cidade
ON estado.idEstado = cidade.estadoId
ORDER BY estado.nomeEstado;

-- 3
SELECT continente.nomeContinente, pais.nomePais
FROM continente
LEFT JOIN pais
ON continente.idContinente = pais.continenteId
ORDER BY continente.nomeContinente DESC;

-- 4
SELECT pais.nomePais, estado.siglaEstado
FROM pais
LEFT JOIN estado
ON pais.idPais = estado.paisId;

-- 5
SELECT pais.nomePais, estado.nomeEstado
FROM pais
LEFT JOIN estado
ON pais.idPais = estado.paisId
WHERE pais.continenteId = 2; -- id Europa -- tambem da para fazer um inner com continente...

-- 6
SELECT estado.nomeEstado, cidade.nomeCidade
FROM estado
LEFT JOIN cidade
ON estado.idEstado = cidade.estadoId
WHERE estado.paisId = 1; -- id Brasil

--7
-- criar 2 exercicios
-- 1 - Exibir o nome do pais, o nome do estado e o nome da cidade, incluindo os que não tem registros, alfabeticamente
SELECT pais.nomePais, estado.nomeEstado, cidade.nomeCidade
FROM pais
LEFT JOIN estado
ON pais.idPais = estado.paisId
LEFT JOIN cidade
ON estado.idEstado = cidade.estadoId
ORDER BY pais.nomePais;
-- Resultado esperado:
-- 1 | "Argentina" | "Buenos Aires"	     | "La Plata"
-- 2 | "Brasil"	   | "Rio Grande do Sul" | [null]
-- 3 | "Brasil"	   | "Santa Catarina"	 | "Tubarão"
-- 4 | "Brasil"	   | "Paraná"	         | "Curitiba"
-- 5 | "Brasil"    | "Santa Catarina"	 | "Jaguaruna"
-- 6 | "Espanha"   | [null]              | [null]
-- 7 | "França"	   | [null]	             | [null]
-- 8 | "Portugal"  | "Lisboa"            | [null]

-- 2 - Exibir o nome dos paises e dos estados que pertencem ao continente de id 1 (América),
-- incluindo os que nao tem registros, e de ordem Z-A 
SELECT pais.nomePais, estado.nomeEstado
FROM pais
LEFT JOIN estado
ON pais.idPais = estado.paisId
WHERE pais.continenteId = 1 
ORDER BY pais.nomePais DESC; -- id América
-- Resultado esperado:
-- 1 | "Brasil"    | "Santa Catarina"
-- 2 | "Brasil"    | "Paraná"
-- 3 | "Brasil"    | "Rio Grande Do Sul"
-- 4 | "Argentina" | "Buenos Aires"

-- 8
SELECT continente.nomeContinente, pais.nomePais, estado.nomeEstado
FROM continente
LEFT JOIN pais
ON pais.continenteId = continente.idContinente
LEFT JOIN estado
ON pais.idPais = estado.paisId
ORDER BY pais.nomePais;

-- 9
SELECT pais.nomePais, estado.nomeEstado, cidade.nomeCidade
FROM pais
LEFT JOIN estado
ON pais.idPais = estado.paisId
LEFT JOIN cidade
ON estado.idEstado = cidade.estadoId
ORDER BY pais.nomePais;

-- 10
SELECT continente.nomeContinente, pais.nomePais, estado.nomeEstado, cidade.nomeCidade
FROM continente
LEFT JOIN pais
ON continente.idContinente = pais.continenteId
LEFT JOIN estado
ON pais.idPais = estado.paisId
LEFT JOIN cidade
ON estado.idEstado = cidade.estadoId
WHERE continente.nomeContinente = 'Europa'
ORDER BY pais.nomePais;

-- 11
-- exibir nome do pais, estado e cidade usando right join, incluindo os que nao tem registros
SELECT pais.nomePais, estado.nomeEstado, cidade.nomeCidade
FROM pais
RIGHT JOIN estado
ON pais.idPais = estado.paisId
RIGHT JOIN cidade
ON estado.idEstado = cidade.estadoId;
select * from continente;
select * from pais;
select * from estado;
select * from cidade;

drop table cidade
create table cidade(
idCidade serial primary key,
nomeCidade varchar (20) NOT NULL,
siglaCidade char (2) UNIQUE
)

INSERT INTO cidade(nomeCidade, siglaCidade)
VALUES ('Tubarão', 'TB');

ALTER TABLE cidade
ADD COLUMN estadoId INT,
ADD CONSTRAINT fk_cidade_estado
FOREIGN KEY (estadoId)
REFERENCES estado (idEstado);

CREATE TABLE bairros (
idBairro serial primary key,
nome varchar (20),
cidadeId int
)

ALTER TABLE bairros 
RENAME COLUMN nome TO nomeBairro

ALTER TABLE bairros 
RENAME TO bairro

ALTER TABLE bairro
DROP COLUMN cidadeId

SELECT * FROM bairro
-- BANCO DE DADOS: BIBLIOTECA

-- creates
CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,  
    nome VARCHAR(100) NOT NULL 
);

CREATE TABLE livros (
    id_livro SERIAL PRIMARY KEY,       
    titulo VARCHAR(150) NOT NULL,      
    id_autor INT REFERENCES autores(id_autor)
  
);


CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL     
);


CREATE TABLE emprestimos (
    id_emprestimo SERIAL PRIMARY KEY,
    id_livro INT REFERENCES livros(id_livro),       
    id_usuario INT REFERENCES usuarios(id_usuario), 
    data_emprestimo DATE NOT NULL                  
);

-- inserts
INSERT INTO autores (nome) VALUES
('Carlos Alberto Heuser'),
('Robert C. Martin'),
('Andrew S. Tanenbaum'),
('Martin Fowler');



INSERT INTO livros (titulo, id_autor) VALUES
('Modelagem de Banco de Dados', 1),              
('Banco de Dados: Projeto e Implementação', 1),         
('Código Limpo', 2), 
('Redes de Computadores', 3); 


INSERT INTO usuarios (nome) VALUES
('Lucas'),
('Carol'),
('Paulo'); 


INSERT INTO emprestimos (id_livro, id_usuario, data_emprestimo) VALUES
(1, 1, '2026-01-10'), 
(2, 2, '2026-02-15'),
(3, 1, '2026-03-05');

-- consultas sql

-- inner join
-- ex: mostrar todos os livros junto com o nome do autor.
-- só aparecem livros que possuem autor cadastrado e
-- autores que possuem pelo menos um livro.
-- ----------------------------------------------------------
SELECT livros.titulo AS livro, autores.nome AS autor
FROM livros
INNER JOIN autores 
ON livros.id_autor = autores.id_autor;

-- left join
-- ex: mostrar todos os livros, e se houver, o empréstimo
-- relacionado a eles.
-- ----------------------------------------------------------
SELECT livros.titulo AS livro, emprestimos.data_emprestimo AS data_emprestimo
FROM livros
LEFT JOIN emprestimos 
ON livros.id_livro = emprestimos.id_livro;


-- right join
-- ex: mostrar todos os autores, e se houver, os livros
-- que eles escreveram.
-- ----------------------------------------------------------
SELECT livros.titulo AS livro, autores.nome AS autor
FROM livros
RIGHT JOIN autores 
ON livros.id_autor = autores.id_autor;


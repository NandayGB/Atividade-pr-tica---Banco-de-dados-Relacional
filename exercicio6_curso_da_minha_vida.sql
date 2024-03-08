CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;
CREATE TABLE tb_categorias (
id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);
CREATE TABLE tb_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    descricao TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);
INSERT INTO tb_categorias (nome, descricao) VALUES
('Java', 'Cursos da linguaguem de programação Java'),
('Python', 'Cursos da linguaguem de programação Python'),
('Javascript', 'Cursos da linguaguem de programação Javascript'),
('UX Design', 'Cursos de desenvolvimento design focado na experiência de quem usa um determinado produto ou serviço'),
('Design', 'Cursos de design');

INSERT INTO tb_cursos (nome, valor, descricao, id_categoria) VALUES
('Curso Java', 500.00, 'Curso completo de Java', 1),
('Curso Python', 600.00, 'Curso completo de Python', 2),
('Curso Javascript', 700.00, 'Curso completo de Javascript', 3),
('Curso UX Design', 800.00, 'Curso completo de UX Design', 4),
('Curso Design', 900.00, 'Curso completo de Design', 5),
('Curso Java Avançado', 1000.00, 'Curso avançado de Java', 1),
('Curso Python Avançado', 1100.00, 'Curso avançado de Python', 2),
('Curso Javascript Avançado', 1200.00, 'Curso avançado de Javascript', 3);

SELECT * FROM tb_cursos;
SELECT * FROM tb_cursos WHERE valor > 500.00;
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';
SELECT c.*, ct.nome AS categoria_nome FROM tb_cursos c INNER JOIN tb_categorias ct ON c.id_categoria = ct.id;
SELECT c.*, ct.nome AS categoria_nome FROM tb_cursos c INNER JOIN tb_categorias ct ON c.id_categoria = ct.id WHERE ct.nome = 'Javascript';
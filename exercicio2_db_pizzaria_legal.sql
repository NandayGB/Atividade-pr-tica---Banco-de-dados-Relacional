CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE IF NOT EXISTS tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    tamanho ENUM('P', 'M', 'G') NOT NULL,
    ingrediente TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('A', 'Pizzas de calabresa'),
('B', 'Pizzas de frango'),
('C', 'Pizzas de vegetais'),
('D', 'Pizzas de marguerita'),
('E', 'Pizzas de coração de frango'),
('F', 'Pizzas de picanha'),
('G', 'Pizzas de camarão'),
('H', 'Pizzas de filé acebolado');

INSERT INTO tb_pizzas (nome, valor, tamanho, ingrediente, id_categoria) VALUES
('Calabresa', 45.00, 'M', 'Calabresa, cebola e mussarela', 1),
('Frango Catupiry', 50.00, 'M', 'Frango desfiado e catupiry', 2),
('Vegetariana', 55.00, 'M', 'Tomate, milho, ervilha, palmito e mussarela', 3),
('Marguerita', 60.00, 'M', 'Molho de tomate, mussarela, tomate e manjericão', 4),
('Frango com Catupiry', 65.00, 'M', 'Frango desfiado, catupiry, milho e mussarela', 2),
('Coração de Frango', 70.00, 'M', 'Coração de frango, cebola e mussarela', 5),
('Picanha', 75.00, 'M', 'Picanha fatiada, cebola, pimentão e mussarela', 6),
('Camarão', 80.00, 'M', 'Camarão, tomate, cebola, pimentão e mussarela', 7);

SELECT * FROM tb_pizzas;
SELECT * FROM tb_pizzas WHERE valor > 45.00;
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';
SELECT p.*, c.nome AS categoria_nome
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c ON p.id_categoria = c.id;
SELECT p.*, c.nome AS categoria_nome
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c ON p.id_categoria = c.id
WHERE c.nome = 'Pizzas de marguerita';
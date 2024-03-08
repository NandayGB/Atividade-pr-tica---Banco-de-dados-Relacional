CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    descricao TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);
INSERT INTO tb_categorias (nome, descricao) VALUES
('Aves', 'Produtos alimentícios à base de aves'),
('Bovinos', 'Produtos à base de carne bovina'),
('Suínos', 'Alimentos derivados de carne suína'),
('Frutas', 'Diversos tipos de frutas frescas'),
('Legumes', 'Variedade de legumes frescos e saudáveis');

INSERT INTO tb_produtos (nome, valor, descricao, id_categoria) VALUES
('Frango', 22.00, 'Frango inteiro', 1),
('Acém', 40.00, 'Carne de gado', 2),
('Bacon', 15.00, 'Barriga de porco', 3),
('Maçã', 9.00, 'Maçã', 4),
('Banana', 9.00, 'Banana', 4),
('Cebola', 8.00, 'Cebola', 5),
('Cenoura', 4.00, 'Cenoura', 5),
('Alcatra', 35.00, 'Alcatra de vaca', 2),
('Costela', 45.00, 'Costela de porco', 3),
('Picanha', 65.00, 'Picanha de vaca', 2);

SELECT * FROM tb_produtos;
SELECT * FROM tb_produtos WHERE valor > 50.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS classe_nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON tb_produtos.id_categoria = c.id;

SELECT p.*, c.nome AS classe_nome
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c ON tb_produtos.id_categoria = c.id
WHERE c.nome = 'Aves';



CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    description TEXT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);
INSERT INTO tb_categorias (name, description) VALUES
('Medicamentos', 'Medicamentos'),
('Cosmeticos', 'produtos de beleza'),
('Higiene', 'Produtos de higiene pessoal'),
('Suplementos', 'Suplementos alimentares'),
('Curativo', 'Produtos para curativo');

INSERT INTO tb_produtos(nome, preco, description, id_categoria) VALUES
('Escova Dental', 10.00, 'Escova para dentes', 3),
('Sabonete', 5.00, 'Sabonete antibacteriano', 3),
('Desodorante', 15.00, 'Desodorante em spray', 3),
('Ibuprofeno', 12.50, 'Analgésico', 2),
('Paracetamol', 10.00, 'Analgésico', 2),
('Dipirona', 15.00, 'Anti-inflamatório', 2),
('Vitaminas', 35.00, 'Suplemento vitamínico', 4),
('Calcitran', 25.00, 'Suplemento de cálcio', 4),
('Shampoo', 65.50, 'Shampoo para cabelos crespos', 3),
('Condicionador', 70.00, 'Condicionador para cabelos normais', 3),
('Batom rosa', 55.00, 'Batom rosa matte', 1),
('Gase', 15.00, 'Gaze para cobrir lesões na pele', 5),
('Atadura', 20.00, 'Atadura para cobrir lesões na pele, imobilizar lesões ósseas ou articulares e tratar lesões musculares.', 5);

SELECT * FROM tb_produtos;
SELECT * FROM tb_produtos WHERE preco > 50.00;
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 6.00;
SELECT p.*, c.nome AS categoria_nome FROM tb_produtos p INNER JOIN tb_categorias c ON p.id_categoria = c.id;


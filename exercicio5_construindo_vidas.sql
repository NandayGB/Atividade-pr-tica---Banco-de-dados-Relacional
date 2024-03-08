CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;
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
('Hidráulico', 'Produtos hidráulicos'),
('Ferramentas', 'Ferramentas manuais'),
('Eletrico', 'Material eletrico'),
('Acabamento internos', 'Materiais de construção para a parte interna de ambientes'),
('Acabamento externos', 'Materiais de construção para a parte externa de ambientes');

INSERT INTO tb_produtos (nome, valor, descricao, id_categoria) VALUES
(1, 'Chave de boca', 16.50, 'Chave de boca de 10mm', 2),
(2, 'Canos PVC', 150.00, 'Canos PVC 1" 6m', 1),
(3, 'Fita isolante', 10.00, 'Fita isolante 25mm x 10m', 3),
(4, 'Tinta para ambiente externo', 98.00, 'Tinta branca 5L', 4),
(5, 'Pregos', 5.00, 'Pregos 3x16mm', 2),
(6, 'Tinta para ambiente interno', 75.00, 'Tinta azul de 5L', 4),
(7, 'Martelo', 15.00, 'Martelo de 500g', 2),
(8, 'Fio condutor', 20.00, 'Fio condutor 1.5mm² 100m', 3);

SELECT * FROM tb_produtos;
SELECT * FROM tb_produtos WHERE valor > 100.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS classe_nome
FROM tb_produtos AS p
INNER JOIN tb_categoria AS c ON tb_produtos.id_categoria = c.id;

SELECT p.*, c.nome AS classe_nome
FROM tb_produtos AS p
INNER JOIN tb_categoria AS c ON tb_produtos.id_categoria = c.id
WHERE c.nome = 'Hidraulico';

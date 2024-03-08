CREATE DATABASE IF NOT EXISTS db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE IF NOT EXISTS tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE IF NOT EXISTS tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome, descricao) VALUES
('Amazona', 'Especialistas em combate a distância, habilidosas com arcos e flechas foram treinadas para serem uma máquina imortal.'),
('Guerreira', 'Fortes e corajosas, excelentes em combate corpo a corpo com espadas e escudos.'),
('Feiticeira', 'Rainhas em magia, capazes de conjurar feitiços poderosos para atacar e defender.'),
('Cavaleira', 'Cavaleiras habilidosas, combinando agilidade e força em combate, são incríveis.'),
('Lutadora', 'Ágeis e versáteis, dominam técnicas de luta e magia para vitória certa.');

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, classe_id) VALUES
('Mulher Maravilha', 2500, 1500, 1),
('Hipólita', 2200, 1800, 1),
('Guerreira1', 1800, 2200, 2),
('Guerreira2', 2000, 2000, 2),
('Feiticeira1', 2400, 1600, 3),
('Feiticeira2', 2100, 1900, 3),
('Anne Willians', 1900, 2100, 4),
('Nina Willians', 2300, 1700, 4);

SELECT * FROM tb_personagens;

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS classe_nome
FROM tb_personagens AS p
INNER JOIN tb_classes AS c ON p.classe_id = c.id;

SELECT p.*, c.nome AS classe_nome
FROM tb_personagens AS p
INNER JOIN tb_classes AS c ON p.classe_id = c.id
WHERE c.nome = 'Guerreira';

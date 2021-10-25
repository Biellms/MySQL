/*Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as informações dos personagens desse game. 
O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.

Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos relevantes da classe para se trabalhar com o serviço desse  game Online.
Crie uma tabela tb_personagem  e utilizando a habilidade de abstração e determine 5 atributos relevantes dos funcionários para se trabalhar com o serviço desse game Online

Popule esta tabela classe com até 5 dados.
Popule esta tabela personagem com até 8 dados.

Faça um select que retorne os personagens com o poder de ataque maior do que 2000.
Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000.
Faça um select  utilizando LIKE buscando os personagens com a letra C.
Faça um um select com Inner join entre  tabela classe e personagem.
Faça um select onde traga todos os personagem de uma classe específica.*/

-- Banco de dados
CREATE DATABASE db_game_online;
USE db_game_online;

-- Tabela Classe
CREATE TABLE tb_classe (

	idClasse bigint auto_increment,
	nomeClasse varchar(50) NOT NULL,
    tipoClasse varchar(50) NOT NULL,
    
    -- Constraint primary key
    CONSTRAINT id_classe_pk primary key (idClasse)
);

-- Tabela Personagem
CREATE TABLE tb_personagem (
	
    idPers bigint auto_increment,
    nomePers varchar(50) NOT NULL,
    ataque int NOT NULL,
    defesa int NOT NULL,
    nivel int NOT NULL,
    Classe bigint NOT NULL,
    
    -- Constraints primary key e foreign key
    CONSTRAINT id_personagem_pk primary key (idPers),
    CONSTRAINT classe_personagem_fk foreign key (Classe) REFERENCES tb_classe (idClasse)
);

-- Inserindo dados na tabela tb_classe
INSERT INTO tb_classe (nomeClasse, tipoClasse)
VALUES ("Atacante","Entry Fragger");
INSERT INTO tb_classe (nomeClasse, tipoClasse)
VALUES ("Atacante","Intermediário");
INSERT INTO tb_classe (nomeClasse, tipoClasse)
VALUES ("Atacante","Suporte");
INSERT INTO tb_classe (nomeClasse, tipoClasse)
VALUES ("Defensor","Lurker");
INSERT INTO tb_classe (nomeClasse, tipoClasse)
VALUES ("Defensor","Hunter");
INSERT INTO tb_classe (nomeClasse, tipoClasse)
VALUES ("Defensor","Suporte");

-- Inserindo dados na tabela tb_personagem
INSERT INTO tb_personagem (nomePers, ataque, defesa, nivel, Classe)
VALUES ("ASH",4000,300,92,1);
INSERT INTO tb_personagem (nomePers, ataque, defesa, nivel, Classe)
VALUES ("IANA",3200,500,89,1);
INSERT INTO tb_personagem (nomePers, ataque, defesa, nivel, Classe)
VALUES ("CAPITÃO",2500,800,85,2);
INSERT INTO tb_personagem (nomePers, ataque, defesa, nivel, Classe)
VALUES ("TERMITE",1500,1000,88,3);
INSERT INTO tb_personagem (nomePers, ataque, defesa, nivel, Classe)
VALUES ("VIGIL",2800,2100,86,4);
INSERT INTO tb_personagem (nomePers, ataque, defesa, nivel, Classe)
VALUES ("MOZZIE",2100,2400,90,4);
INSERT INTO tb_personagem (nomePers, ataque, defesa, nivel, Classe)
VALUES ("LESION",2700,2500,90,5);
INSERT INTO tb_personagem (nomePers, ataque, defesa, nivel, Classe)
VALUES ("ECHO",1700,4000,91,6);

-- Poder de ataque maior que 2000
SELECT * FROM tb_personagem
WHERE ataque > 2000;

-- Poder de defesa entre 1000 e 4000
SELECT * FROM tb_personagem
WHERE defesa BETWEEN 1000 AND 4000;

-- Personagem com letra C
SELECT * FROM tb_personagem
WHERE nomePers LIKE 'C%';

-- Inner join do Tipo de Classe = Entry Fragger
SELECT pe.nomePers "Personagem", cl.nomeClasse "Classe", cl.tipoClasse "Tipo de Classe" FROM tb_personagem pe 
JOIN tb_classe cl
ON cl.idClasse = pe.Classe
WHERE cl.tipoClasse LIKE 'E%';

-- DROPS
DROP TABLE tb_personagem;
DROP TABLE tb_classe;
DROP DATABASE db_game_online;
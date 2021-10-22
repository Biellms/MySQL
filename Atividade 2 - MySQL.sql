/*Crie um banco de dados para um e commerce, onde o sistema trabalhará com as informações dos produtos deste ecommerce. 
Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste ecommerce.

Popule esta tabela com até 8 dados;
Faça um select que retorne os produtos com o valor maior do que 500.
Faça um select que retorne os produtos com o valor menor do que 500.
Ao término atualize um dado desta tabela através de uma query de atualização.
*/

CREATE DATABASE db_ecommerce;
USE db_ecommerce;

CREATE TABLE produtos (
	
	id bigint auto_increment,
    nomeProd varchar(50) NOT NULL,
    descricao varchar(250) NOT NULL,
    categoria varchar(50) NOT NULL,
    valor decimal(8,2) NOT NULL,
	estrela int,

	CONSTRAINT id_produtos_pk primary key (id)
);

INSERT INTO produtos (nomeProd, descricao, categoria, valor, estrela)
VALUES ("GEFORCE RTX 3070","PLACA DE VIDEO GIGABYTE GEFORCE RTX 3070 AORUS MASTER, LHR, 8GB, GDDR6, 256-BIT, GV-N3070AORUS M-8GD REV 2.0","Placa de video",7499,4);
INSERT INTO produtos (nomeProd, descricao, categoria, valor, estrela)
VALUES ("RADEON RX 6900 XT","PLACA DE VIDEO ASUS RADEON RX 6900 XT 16GB GDDR6 TUF GAMING 2‎56-BIT, TUF-RX6900XT-O16G-GAMING","Placa de video",12441,5);
INSERT INTO produtos (nomeProd, descricao, categoria, valor, estrela)
VALUES ("AMD RYZEN 7 3700X","PROCESSADOR AMD RYZEN 7 3700X, 8-CORE, 16-THREADS, 3.6GHZ (4.4GHZ TURBO), CACHE 36MB, AM4, 100-100000071BOX","Processador",2199,5);
INSERT INTO produtos (nomeProd, descricao, categoria, valor, estrela)
VALUES ("INTEL CORE i9-9900K","Processador Intel Core i9-9900K, 3.6Ghz, 16MB Cache, LGA 1151 - BX806849900K","Processador",2599,5);
INSERT INTO produtos (nomeProd, descricao, categoria, valor, estrela)
VALUES ("ASUS PRIME A320M-K","Placa-Mãe Asus Prime A320M-K/BR, AMD AM4, mATX, DDR4","Placa mãe",409,3);
INSERT INTO produtos (nomeProd, descricao, categoria, valor, estrela)
VALUES ("ASRock B450M","Placa-Mãe ASRock B450M Steel Legend, AMD AM4, mATX, DDR4 - 90-MXB9Y0-A0BAYZ","Placa mãe",749,5);
INSERT INTO produtos (nomeProd, descricao, categoria, valor, estrela)
VALUES ("Crucial Ballistix 8GB","Memória RAM Crucial Ballistix 8GB DDR4 2666 Mhz, CL16, UDIMM, Preto - BL8G26C16U4B","Memória RAM",259,2);
INSERT INTO produtos (nomeProd, descricao, categoria, valor, estrela)
VALUES ("Kingston Fury Beast 8GB","Memória Kingston Fury Beast, 8GB, 2666MHz, DDR4, CL16, Preto - KF426C16BB/8","Memória RAM",289,2);

SELECT id, nomeProd "Nome do Produto", descricao, categoria, valor, estrela FROM produtos;

-- Produtos com preços MAIORES que R$500
SELECT id, nomeProd "Nome do Produto", descricao, categoria, valor, estrela FROM produtos
WHERE valor > 500;

-- Produtos com preços MENORES QUE R$500
SELECT id, nomeProd "Nome do Produto", descricao, categoria, valor, estrela FROM produtos
WHERE valor < 500;

-- Atualizando dado da tabela
UPDATE produtos SET valor = 10999
WHERE id = 2;

SELECT id, nomeProd "Nome do Produto", descricao, categoria, valor, estrela FROM produtos;

DROP TABLE produtos;
DROP DATABASE db_ecommerce;

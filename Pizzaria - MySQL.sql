/*Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco deverá ter o seguinte nome db_pizzaria_legal, onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.
Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria.

Popule esta tabela Categoria com até 5 dados.
Popule esta tabela pizza com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 45 reais.
Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.
Faça um select  utilizando LIKE buscando os Produtos com a letra C.
Faça um um select com Inner join entre  tabela categoria e pizza.
Faça um select onde traga todos os Produtos de uma categoria específica.*/

-- Banco de dados
CREATE DATABASE db_pizzaria;
USE db_pizzaria;

-- Tabela categoria
CREATE TABLE tb_categoria (

	idCategoria bigint auto_increment,
    tipo varchar(50) NOT NULL,
    tamanho varchar(20) NOT NULL,
	
    CONSTRAINT id_categoria_pk primary key (idCategoria)
);

-- Tabela pizza
CREATE TABLE tb_pizza (

	idPizza bigint auto_increment,
    nomePizza varchar(50) NOT NULL,
    descricao varchar(100) NOT NULL,
    preco decimal(8,2) NOT NULL,
    categoria bigint NOT NULL,
    
    CONSTRAINT id_pizza_pk primary key (idPizza),
    CONSTRAINT categoria_pizza_fk foreign key (categoria) REFERENCES tb_categoria (idCategoria)
);

-- Inserindo dados na tabela categoria
INSERT INTO tb_categoria (tipo, tamanho) 
VALUES ("Salgada","Grande"); -- 1
INSERT INTO tb_categoria (tipo, tamanho)
VALUES ("Salgada","Media"); -- 2
INSERT INTO tb_categoria (tipo, tamanho)
VALUES ("Salgada","Pequena"); -- 3
INSERT INTO tb_categoria (tipo, tamanho)
VALUES ("Doce","Grande"); -- 4
INSERT INTO tb_categoria (tipo, tamanho)
VALUES ("Doce","Média"); -- 5
INSERT INTO tb_categoria (tipo, tamanho)
VALUES ("Doce","Pequena"); -- 6

-- Inserindo dados na tabela pizza
INSERT INTO tb_pizza (nomePizza, descricao, preco, categoria)
VALUES ("Mussarela","Queijo mussarela e oregano",49,2);
INSERT INTO tb_pizza (nomePizza, descricao, preco, categoria)
VALUES ("Margherita","Mussarela, tomate, oregano e manjericão",69,1);
INSERT INTO tb_pizza (nomePizza, descricao, preco, categoria)
VALUES ("Napolitana","Mussarela, tomate, oregano e parmesão ralado",49,2);
INSERT INTO tb_pizza (nomePizza, descricao, preco, categoria)
VALUES ("Quatro Queijos","Mussarela, requeijão, gorgonzola, oregano e parmesão ralado",69,1);
INSERT INTO tb_pizza (nomePizza, descricao, preco, categoria)
VALUES ("Pepperrcok","Mussarela, pepperoni, azeitona preta, parmesão ralado, oregano, Cream Cheese e alho granulado",29,3);
INSERT INTO tb_pizza (nomePizza, descricao, preco, categoria)
VALUES ("Extravaganzza","Mussarela, pepperoni, presunto, azeitona preta, champignon, cebola, oregano e pimentão verde",29,3);
INSERT INTO tb_pizza (nomePizza, descricao, preco, categoria)
VALUES ("Brotinho de Brigadeiro","Brotinho de brigadeiro com creme de baunilha ,brigadeiro de chocolate e granulado",69,4);
INSERT INTO tb_pizza (nomePizza, descricao, preco, categoria)
VALUES ("Chocobread","Massa deliciosa massa recheada de muito chocolate e cobertura de creme de baunilha com granulado",49,5);
INSERT INTO tb_pizza (nomePizza, descricao, preco, categoria)
VALUES ("Brotinho Laka Oreo","Brotinho coberta com chocolate Laka Oreo cremoso",29,6);

-- Produtos com valores MAIORES que R$45,00
SELECT nomePizza "Pizza", descricao "Descricação", concat('R$', preco) "Preço", categoria FROM tb_pizza
WHERE preco > 45 ORDER BY preco;

-- Produtos com valores ENTRE R$29,00 E R$60,00
SELECT nomePizza "Pizza", descricao "Descricação", concat('R$', preco) "Preço", categoria FROM tb_pizza
WHERE preco BETWEEN 29 AND 60 ORDER BY preco;

-- Produtos com a letra C
SELECT nomePizza "Pizza", descricao "Descricação", concat('R$', preco) "Preço", categoria FROM tb_pizza
WHERE nomePizza LIKE 'C%';

-- INNER JOIN entre as duas tabelas
SELECT pi.nomePizza "Pizza", pi.descricao "Descricação", concat('R$', pi.preco) "Preço", ca.tipo "Tipo", ca.tamanho "Tamanho"
FROM tb_pizza pi
JOIN tb_categoria ca
ON ca.idCategoria = pi.categoria ORDER BY pi.preco;

-- JOIN de uma categoria especifica = SALGADA
SELECT pi.nomePizza "Pizza", pi.descricao "Descricação", concat('R$', pi.preco) "Preço", ca.tipo "Tipo", ca.tamanho "Tamanho"
FROM tb_pizza pi
JOIN tb_categoria ca
ON ca.idCategoria = pi.categoria
WHERE ca.tipo LIKE 'Salgada' ORDER BY pi.preco;

-- JOIN de uma categoria especifica = DOCE
SELECT pi.nomePizza "Pizza", pi.descricao "Descricação", concat('R$', pi.preco) "Preço", ca.tipo "Tipo", ca.tamanho "Tamanho"
FROM tb_pizza pi
JOIN tb_categoria ca
ON ca.idCategoria = pi.categoria
WHERE ca.tipo LIKE 'Doce' ORDER BY pi.preco;

-- DROPS
DROP TABLE tb_pizza;
DROP TABLE tb_categoria;
DROP DATABASE db_pizzaria;
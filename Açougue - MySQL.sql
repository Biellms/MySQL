/*Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço desse açougue.
Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço desse açougue.

Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
Faça um select  utilizando LIKE buscando os Produtos com a letra C.
Faça um um select com Inner join entre  tabela categoria e produto.
Faça um select onde traga todos os Produtos de uma categoria específica.
*/

-- Banco de Dados
create database db_cidade_das_carnes;
use db_cidade_das_carnes;

-- Tabela tb_categoria
CREATE TABLE tb_categoria(

	id bigint auto_increment,
	descricao varchar(255) not null,
	ativo boolean not null,
    
	CONSTRAINT Categoria_pk PRIMARY KEY (id)
);

-- Tabela tb_produtos
CREATE TABLE tb_produtos (

	id bigint auto_increment,
	nome varchar (255) not null,
	preco decimal(6,2) not null,
	qtproduto int not null,
	dtvalidade date,
	categoria_id bigint,
    
	CONSTRAINT produtos_pk PRIMARY KEY (id)
);

-- Alterando dados da tabela Produtos
ALTER TABLE tb_produtos ADD CONSTRAINT produtos_fk FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id);

-- Inserindo dados na tabela categoria
insert into tb_categoria (descricao, ativo) values ("Bovino",true);
insert into tb_categoria (descricao, ativo) values ("Suino",true);
insert into tb_categoria (descricao, ativo) values ("Aves",true);
insert into tb_categoria (descricao, ativo) values ("pertence feijoada",true);
insert into tb_categoria (descricao, ativo) values ("imbutidos",true);
insert into tb_categoria (descricao, ativo) values ("soja",true);
insert into tb_categoria (descricao, ativo) values ("outros",true);

-- Inserindo dados na tabela produtos
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("ASA",40.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Picanha",20.00,30, "2021-11-08", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("coxa de frango",20.00,30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Bacon",30.00,30, "2021-11-09", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("hamburguer",60.00,30, "2021-09-07", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Cupim",20.00,30, "2021-11-10", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Peito de frango",25.00,30, "2021-11-09", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Orelha de porco",20.00,30, "2021-11-07", 4);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Salame",18.00,30, "2021-11-21", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("medalhao",50.00,30, "2021-11-15", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("mocoto",20.00,30, "2021-10-05", 2);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("chuleta",20.00,30, "2021-10-07", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("Proteína de Soja",5.40,30, "2021-10-07", 6);
insert into tb_produtos (nome, preco, qtProduto, categoria_id) values ("acendedor de churrasqueira", 20.00, 30, 7);
insert into tb_produtos (nome, preco, qtProduto, categoria_id) values ("soprador de churrasqueira", 35.00, 30, 7);

-- Produtos com valores MAIORES que R$50,00
SELECT nome "Produto", concat('R$', preco) "Preço", qtproduto "Quantidade no Estoque", DATE_FORMAT(dtvalidade, "%d/%m/%Y") "Validade" FROM tb_produtos
WHERE preco > 50;

-- Produtos com valores ENTRE R$3,00 e R$60,00
SELECT nome "Produto", concat('R$', preco) "Preço", qtproduto "Quantidade no Estoque", DATE_FORMAT(dtvalidade, "%d/%m/%Y") "Validade" FROM tb_produtos
WHERE preco BETWEEN 3 AND 60 ORDER BY preco;

-- Produtos que começam com a letra C
SELECT nome "Produto", concat('R$', preco) "Preço", qtproduto "Quantidade no Estoque", DATE_FORMAT(dtvalidade, "%d/%m/%Y") "Validade" FROM tb_produtos
WHERE nome LIKE 'C%';

-- Inner Join entre as duas tabelas
SELECT pr.nome "Produto",  concat('R$', pr.preco) "Preço", pr.qtproduto "Quantidade no Estoque", DATE_FORMAT(pr.dtvalidade, "%d/%m/%Y") "Validade",
ca.descricao "Categoria", ca.ativo
FROM tb_produtos pr
INNER JOIN tb_categoria ca
ON ca.id = pr.categoria_id ORDER BY pr.nome;

-- Inner Join de uma categoria específica = Aves
SELECT pr.nome "Produto",  concat('R$', pr.preco) "Preço", pr.qtproduto "Quantidade no Estoque", DATE_FORMAT(pr.dtvalidade, "%d/%m/%Y") "Validade",
ca.descricao "Categoria", ca.ativo
FROM tb_produtos pr
INNER JOIN tb_categoria ca
ON ca.id = pr.categoria_id
WHERE ca.descricao LIKE 'Aves' ORDER BY pr.nome;

-- DROPS
DROP TABLE tb_categoria;
DROP TABLE tb_produtos;
DROP DATABASE db_cidade_das_carnes;
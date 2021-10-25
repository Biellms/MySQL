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
*/

-- Banco de dados
CREATE DATABASE db_quitanda;
USE db_quitanda;

-- Tabela tb_categoria
CREATE TABLE tb_categoria (

	idCategoria bigint auto_increment,
    nomeCategoria varchar(50),
    descricao varchar(250),
    
    CONSTRAINT id_categoria_pk primary key (idCategoria)
);

-- Tabela tb_produto
CREATE TABLE tb_produto (

	idProduto bigint auto_increment,
    nomeProd varchar(50),
    descricao varchar(250),
    marca varchar(50),
    preco decimal(8,2),
    categoria bigint,
    
	CONSTRAINT id_produto_pk primary key (idProduto),
    CONSTRAINT categoria_produto_fk foreign key (categoria) REFERENCES tb_categoria (idCategoria)
);
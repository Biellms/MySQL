/*Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as informações dos produtos desta empresa. 
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.
Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia.

Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
Faça um select  utilizando LIKE buscando os Produtos com a letra B.
Faça um um select com Inner join entre  tabela categoria e produto.
 */

-- Banco de Dados 
CREATE DATABASE db_farmacia;
USE db_farmacia;

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

-- Inserindo dados na tabela tb_categoria
INSERT INTO tb_categoria (nomeCategoria, descricao) -- 1
VALUES ("Medicamentos Genéricos","Medicamentos são produtos desenvolvidos em laboratórios, testados e aprovados pela Anvisa");
INSERT INTO tb_categoria (nomeCategoria, descricao) -- 2
VALUES ("Beleza E Higiene","Cuidar da Beleza e Higiene Pessoal é fundamental para garantir a saúde do corpo e nosso bem estar");
INSERT INTO tb_categoria (nomeCategoria, descricao) -- 3
VALUES ("Mamãe E Bebê","Na categoria mamãe e bebê, você encontra variados tipos de produtos para cuidar da saúde da mãe e seu bem-estar, assim como itens que são úteis para receber o bebê que está sendo gerado");
INSERT INTO tb_categoria (nomeCategoria, descricao) -- 4
VALUES ("Dermaclub","Um clube para quem ama cuidar da pele. Aqui você ganha descontos o ano todo e suas compras valem pontos para trocar por produtos das marcas participantes");
INSERT INTO tb_categoria (nomeCategoria, descricao) -- 5
VALUES ("Teste Covid-19","Testes para Covid-19");

-- Inserindo dados na tabela tb_categoria
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Paracetamol","Paracetamol 750mg 20 comprimidos genérico","Medley",21,1);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Cimegripe","Cimegripe 400mg Cimed 20 Cápsulas","Cimed",12,1);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Dorflex","Analgésico Dorflex Sanofi 50 Comprimidos","Sanofi Aventis",19,1);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Sabonete Líquido","Kit Sabonete Líquido Darrow Actine 140ml + 60ml","Darrow",32,2);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Creme Dental","Creme Dental Oral-B 123 Menta Suave 70g","Oral-B",2.5,2);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Limpeza Facial","Espuma De Limpeza Facial Dove Hidratação Essencial 15g","Dove",1.5,2);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Hipoglós","Creme Preventivo de Assaduras Hipoglós Original 45g","Hipoglós",15,3);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Fralda","Lenços Umedecidos Pampers Aroma de Aloe Vera 192 Unidades","Pampers",41,3);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Creme Hidratante","Creme Hidratante Corporal CeraVe Hidratação 24h e Textura Cremosa 50g","CeraVe",18,4);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Protetor Solar","Protetor Solar Facial La Roche-Posay Anthelios Hydraox FPS60 Sem Cor 50g","Anthelios",69,4);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Teste Antígeno Swab","Teste rápido que tem por finalidade identificar a presença ou não de partículas do vírus (antígeno) causador da Covid-19","Antígeno Swab",110,5);
INSERT INTO tb_produto (nomeProd, descricao, marca, preco, categoria)
VALUES ("Teste Anticorpos (IgM e IgG)","Teste rápido que tem por finalidade identificar a presença ou não de anticorpos IgM e IgG (defesas do organismo), se o indivíduo teve contato recente com o vírus (IgM) ou que já teve Covid-19 e está se recuperando ou já se recuperou (IgG)","Anticorpos (IgM e IgG)",79,5);

-- Produtos com o valor MAIOR que R$50,00
SELECT nomeProd "Produto", descricao "Descrição", marca "Marca", concat('R$', preco) "Preço", categoria FROM tb_produto
WHERE preco > 50 ORDER BY preco;

-- Produtos com o valor ENTRE R$3,00 E R$60,00
SELECT nomeProd "Produto", descricao "Descrição", marca "Marca", concat('R$', preco) "Preço", categoria FROM tb_produto
WHERE preco BETWEEN 3 AND 60 ORDER BY preco;

-- Produtos que começam com D
SELECT nomeProd "Produto", descricao "Descrição", marca "Marca", concat('R$', preco) "Preço", categoria FROM tb_produto
WHERE nomeProd LIKE 'D%';

-- INNER JOIN entre as duas tabelas
SELECT pr.nomeProd "Produto", pr.descricao "Descrição Produto", pr.marca, concat('R$',pr.preco) "Preço", 
ca.nomeCategoria "Categoria", ca.descricao "Descricao Categoria"
FROM tb_produto pr
JOIN tb_categoria ca
ON ca.idCategoria = pr.categoria
ORDER BY pr.nomeProd;

-- INNER JOIN de uma categoria específica = MEDICAMENTOS GENÉRICOS
SELECT pr.nomeProd "Produto", pr.descricao "Descrição Produto", pr.marca, concat('R$',pr.preco) "Preço", 
ca.nomeCategoria "Categoria", ca.descricao "Descricao Categoria"
FROM tb_produto pr
JOIN tb_categoria ca
ON ca.idCategoria = pr.categoria
WHERE ca.nomeCategoria LIKE 'MEDICAMENTOS%';
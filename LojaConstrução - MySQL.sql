/*Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome do banco deverá ter o seguinte nome db_construindo_a_nossa_vida, onde o sistema trabalhará com as informações dos produtos desta empresa.
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.
Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos

Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
Faça um select  utilizando LIKE buscando os Produtos com a letra C.
Faça um um select com Inner join entre  tabela categoria e produto.
Faça um select onde traga todos os Produtos de uma categoria específica.*/

-- Banco de Dados
CREATE DATABASE db_construcao;
USE db_construcao;

-- Tabela Categoria
CREATE TABLE tb_categoria (

	id bigint auto_increment,
    nomeCat varchar(255) NOT NULL,
	descricaoCat varchar(255) NOT NULL,
    
	CONSTRAINT Categoria_pk PRIMARY KEY (id)
);

-- Tabela produto
CREATE TABLE tb_produtos (
	
    id bigint auto_increment,
	nome varchar (255) NOT NULL,
    descricao varchar (255) NOT NULL,
    marca varchar (255) NOT NULL,
	preco decimal(8,2) NOT NULL,
	categoria_id bigint NOT NULL,
    
	CONSTRAINT produtos_pk PRIMARY KEY (id)
);

-- Alterando dados da tabela tb_produtos
ALTER TABLE tb_produtos ADD CONSTRAINT produtos_fk FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id);

-- Inserindo dados na tabela tb_categoria
INSERT INTO tb_categoria (nomeCat, descricaoCat)
VALUES ("Material de Construção","Escolher os materiais adequados para sua casa e construção ajuda em aspectos, como estética, durabilidade, resistência e custo da obra.");
INSERT INTO tb_categoria (nomeCat, descricaoCat)
VALUES ("Ferramentas","É indispensável contar com boas ferramentas tanto para trabalhos em casa quanto para atividades profissionais. Afinal, elas permitem realizar serviços fundamentais, como instalação, manutenção, consertos e outros.");
INSERT INTO tb_categoria (nomeCat, descricaoCat)
VALUES ("Tintas e Acessórios","A tarefa de pintar a casa traz consigo uma série de dilemas: que cor usar? com ou sem textura? que tipo de efeito pode ser feito?");
INSERT INTO tb_categoria (nomeCat, descricaoCat)
VALUES ("Materiais Elétricos","Sua obra chegou à fase das instalações elétricas? Precisa de materiais e de equipamentos para que sua casa tenha os melhores produtos, mas não quer gastar muito? Aqui é o seu lugar.");
INSERT INTO tb_categoria (nomeCat, descricaoCat)
VALUES ("Materiais Hidráulicos","Investir em materiais hidráulicos de qualidade é uma forma inteligente de assegurar conforto e segurança ao seu lar no longo prazo.");

-- Inserindo dados na tabela tb_categoria
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Cimento","Cimento CP II F 32 Todas as Obras 50kg Votoran","Votoran",28.89,1);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Argamassa","Argamassa ACIII Interno e Externo Branco 20kg Votoran","Votoran",52.90,1);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Telha","Telha de PVC Plan Cerâmica 2,42x0,88m Precon","Precon",119.90,1);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Bloco Cerâmico","Bloco Cerâmico Vedação 14x19x29cm Cerâmica Nova Conquista","Nova Conquista",1.89,1);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Colher de Pedreiro","Colher de Pedreiro Canto Reto 6.4/7'' (160mm) com Cabo de Plástico Bimaterial","Dexter",29.90,2);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Alicate","Alicate Corte Diagonal 6''","Dexter",42.90,2);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Tinta","Tinta Acrílica Fosco Econômica Gelo 18L","Luxens",129.90,3);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Corante","Corante Líquido Xadrez 50ml Vermelho","Xadrez",7.99,3);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Cabo","Cabo Flexível 10mm 50Metros Preto 750V","Lexman",514.90,4);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Fita Isolante","Fita Isolante 3M Scotch 33+ Uso Profissional Classe A Preta 19mm x 20m x 0,19mm","Scotch",24.60,4);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Chuveiro","Chuveiro Elétrico Multitemperatura 220V 4400W Branco 3T Equation","Equation",52.90,5);
INSERT INTO tb_produtos (nome, descricao, marca, preco, categoria_id)
VALUES ("Cano PVC","Cano PVC Marrom Soldável 3m 1/2'' 20mm","Equation",21.90,5);

-- Produtos com valores MAIORES que R$50,00
SELECT nome "Produto", descricao "Descrição", marca, concat('R$', preco) "Preço"
FROM tb_produtos
WHERE preco > 50 ORDER BY preco;

-- Produtos com valores ENTRE R$3,00 E R$60,00
SELECT nome "Produto", descricao "Descrição", marca, concat('R$', preco) "Preço"
FROM tb_produtos
WHERE preco BETWEEN 3 AND 60 ORDER BY preco;

-- Produtos que começam com C
SELECT nome "Produto", descricao "Descrição", marca, concat('R$', preco) "Preço"
FROM tb_produtos
WHERE nome LIKE 'C%' ORDER BY produto;

-- Inner Join entre as duas tabelas
SELECT pr.nome "Produto", pr.descricao "Descrição", pr.marca, concat('R$', pr.preco) "Preço", ca.nomeCat "Categoria", ca.descricaoCat "Descrição da categoria"
FROM tb_produtos pr
INNER JOIN tb_categoria ca
ON ca.id = pr.categoria_id ORDER BY preco;

-- Inner Join de uma categoria específica = Material de Construção
SELECT pr.nome "Produto", pr.descricao "Descrição", pr.marca, concat('R$', pr.preco) "Preço", ca.nomeCat "Categoria", ca.descricaoCat "Descrição da categoria"
FROM tb_produtos pr
INNER JOIN tb_categoria ca
ON ca.id = pr.categoria_id
WHERE ca.nomeCat LIKE 'Material de Construção' ORDER BY preco;

-- DROPS 
DROP TABLE tb_produtos;
DROP TABLE tb_categoria;
DROP DATABASE db_construcao;
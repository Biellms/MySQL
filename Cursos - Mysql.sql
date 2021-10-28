/*Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco deverá ter o seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as informações dos produtos desta empresa.
O sistema trabalhará com 2 tabelas tb_curso e tb_categoria.

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.
Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço de um site de cursos onlines.

Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
Faça um select  utilizando LIKE buscando os Produtos com a letra J.
Faça um um select com Inner join entre  tabela categoria e produto.
Faça um select onde traga todos os Produtos de uma categoria específica.*/

-- Banco de Dados
CREATE DATABASE db_cursos;
USE db_cursos;

-- Tabela Categoria
CREATE TABLE tb_categoria (

	id bigint auto_increment,
    nome varchar(255),
    descricao varchar(255),
  
	CONSTRAINT categoria_pk PRIMARY KEY (id)
);

-- Tabela produto
CREATE TABLE tb_cursos (
	
	id bigint auto_increment,
    nome varchar(255),
    descricao varchar(255),
    duracao varchar(10),
    preco decimal(8,2),
    categoria_id bigint,
  
	CONSTRAINT cursos_pk PRIMARY KEY (id)
);

-- Alterando dados da tabela tb_produtos
ALTER TABLE tb_cursos ADD CONSTRAINT cursos_fk FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id);

-- Inserindo dados na tabela tb_categoria
INSERT INTO tb_categoria (nome,descricao)
VALUES ("Programação","Programe nas principais linguagens e plataformas. Explore plataformas como Python, Node.JS, PHP, Java, e .NET a fundo, além de muito conteúdo em outras linguagens como GoLang, Clojure, C/C++, VB ou Cobol.");
INSERT INTO tb_categoria (nome,descricao)
VALUES ("Front-end","Desenvolva sites e webapps com HTML, CSS e JavaScript. Aprenda as boas práticas e as últimas versões do JavaScript. Estude ferramentas e frameworks do mercado como React, Angular, Webpack, jQuery e mais.");
INSERT INTO tb_categoria (nome,descricao)
VALUES ("Data Science","Aprenda a trabalhar com dados. Do Excel ao Python e Machine Learning. Use os principais bancos SQL do mercado e faça análises de dados com business intelligence. Pandas, SciKitLearn, Jupyter e mais.");
INSERT INTO tb_categoria (nome,descricao)
VALUES ("UX & Design","Crie designs de qualidade através de aulas dinâmicas com conceitos e ferramentas nos principais softwares do mercado. Crie layouts para impressos ou plataformas digitais. Edite vídeos ou crie animações.");
INSERT INTO tb_categoria (nome,descricao)
VALUES ("Mobile","Crie aplicativos móveis para as principais plataformas, smartphones e tablets. Aprenda frameworks multiplataforma como Flutter e React Native e saiba como criar apps nativas para Android e iOS. ");

-- Inserindo dados na tabela tb_cursos
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("Java","Java JRE e JDK: Escreva o seu primeiro código com Eclipse","8h",29.9,1);
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("C++","Avançando com C++: Entenda melhor a linguagem","10h",59.9,1);
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("HTML5 e CSS3","HTML5 e CSS3 parte 1: A primeira página da Web","8h",39.9,2);
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("React","Fundamentos de React: escrevendo com Typescript","12h",69.9,2);
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("Machine Learning","Regressão: Implemente uma rede neural com numpy","7h",39.9,3);
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("MySQL","Administração do MySQL: Segurança e otimização do banco","16h",89.9,3);
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("UI - User Interface","Adobe XD: Design visual de um site mobile","10h",59.9,4);
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("UX - User Experience","Fundamentos de UX: Entenda a experiência de usuário","8h",49.9,4);
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("Flutter","Fundamentos de Flutter: Crie o seu primeiro App","15h",75.9,5);
INSERT INTO tb_cursos (nome, descricao, duracao, preco, categoria_id)
VALUES ("React Native","React Native com Expo: Navegação com menu e suporte às telas","8h",49.9,5);

-- Cursos com valores MAIORES que R$50,00
SELECT nome "Curso", descricao "Descrição", duracao "Duração", concat('R$', preco) "Preço"
FROM tb_cursos
WHERE preco > 50 ORDER BY preco;

-- Cursos com valores ENTRE R$3,00 E R$60,00
SELECT nome "Curso", descricao "Descrição", duracao "Duração", concat('R$', preco) "Preço"
FROM tb_cursos
WHERE preco BETWEEN 3 AND 60 ORDER BY preco;

-- Cursos que começam com M
SELECT nome "Curso", descricao "Descrição", duracao "Duração", concat('R$', preco) "Preço"
FROM tb_cursos
WHERE nome LIKE 'M%' ORDER BY nome;

-- Inner Join entre as duas tabelas
SELECT cu.nome "Produto", cu.descricao "Descrição", cu.duracao, concat('R$', cu.preco) "Preço", ca.nome "Categoria", ca.descricao "Descrição da categoria"
FROM tb_cursos cu
INNER JOIN tb_categoria ca
ON ca.id = cu.categoria_id ORDER BY preco;

-- Inner Join de uma categoria específica = Duração de 8 horas
SELECT cu.nome "Produto", cu.descricao "Descrição", cu.duracao, concat('R$', cu.preco) "Preço", ca.nome "Categoria", ca.descricao "Descrição da categoria"
FROM tb_cursos cu
INNER JOIN tb_categoria ca
ON ca.id = cu.categoria_id
WHERE cu.duracao LIKE '8h' ORDER BY preco;

-- DROPS 
DROP TABLE tb_produtos;
DROP TABLE tb_categoria;
DROP DATABASE db_cursos;
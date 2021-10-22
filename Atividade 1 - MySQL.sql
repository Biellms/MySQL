/*Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos funcionaries desta empresa. 
Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5 atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.

Popule esta tabela com até 5 dados;
Faça um select que retorne os funcionaries com o salário maior do que 2000.
Faça um select que retorne os funcionaries com o salário menor do que 2000.
Ao término atualize um dado desta tabela através de uma query de atualização.
*/

CREATE DATABASE db_rh;
USE db_rh;

CREATE TABLE funcionario (

	idFunc bigint auto_increment,
    nomeFunc varchar(250) not null,
    cargoFunc varchar(250) not null,
	idade int not null,
    salario decimal(8,2) not null,

	CONSTRAINT id_rh_pk primary key (idFunc)
);

INSERT INTO funcionario(nomeFunc,cargoFunc,idade,salario) VALUES ("Gabriel Mendes", "DEV Júnior", 19, 3100);
INSERT INTO funcionario(nomeFunc,cargoFunc,idade,salario) VALUES ("Messi", "Faxineiro", 34, 1500);
INSERT INTO funcionario(nomeFunc,cargoFunc,idade,salario) VALUES ("Cristiano Ronaldo", "Faxineiro", 36, 1400);
INSERT INTO funcionario(nomeFunc,cargoFunc,idade,salario) VALUES ("Ronaldinho Gaúcho", "CEO", 41, 17100);
INSERT INTO funcionario(nomeFunc,cargoFunc,idade,salario) VALUES ("KAKÁ", "DEV Pleno", 39, 7100);
INSERT INTO funcionario(nomeFunc,cargoFunc,idade,salario) VALUES ("Ronaldo Fenômeno", "DEV Sênior", 45, 10100);

SELECT * FROM funcionario;

-- Salários MAIORES que R$2000
SELECT nomeFunc "Funcionário", cargoFunc "Cargo", salario FROM funcionario
WHERE salario > 2000;
;

-- Salários MENORES que R$2000
SELECT nomeFunc "Funcionário", cargoFunc "Cargo", salario FROM funcionario
WHERE salario < 2000;
;

-- Atualizando dado da tabela
UPDATE funcionario SET cargoFunc = "Ajudante Geral", salario = 1600
WHERE nomeFunc LIKE 'Messi';

SELECT * FROM funcionario;

DROP TABLE funcionario;
DROP DATABASE db_rh;
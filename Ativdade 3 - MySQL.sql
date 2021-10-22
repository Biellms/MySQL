/*Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as informações dos estudantes deste registro dessa escola. 
Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.

Popule esta tabela com até 8 dados;
Faça um select que retorne o/as estudantes  com a nota maior do que 7.
Faça um select que retorne o/as estudantes  com a nota menor do que 7.
Ao término atualize um dado desta tabela através de uma query de atualização.
*/

CREATE DATABASE db_escola;
USE db_escola;

CREATE TABLE estudantes (
	
	id bigint auto_increment,
    nomeAluno varchar(50) NOT NULL,
    dataNasc date NOT NULL,
    turma varchar(3) NOT NULL,
    periodo varchar(15),
    nota decimal(3,1),
	
	CONSTRAINT id_estudantes_pk primary key (id)
);

INSERT INTO estudantes (nomeALuno, dataNasc, turma, periodo, nota)
VALUES ("Gabriel Mendes","20020129","3ºD","Noturno",6.5);
INSERT INTO estudantes (nomeALuno, dataNasc, turma, periodo, nota)
VALUES ("Albert Einstein","18790314","2ºC","Noturno",10);
INSERT INTO estudantes (nomeALuno, dataNasc, turma, periodo, nota)
VALUES ("Isaac Newton","16430104","1ºA","Matutino",9.8);
INSERT INTO estudantes (nomeALuno, dataNasc, turma, periodo, nota)
VALUES ("Nikola Tesla","18560710","2ºC","Noturno",9.9);
INSERT INTO estudantes (nomeALuno, dataNasc, turma, periodo, nota)
VALUES ("Galileu Galilei","15640215","1ºB","Matutino",8.5);
INSERT INTO estudantes (nomeALuno, dataNasc, turma, periodo, nota)
VALUES ("Pedro Álvares Cabral","14670101","1ºE","Vespertino",5.4);
INSERT INTO estudantes (nomeALuno, dataNasc, turma, periodo, nota)
VALUES ("Stephen Hawking","19420108","3ºE","Noturno",9.5);
INSERT INTO estudantes (nomeALuno, dataNasc, turma, periodo, nota)
VALUES ("Marie Curie","19340704","1ºD","Vespertino",9.7);

SELECT id, nomeAluno "Nome do Aluno", dataNasc "Data de Nascimento", turma, periodo, nota FROM estudantes;

-- Alunos com notas MAIORES que 7
SELECT id, nomeAluno "Nome do Aluno", dataNasc "Data de Nascimento", turma, periodo, nota FROM estudantes
WHERE nota > 7;

-- Alunos com notas MENORES que 7
SELECT id, nomeAluno "Nome do Aluno", dataNasc "Data de Nascimento", turma, periodo, nota FROM estudantes
WHERE nota < 7;

-- Atualizando dado da tabela
UPDATE estudantes SET nota = 6.9
WHERE nomeAluno LIKE 'Pedro%';

SELECT id, nomeAluno "Nome do Aluno", dataNasc "Data de Nascimento", turma, periodo, nota FROM estudantes;

DROP TABLE estudantes;
DROP DATABASE db_escola;
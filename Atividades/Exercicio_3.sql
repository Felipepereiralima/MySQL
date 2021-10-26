/*
	Atividade 3
		Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará 
        com as informações dos estudantes deste registro dessa escola.
		Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 
        atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.
		Popule esta tabela com até 8 dados;
		Faça um select que retorne o/as estudantes com a nota maior do que 7.
		Faça um select que retorne o/as estudantes com a nota menor do que 7.
		Ao término atualize um dado desta tabela através de uma query de atualização.
		salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL 
        ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

create database db_escola;

use db_escola;

create table tb_alunos(
	id_aluno bigint(4) auto_increment,
	nome varchar (255) not null,
	data_nascimento date,
	turma enum("Java", "Python","C++"),
	formato enum("R", "P"),
	nota real,
	stt boolean,
    primary key (id_aluno)
);

insert into tb_alunos(nome, data_nascimento, turma, formato, nota, stt) 
	      Values ("Joana", "1995-10-01", "Python", "R", 10.0, true),
	             ("José", "2001-09-12", "Python", "P", 4.5, false),
				 ("Juca", "2006-12-01", "Java", "R", 8.4, true),
                 ("Sebastião", "1950-01-01", "C++" ,"P", 9.0, false),                    
				 ("Estevam",  "1991-11-01", "Python", "R", 5.4, false),
                 ("Cristiane", "1975-10-28", "C++", "P", 3.3, true),
		         ("Magarida", "1944-07-21", "C++", "P", 9.1, true),
		         ("Beto", "2016-08-30", "Python", "R", 5.9, true);

select * from tb_alunos where nota > 7;

select * from tb_alunos where nota < 7;

update `db_escola`.`tb_alunos` set `nota` = '10.0' where (`id_aluno` = '3');

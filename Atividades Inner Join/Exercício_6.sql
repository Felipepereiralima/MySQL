/*
Atividade 6

Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco deverá ter o seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as informações dos produtos desta empresa. 

O sistema trabalhará com 2 tabelas tb_curso e tb_categoria.

siga  exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço de um site de cursos onlines(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.

Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.

Faça um select  utilizando LIKE buscando os Produtos com a letra J.

Faça um um select com Inner join entre  tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são da categoria Java).

Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.

*/

create database db_cursoDaMinhaVida;

use db_cursoDaMinhaVida;

create table tb_categoria(
id bigint(5) auto_increment,
tipo varchar(50) not null,
modulo varchar(50) not null,
remoto boolean not null,
primary key(id)
);

create table tb_curso(
id_curso bigint(5) auto_increment,
nome varchar(50) not null,
preco int not null,
duracao varchar(50) not null,
idioma varchar(50) not null,
fk_cat_id bigint(5),
primary key (id_curso),
foreign key (fk_cat_id) references tb_categoria(id)
);

insert into tb_categoria(tipo, modulo, remoto)
values ("EAD", "Modulo 1", true),
		("Presencial", "Modulo 1", false),
        ("EAD", "Modulo 2", true),
        ("Presencial", "Modulo 2", false),
        ("EAD", "Modulo 3", true),
		("Presencial", "Modulo 3", false);

insert into tb_curso (nome, preco, duracao, idioma, fk_cat_id)
values ("Java", 1999.99, "3 meses", "Português", 1),
		("Matemática", 60.00, "2 meses", "Português", 2),
        ("Python", 1999.99, "3 meses", "Português", 3),
        ("História", 199.99, "2 meses", "Português", 4),
        ("Física", 199.99, "2 meses", "Português", 6),
        ("C++", 1999.99, "3 meses", "Português", 5),
        ("Springboot", 1999.99, "3 meses", "Português", 1),
        ("Angular", 1999.99, "3 meses", "Português", 3);
        
select * from tb_curso where preco > 50;
select * from tb_curso where preco between 3 and 60;
select * from tb_curso where nome like "%C%";
select * from tb_curso inner join tb_categoria on tb_curso.fk_cat_id = tb_categoria.id;
select * from tb_curso inner join tb_categoria on tb_curso.fk_cat_id = tb_categoria.id where nome = "Java";
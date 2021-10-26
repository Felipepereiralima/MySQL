/*
Atividade 4

Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o sistema trabalhará com as informações dos produtos desta empresa. 

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

siga  exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço desse açougue.

Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.

Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.

Faça um select  utilizando LIKE buscando os Produtos com a letra C.

Faça um um select com Inner join entre  tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são aves ou legumes).

Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

create database db_cidade_das_frutas;

use db_cidade_das_frutas;

create table tb_categoria(
id_cat bigint (5) auto_increment,
tipo varchar(50),
marca varchar(50),
pais_origem varchar(50),
primary key (id_cat)
); 

create table tb_produto(
id bigint (5) auto_increment,
nome varchar(50) not null,
preco decimal(10,2),
quantidade int,
qualidade varchar(50),
fk_categoria bigint(5),
primary key(id),
foreign key(fk_categoria) references tb_categoria(id_cat)
);

insert into tb_categoria (tipo, marca, pais_origem)
values ("Legumes", "Do Campo", "Brasil"),
		("Verduras", "Do Campo", "Brasil"),
        ("Frutas", "Los Hermanos", "Argentina"),
        ("Conservas", "Gaúcho", "Uruguai"),
        ("Grãos", "Do Campo", "Brasil");

  insert into tb_produto(nome, preco, quantidade, qualidade, fk_categoria)
  values ("Picles", 55.99, 2, "Madura", 4),
          ("Lentilha", 8.99, 6, "Madura", 5),
          ("Alface", 14.99, 8, "Madura", 2),
          ("Batata", 4.99, 10, "Madura", 1),
          ("Maçã", 8.99, 11, "Madura", 3),
          ("Pêra", 4.99, 7, "Madura", 3),
          ("Uva", 11.00, 5, "Madura", 3),
          ("Banana", 3.99, 4, "Madura", 3);

select * from tb_produto where preco > 50;
select * from tb_produto where preco between 3 and 60;
select * from tb_produto where nome like "%C%";
select * from tb_produto inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id_cat;
select * from tb_produto inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id_cat where tipo = "Legumes";
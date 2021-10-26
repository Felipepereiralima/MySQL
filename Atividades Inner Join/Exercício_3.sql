/*
Atividade 3

Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as informações dos produtos desta empresa. 

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

siga  exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.

Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.

Faça um select  utilizando LIKE buscando os Produtos com a letra B.

Faça um um select com Inner join entre  tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são cosméticos).
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.

*/

create database db_farmacia_do_bem;

use db_farmacia_do_bem;

create table tb_categoria(
id bigint (5) auto_increment,
receita boolean,
tarja varchar(50),
primary key (id)
);

create table tb_produto(
id_prod bigint (5) auto_increment,
nome varchar(50) not null,
preco decimal (10,2),
laboratorio varchar(50) not null,
quantidade int (5),
tipo varchar(50) not null,
fk_categoria bigint(5),
primary key (id_prod),
foreign key (fk_categoria) references tb_categoria(id)
);

insert into tb_categoria (receita, tarja)
values (false, "Sem Tarja"),
		(true, "Tarja Amarela"),
        (true, "Tarja Vermelha"),
        (false, "Tarja Vermelha Sem Retenção"),
		(true, "Tarja Preta");

insert into tb_produto (nome, preco, laboratorio, quantidade, tipo, fk_categoria)
values ("Loratadina", 12.00, "EMS", 30, "Remédio", 1),
		("Lorazepan", 65.00, "Aché", 10, "Remédio", 5),
        ("Benegrip", 10.00, "EMS", 500, "Remédio", 1),
        ("Azitromicina", 55.00, "EMS", 40, "Remédio", 1),
        ("Dipirona", 70.00, "EMS", 50, "Remédio", 1),
        ("Cetoprofeno", 11.00, "EMS", 80, "Remédio", 3),
        ("Allegra", 10.00, "EMS", 100,"Remédio", 1),
        ("Renew", 100.00, "Renew", 25,"Cosmético", 1);

select * from tb_produto where preco > 50;
select * from tb_produto where preco between 3 and 60;
select * from tb_produto where nome like "%B%";
select * from tb_produto inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id;
select * from tb_produto inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id where tipo = "Cosmético";

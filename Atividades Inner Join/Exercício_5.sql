/*
Atividade 5

Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome do banco deverá ter o seguinte nome db_construindo_a_nossa_vida, onde o sistema trabalhará com as informações dos produtos desta empresa. 

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

Siga  exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.

Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos (não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.

Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.

Faça um select  utilizando LIKE buscando os Produtos com a letra C.

Faça um um select com Inner join entre  tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são da categoria hidráulica).

Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

create database db_construindo_a_nossa_vida;

use db_construindo_a_nossa_vida;

create table tb_categoria(
id bigint(5) auto_increment,
tipo varchar(50),
marca varchar(50),
pais_origem varchar(50),
primary key (id)
);

create table tb_produto(
id bigint (5) auto_increment,
produto varchar(50) not null,
quantidade int not null,
preco decimal (10,2) not null,
validade date not null,
fk_id_cat bigint(5),
primary key(id),
foreign key (fk_id_cat) references tb_categoria(id)
);

insert into tb_categoria(tipo, marca, pais_origem)
values ("Acabamento", "Cimentolandia", "Brasil"),
		("Carpintaria", "Casa da Madeira", "Brasil"),
        ("Alvenaria", "Casa do Tijolo", "Brasil"),
        ("Pintura", "Casa da Pintura", "Brasil"),
        ("Revestimento", "Casa dos Pisos", "Brasil");
        
insert into tb_produto (produto, quantidade, preco, validade, fk_id_cat)
values ("Cimento", 100, 31.99, '2021-10-30', 1),
       ("Argamassa", 100, 21.99, '2021-10-31', 1),
       ("Piso", 100, 15.99, '2021-11-02', 5),
       ("Madeirite", 100, 11.99, '2021-11-03', 2),
       ("Tijolo", 100, 11.99, '2021-11-04', 3),
       ("Tinta", 100, 201.99, '2021-11-05', 4),
       ("Porta de Madeira", 100, 151.99, '2021-10-29', 2),
       ("Pastilha", 100, 21.99, '2021-11-06', 5);
       
select * from tb_produto where preco > 50;
select * from tb_produto where preco between 3 and 60;
select * from tb_produto where produto like "%C%";
select * from tb_produto inner join tb_categoria on tb_produto.fk_id_cat = tb_categoria.id;
select * from tb_produto inner join tb_categoria on tb_produto.fk_id_cat = tb_categoria.id where tipo = "Acabamento";
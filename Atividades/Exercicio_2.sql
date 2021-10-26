/*
Atividade 2
Crie um banco de dados para um e commerce, onde o sistema trabalhará com as informações dos produtos deste ecommerce. 
Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste ecommerce.
Popule esta tabela com até 8 dados;
Faça um select que retorne os produtos com o valor maior do que 500.
Faça um select que retorne os produtos com o valor menor do que 500.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

create database db_ecommerce;

use db_ecommerce;

create table tb_produtos(
id_produto bigint (5) auto_increment,
produto varchar(255) not null,
quantidade int,
preco decimal (10,2),
marca varchar(255),
primary key(id_produto)
);

insert into tb_produtos(produto, quantidade, preco, marca)
values ("Tênis", 1, 199.00, "Nike"),
		("Calça", 1, 60.00, "Gucci"),
        ("Boné", 1, 99.00, "New Era"),
        ("Sapato", 1, 299.00, "Pegada"),
        ("Blusa", 1, 100.00, "Supreme"),
        ("Relógio", 1, 599.00, "Tag Heuer"),
        ("Pulseira", 1, 499.00, "Vivara"),
        ("Anel", 1, 899.00, "Vivara");
        
select * from tb_produtos where preco > 500.00;
select * from tb_produtos where preco < 500.00;

update `db_ecommerce`.`tb_produtos` set `preco` = '999.00' where (`id_produto` = '1');

select * from tb_produtos;

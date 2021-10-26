/*
Atividade 1

Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as informações dos personagens desse game. 

O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.

siga  exatamente esse passo a passo:

Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos relevantes da classe para se trabalhar com o serviço desse  game Online.

Crie uma tabela tb_personagem  e utilizando a habilidade de abstração e determine 5 atributos relevantes dos funcionários para se trabalhar com o serviço desse game Online (não esqueça de criar a foreign key de tb_classe nesta tabela).

Popule esta tabela classe com até 5 dados.

Popule esta tabela personagem com até 8 dados.

Faça um select que retorne os personagens com o poder de ataque maior do que 2000.

Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000.

Faça um select  utilizando LIKE buscando os personagens com a letra C.

Faça um um select com Inner join entre  tabela classe e personagem.

Faça um select onde traga todos os personagem de uma classe específica (exemplo todos os personagens que são arqueiros).

salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.

*/


create database db_generation_game_online;

use db_generation_game_online;

create table tb_classe(
  id_classe bigint(5) auto_increment,
  tipo varchar(30) not null unique,
  habitat varchar(30) not null,
  vida int not null,
  primary key (id_classe)
);

create table tb_personagem(
id_person bigint(5) auto_increment,
nome varchar(30) not null,
idade int not null,
personalidade varchar(30) not null,
atq_principal varchar(30) not null,
poder_ataq int not null,
poder_defesa int not null,
fk_classe bigint(5),
primary key (id_person),
foreign key (fk_classe) references tb_classe(id_classe)
);

insert into tb_classe(tipo, habitat, vida)
values ("Arcanista", "Floresta", 100), -- 1
       ("Ladino", "Cidade", 100), -- 2
       ("Guerreiro", "Cidade", 100), -- 3
       ("Arqueiro", "Floresta", 100), -- 4
       ("Anão", "Montanhas", 100);  -- 5

insert into tb_personagem(nome, idade, personalidade, atq_principal, poder_ataq, poder_defesa, fk_classe)
values ("Felipe", 30, "introvertido", "Narigada", 2000, 1000, 1 ),
		("Caio", 29, "extrovertido", "Barrigada", 3000, 1500, 2),
        ("Fabio", 28, "introvertido", "Facada", 1500, 750, 3),
        ("Rhamah", 27, "extrovertido", "Cabeçada", 5000, 2500, 4),
        ("Bruno", 26, "introvertido", "Porrada", 1000, 500, 5),
        ("João", 25, "introvertido", "Facada", 2500, 1250, 1),
        ("Vinicius", 24, "extrovertido", "Porrada", 10000, 5000, 2),
        ("Paulo", 23, "introvertido", "Barrigada",5000, 2500, 3);

select * from tb_personagem where poder_ataq > 2000;
select * from tb_personagem where poder_defesa between 1000 and 2000;
select * from tb_personagem where nome like "%c%";
select * from tb_personagem inner join tb_classe on tb_classe.id_classe = tb_personagem.fk_classe where tipo = "Arqueiro";








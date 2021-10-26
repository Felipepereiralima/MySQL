/*
Atividade 1
Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos funcionaries desta empresa. 
Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5 atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.
Popule esta tabela com até 5 dados;
Faça um select que retorne os funcionaries com o salário maior do que 2000.
Faça um select que retorne os funcionaries com o salário menor do que 2000.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/


create database db_rh;

use db_rh;
        
create table tb_funcionarios(
id_funcionario bigint (5) auto_increment,
nome varchar(255) not null,
email varchar(255) not null,
idade int (2),
sexo varchar(255),
salario decimal,
primary key (id_funcionario)
);

insert into tb_funcionarios (nome, email, idade, sexo, salario)
values ("Felipe", "felipe@live.com", 30, "Masculino", "3500"),
		("João", "joão@live.com", 29, "Masculino", "4500"),
        ("Maria", "maria@live.com", 28, "Feminino", "5500"),
        ("Joana", "joana@live.com", 27, "Feminino", "6500"),
        ("Mario", "mario@live.com", 26, "Masculino", "7500");
        
select * from tb_funcionarios where salario > 2000;
select * from tb_funcionarios where salario < 2000;

update `db_rh`.`tb_funcionarios` set `salario` = '2000' where (`id_funcionario` = '1');

select * from tb_funcionarios

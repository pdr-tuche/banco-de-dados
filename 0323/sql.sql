create database ads_justica;

use ads_justica;

create table tb_advogado(
	oab int,
    nome int

);

create table tb_justica(
id int,
instancia char(1)
);

alter table tb_advogado
change nome Nome_completo varchar(50);

alter table tb_advogado
add primary key (oab);

alter table tb_justica
add primary key (id);

alter table tb_advogado
add column especialidade varchar(30)
default 'Constitucionalista' not null;

alter table tb_justica add column UF char(2);

alter table tb_advogado add check (especialidade in ('Constitucionalista', 'Tributarista', 'Processualista', 'Penal'));

alter table tb_justica modify
instancia varchar(15);

create table safado(
cod int primary key,
descricao varchar(60),
oab char(1),safado
id int
);

rename table safado to tb_processo;

alter table tb_processo modify oab int;

alter table tb_processo add foreign key (oab) references tb_advogado(oab);

alter table tb_processo add constraint
sinto_muito foreign key(id) references tb_justica(id);

insert into tb_advogado values
('1','Joao','Penal'),
('2','Maria','Constitucionalista');

insert into tb_advogado
(Nome_Completo, oab, especialidade) values
('Sophia','3','penal');

select * from tb_advogado;
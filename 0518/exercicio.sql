create database banco;
use banco;

create table cliente(
num_cliente char(2) primary key,
nome_cliente varchar(255),
agencia varchar(255),
conta varchar(15)
);

create table emprestimo(
num_emprestimo char(4) primary key,
valor decimal(7,2),
dataempr date,
num_cliente char(2),
foreign key(num_cliente) references cliente(num_cliente)
);


show tables;

insert into cliente values 
('C1','Bruno','Tambaú','205.123-9'),
('C2','Larissa','Cristo','150.230-X');

insert into emprestimo values
('E100',1500.00,'2020-01-15','C1'),
('E200',2800.00,'2020-01-28','C2'),
('E300',1700.00,'2020-01-15','C2');

select* from cliente;
select * from emprestimo;

# questao1
create view v_cliente_emprestimo
as 
select c.agencia, c.nome_cliente from 
cliente c inner join emprestimo e on c.num_cliente = e.num_cliente;

select * from v_cliente_emprestimo;

#questao 2
create view v_total_emprestimos
as
select count(*) Quantidade, c.nome_cliente Nome from
cliente c inner join emprestimo e
on c.num_cliente = e.num_cliente
group by c.nome_cliente;


#questao3
alter view v_total_emprestimos
as
select count(*) Quantidade, c.nome_cliente Nome from cliente c inner join emprestimo e
on c.num_cliente = e.num_cliente
group by c.nome_cliente
having count(*)>=2;

select * from v_total_emprestimos;


#questao4
drop view v_total_emprestimos;
show full tables;

select * from v_cliente_emprestimo;


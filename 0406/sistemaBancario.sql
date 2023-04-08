create database sistema_bancario;

use sistema_bancario;
-- tabela banco

create table banco (
codigo int primary key,
nome varchar (255)
);

-- tabela agencia

create table agencia(
cod_banco int,
numero_agencia int primary key,
endereco varchar(255),
foreign key (cod_banco) references banco(codigo)
);

-- tabela cliente

create table cliente (
cpf int primary key,
nome varchar(255),
sexo char(1),
endereco varchar(255)
);


-- tabela conta

create table conta (
numero_conta int primary key,
saldo float,
tipo_conta varchar (255),
num_agencia int,
foreign key (num_agencia) references agencia(numero_agencia)
);


-- tabela historico

create table historico(
cpf_cliente int,
num_conta int,
data_inicio datetime,
foreign key (cpf_cliente) references cliente(cpf),
foreign key (num_conta) references conta(numero_conta)
);



-- tabela telefone_cliente

create table telefone_cliente(
cpf_cli int,
telefone varchar(255),
foreign key (cpf_cli) references cliente(cpf)
);


-- inserindo valores

insert into banco(codigo, nome) 
values (1, 'Banco do Brasil'), (4, 'CEF');

insert into agencia(numero_agencia, endereco, cod_banco)
values (322, 'Av. Walfredo Macedo Brandao, 1139', 4), (1253, 'R. Bancário Sérgio Guerra, 17', 1);

insert into cliente(cpf, nome, sexo, endereco)
values (111, 'Bruna Andrade', 'F', 'Rua José Firmino Ferreira, 1050'), (222, 'Radegondes Silva', 'M', 'Av. Epitácio Pessoa, 1008'),
(333, 'Miguel Xavier', 'M', 'Rua Bancário Sérgio Guerra, 640');

select * from cliente;

insert into conta(numero_conta, saldo, tipo_conta, num_agencia)
values (117652, 2274505, 'poupanca' ,322),(210107, 310096, 'conta corrente' , 1253);

insert into historico(cpf_cliente, num_conta, data_inicio)
values (111, 117652, '2015-12-22'), (222, 117652, '2016-10-05'), (333, 210107, '2012-08-29');

insert into telefone_cliente(cpf_cli, telefone)
values (111, '(83) 3222-1234'), (222, '(83) 99443-9999'), (333, '(83) 3233-2267');


-- ADICIONANDO COLUNA PAÍS

ALTER TABLE cliente ADD pais CHAR(3) DEFAULT 'BRA';

-- ADICIONANDO COLUNA EMAIL
ALTER TABLE cliente ADD email VARCHAR(100);

-- EXCLUINDO CONTA 117652
set foreign_key_checks=0;
DELETE FROM conta WHERE numero_conta = 117652;
set foreign_key_checks=1;

-- Alterando o número da agência 322 para 6342.
UPDATE agencia SET numero_agencia = 6342 WHERE numero_agencia = 322;

-- Modifique o tipo da coluna Numero_conta para char(7) na tabela conta.
set foreign_key_checks=0;
ALTER TABLE conta MODIFY numero_conta char(7);
set foreign_key_checks=1;

-- Altere o registro do cliente Radegondes Silva acrescentando o email radegondes.silva@gmail.com
SET SQL_SAFE_UPDATES = 0;
UPDATE cliente SET email = 'radegondes.silva@gmail.com' WHERE nome = 'Radegondes Silva';
SET SQL_SAFE_UPDATES = 1;

select * from cliente;

-- Concedendo à conta 21010-7 um aumento de 10 por cento no saldo.
UPDATE conta SET saldo = saldo * 1.1 WHERE numero_conta = '210107';

-- Alterando o nome da cliente Bruna Andrade para Bruna Fernandes.
UPDATE cliente SET nome = 'Bruna Fernandes' WHERE cpf = 111;

-- Modificando o tipo de conta para 3 nas contas que possuem saldo maior que R$ 10.000,00.
SET SQL_SAFE_UPDATES = 0;
UPDATE conta SET tipo_conta = '3' WHERE saldo > 10000;
SET SQL_SAFE_UPDATES = 1;


select * from banco;

select * from agencia;

select * from cliente;

select * from conta;

select * from historico;

select * from telefone_cliente;


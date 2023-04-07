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


select * from telefone_cliente;
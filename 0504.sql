create database livraria;
use livraria;
create table editora(
codigo int primary key,
nome varchar(255)
);

create table assunto(
sigla varchar(2) primary key,
nome varchar(255)
);

create table livro(
codigo int primary key,
titulo varchar(255),
valor decimal,
ano int,
assunto varchar(2),
editora int,
foreign key (assunto) references assunto(sigla),
foreign key (editora) references editora(codigo)
);

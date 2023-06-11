create database escola;
use escola;

-- Criação da tabela "turma"
CREATE TABLE turma (
  id INT PRIMARY KEY,
  codigo VARCHAR(50),
  nome VARCHAR(50)
);

-- Criação da tabela "aluno"
CREATE TABLE aluno (
  matricula INT PRIMARY KEY,
  nome VARCHAR(50),
  turma_id INT,
  FOREIGN KEY (turma_id) REFERENCES turma(id)
);
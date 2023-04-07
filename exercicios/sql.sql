create database pedroneves;
use pedroneves;
CREATE TABLE vendedor (
  codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  salario DECIMAL(8,2),
  telefone INT,
  sexo CHAR(1) CHECK (sexo IN ('m', 'f'))
);

CREATE TABLE fabricante (
    codigo INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE PRODUTO (
    codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(8,2),
    fabricante INT,
    CONSTRAINT fk_fabricante
        FOREIGN KEY (fabricante) 
        REFERENCES FABRICANTE(codigo)
);

CREATE TABLE CLIENTE (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nome_rua VARCHAR(60),
    bairro VARCHAR(40),
    cep INT NOT NULL,
    cpf VARCHAR(15) UNIQUE,
    uf CHAR(2) CHECK (uf IN ('AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO')),
    telefone INT NOT NULL,
    desconto DECIMAL(3,1),
    sexo CHAR(1) CHECK (sexo IN ('m', 'f'))
);

CREATE TABLE PEDIDO (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_pagamento VARCHAR(100) NOT NULL,
    id_cliente INT,
    CONSTRAINT FK_CLIENTE_PEDIDO FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id),
    data_entrada DATE NOT NULL,
    data_embarque DATE NOT NULL,
    desconto DECIMAL(3,1),
    valortotal DECIMAL(8,2) NOT NULL,
    telefone INT NOT NULL,
    formapagamento VARCHAR(40)
);

CREATE TABLE ITEM_PEDIDO (
    codigo_produto INT NOT NULL,
    id_pedido INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (codigo_produto, id_pedido),
    CONSTRAINT FK_PRODUTO_ITEM_PEDIDO FOREIGN KEY (codigo_produto) REFERENCES PRODUTO(codigo),
    CONSTRAINT FK_PEDIDO_ITEM_PEDIDO FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id)
);


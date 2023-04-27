create database loja;
use loja;

CREATE TABLE ESTADO (
    cod_estado INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100),
    cidade VARCHAR(50),
    cep VARCHAR(10),
    telefone VARCHAR(20),
    desconto DECIMAL(5,2),
    cod_estado INT,
    FOREIGN KEY (cod_estado) REFERENCES ESTADO(cod_estado)
);

CREATE TABLE UE_PRODUTO (
    cod_ue_produto INT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUTO (
    cod_produto INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    cod_ue_produto INT,
    FOREIGN KEY (cod_ue_produto) REFERENCES UE_PRODUTO(cod_ue_produto)
);

CREATE TABLE PEDIDO (
    id_pedido INT PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL,
    id_cliente INT NOT NULL,
    data_entrada DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(5,2),
    data_embarque DATE,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE ITEM (
    id_pedido INT,
    cod_produto INT,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedido, cod_produto),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (cod_produto) REFERENCES PRODUTO(cod_produto)
);



INSERT INTO ESTADO (cod_estado, nome)
VALUES
    (1, 'São Paulo'),
    (2, 'Rio de Janeiro'),
    (3, 'Minas Gerais'),
    (4, 'Bahia'),
    (5, 'Paraná');

INSERT INTO CLIENTE (id_cliente, nome, endereco, cidade, cep, telefone, desconto, cod_estado)
VALUES
    (1, 'João Silva', 'Rua A, 123', 'São Paulo', '12345-678', '(11) 1234-5678', 0.05, 1),
    (2, 'Maria Santos', 'Av. B, 456', 'Rio de Janeiro', '23456-789', '(21) 2345-6789', 0.1, 2),
    (3, 'Pedro Oliveira', 'Rua C, 789', 'Belo Horizonte', '34567-890', '(31) 3456-7890', 0.07, 3),
    (4, 'Ana Souza', 'Av. D, 321', 'Salvador', '45678-901', '(71) 4567-8901', 0.15, 4),
    (5, 'Luiz Santos', 'Rua E, 987', 'Curitiba', '56789-012', '(41) 5678-9012', 0.2, 5);

INSERT INTO UE_PRODUTO (cod_ue_produto, descricao)
VALUES
    (1, 'Eletrônicos'),
    (2, 'Eletrodomésticos'),
    (3, 'Informática'),
    (4, 'Móveis'),
    (5, 'Esportes');

INSERT INTO PRODUTO (cod_produto, nome, preco, cod_ue_produto)
VALUES
    (1, 'Smartphone Samsung Galaxy S21', 5499.00, 1),
    (2, 'Smart TV LG 55"', 3999.00, 1),
    (3, 'Geladeira Brastemp Frost Free', 3899.00, 2),
    (4, 'Notebook Dell Inspiron', 4999.00, 3),
    (5, 'Cama Box Casal Ortobom', 1999.00, 4),
    (6, 'Bicicleta Caloi Aro 29', 2499.00, 5);

INSERT INTO PEDIDO (id_pedido, tipo, id_cliente, data_entrada, valor_total, desconto, data_embarque)
VALUES
    (1, 'Compra', 1, '2022-01-01', 11000.00, 0.05, '2022-01-05'),
    (2, 'Venda', 3, '2022-02-01', 5999.00, NULL, '2022-02-05'),
    (3, 'Compra', 2, '2022-03-01', 8000.00, 0.1, NULL),
    (4, 'Venda', 4, '2022-04-01', 1699.00, 0.15, NULL),
    (5, 'Compra', 5, '2022-05-01', 7497.00, 0.2, '202');
    
    
    
INSERT INTO ITEM (id_pedido, cod_produto, quantidade, valor_unitario, valor_total)
VALUES 
    (1, 1, 2, 10.50, 21.00),
    (1, 2, 1, 7.80, 7.80),
    (2, 3, 4, 5.20, 20.80),
    (2, 5, 2, 12.50, 25.00),
    (3, 2, 3, 7.80, 23.40),
    (3, 4, 1, 15.60, 15.60),
    (4, 1, 4, 10.50, 42.00),
    (4, 3, 2, 5.20, 10.40),
    (4, 5, 1, 12.50, 12.50),
    (5, 2, 1, 7.80, 7.80),
    (5, 4, 3, 15.60, 46.80),
    (5, 6, 2, 8.90, 17.80);


-- 1 - Selecionar todas as colunas de todos os clientes da tabela CLIENTE
SELECT * FROM CLIENTE;

-- 2 -Selecionar somente a coluna nome de todos os produtos.
SELECT nome FROM PRODUTO;

-- 3 - Selecionar todas as cidades que possuem clientes cadastrados.
SELECT DISTINCT cidade FROM CLIENTE;

-- 4 - Selecionar todos os pedidos para o cliente cujo código seja = 09 e cujo valor total seja maior que 50.
SELECT * FROM PEDIDO WHERE id_cliente = 9 AND valor_total > 50;

-- 5 - Selecionar todos os pedidos cujo valor total seja menor que 100 ou maior que 500.
SELECT * FROM PEDIDO WHERE valor_total < 100 OR valor_total > 500;

-- 6 - Selecionar todos os pedidos cuja data de entrada seja = 04/08/2020.
SELECT * FROM PEDIDO WHERE data_entrada = '2020-08-04';
SELECT * FROM PEDIDO WHERE data_entrada = '2022-05-01';

-- 7 - Selecionar todos os pedidos cuja data de entrada seja = 23/06/2019 e cujo valor total esteja entre 20 e 50.
SELECT * FROM PEDIDO 
WHERE data_entrada = '2019-06-23' AND valor_total BETWEEN 20 AND 50;
SELECT * FROM PEDIDO 
WHERE data_entrada = '2022-05-01' AND valor_total BETWEEN 20 AND 50000;

-- 8 - Selecionar todos os clientes cujo código NÃO esteja entre 05 e 25.
SELECT * FROM CLIENTE
WHERE id_cliente NOT BETWEEN 5 AND 25;

-- 9 - Selecionar todos os produtos cujo nome possua a primeira letra = ‘P’.
SELECT * FROM PRODUTO
WHERE nome LIKE 'P%';
SELECT * FROM PRODUTO
WHERE nome LIKE 'C%';

-- 10 - Selecionar todos os produtos cujo nome possua a string 'an' em qualquer posição do nome
SELECT * FROM PRODUTO
WHERE nome LIKE '%an%';
SELECT * FROM PRODUTO
WHERE nome LIKE '%Sam%';

-- 11 - Selecionar todos os produtos cujo nome comece com C ou F ou M, independente do resto.
SELECT * FROM PRODUTO
WHERE nome LIKE 'C%' OR nome LIKE 'F%' OR nome LIKE 'M%';

-- 12 - Selecionar todos os produtos cujo nome possua 8 caracteres, onde as duas primeiras letras sejam iguais a ‘ma’, independente do conteúdo das 6 próximas letras.
SELECT * FROM PRODUTO
WHERE nome LIKE 'ma___%%%%';
SELECT * FROM PRODUTO
WHERE nome LIKE 's___%%%%';

-- 13 - Selecionar todos os produtos cujo nome possua 7 caracteres e as duas primeiras letras não interessem, as 3 próximas sejam iguais a ‘ACA’ e as duas últimas também não interessem.
SELECT * FROM PRODUTO
WHERE nome LIKE '__ACA__';

-- 14 - Selecionar todos os Produtos cujo Nome possua a string 'a_p' como parte do nome do produto, em qualquer posição do nome.
SELECT *
FROM PRODUTO
WHERE nome LIKE '%a_p%';

-- 15 - Crie uma consulta que selecione todos os clientes cuja UF seja ‘PB’ ou ‘PE’.
SELECT * FROM CLIENTE WHERE cod_estado = 1 OR cod_estado = 2;
SELECT * FROM CLIENTE WHERE cod_estado IN (1, 2);

-- 16 - Selecionar todos os clientes cujo estado NAO seja PB nem PE.
SELECT *
FROM CLIENTE
WHERE cod_estado NOT IN (SELECT cod_estado FROM ESTADO WHERE nome IN ('PB', 'PE'));

-- 17 - Selecionar todos os produtos cuja unidade de estoque seja ‘KG’ ou ‘UM’ e o preço seja maior que 10.
SELECT *
FROM PRODUTO
WHERE cod_ue_produto IN (SELECT cod_ue_produto FROM UE_PRODUTO WHERE descricao = 'KG' OR descricao = 'UM')
  AND preco > 10;
  
-- 18 - Selecionar todos os produtos cujo preço seja menor que 5, incluindo os produtos cujo preço esteja nulo.
  SELECT *
FROM Produto
WHERE Preco < 5 OR Preco IS NULL;

-- 19 - Selecionar o nome e telefone dos clientes cujo código do cliente seja menor que 10 colocando um novo título (rótulo) para cada uma das colunas exibidas no resultado.
SELECT nome AS NomeDoCliente, telefone AS TelefoneDoCliente
FROM cliente
WHERE id_cliente < 10;

-- 20 - Selecionar todos os produtos, demonstrando, o código e o nome do produto, o preço atual de cada produto, e o preço projetado com 30% de aumento.
SELECT cod_produto, nome, preco, preco * 1.3 AS preco_projetado
FROM produto;

-- 21 - Selecionar todos os produtos por ordem de valor descendente, acrescentando um novo rótulo para as colunas exibidas.
SELECT cod_produto AS Código, nome AS Nome, preco AS 'Preço Atual', preco * 1.3 AS 'Preço Projetado'
FROM produto
ORDER BY preco DESC;

-- 22 - Selecionar todos os Produtos por ordem de nome ascendente e valor descendente.
SELECT cod_produto, nome, Preco, Preco*1.3 AS Preco_Projetado
FROM Produto
ORDER BY Nome ASC, Preco DESC;

-- 23 - Contar a quantidade de pedidos feitos para o cliente 05.
SELECT COUNT(*) AS qtd_pedidos
FROM PEDIDO
WHERE id_cliente = '05';

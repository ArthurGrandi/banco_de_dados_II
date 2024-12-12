-----------------BANCO DE DADOS 1-----------------------

CREATE TABLE livro(
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    autor VARCHAR(50),
    preco DECIMAL (10,2) NOT NULL,
    estoque INTEGER NOT NULL
);

INSERT into livro(titulo, autor, preco, estoque);
VALUES('Livro legal', 'Autor paia', 18.50, 13);

INSERT into livro(titulo, autor, preco, estoque);
VALUES('Alice no pais da maravilhas', 'frank richard', 13.50, 5);

INSERT into livro(titulo, autor, preco, estoque);
VALUES('As loucuras de dick e jane', 'Joseph Halph', 79.99, 7);

SELECT * FROM livro

----------CONSULTAS AVANÇADAS COM FILTRO-----------

SELECT livro.titulo
FROM livro
WHERE  autor = 'Autor paia';

SELECT livro.titulo, livro.preco
FROM livro
WHERE preco <= 79.99
ORDER BY preco asc;

-------------UPDATES-----------

UPDATE livro
SET estoque = 25
WHERE titulo = 'Alice no pais da maravilhas';

SELECT livro.titulo, livro.estoque
FROM livro
WHERE titulo = 'Alice no pais da maravilhas';

-------------DELETES-----------

DELETE FROM livro
WHERE livro.titulo = 'Livro legal';

SELECT * FROM livro

-------------JOINS---------------

CREATE TABLE cliente(
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    telefone CHAR(11) NOT NULL
);

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


--------------ESTUDANDO A PROVA-----------------

-- Criação dos domínios
CREATE DOMAIN dnome AS VARCHAR(50) NOT NULL;
CREATE DOMAIN dtelefone AS CHAR(11) NOT NULL;
CREATE DOMAIN dendereco AS VARCHAR(100) NOT NULL;
CREATE DOMAIN dcidade AS VARCHAR(50) NOT NULL;
CREATE DOMAIN dquantidade AS DECIMAL(10,0) NOT NULL;

-- Criação das tabelas
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome dnome,
    telefone dtelefone,
    endereco dendereco,
    cidade dcidade
);

CREATE TABLE produtos (
    idProduto SERIAL PRIMARY KEY,
    descricao VARCHAR(90) NOT NULL,
    qtde_estoque DECIMAL(10, 0) NOT NULL,
    preco NUMERIC(15, 2) NOT NULL
);

CREATE TABLE pedidos (
    num_pedido SERIAL PRIMARY KEY,
    data DATE,
    id_cliente INTEGER,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_pedido (
    num_item SERIAL PRIMARY KEY,
    num_pedido INT,
    idProduto INT,
    quantidade DECIMAL(10, 0) NOT NULL,
    CONSTRAINT fk_pedidos FOREIGN KEY (num_pedido) REFERENCES pedidos(num_pedido),
    CONSTRAINT fk_produtos FOREIGN KEY (idProduto) REFERENCES produtos(idProduto)
);



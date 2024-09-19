----- CODIGO BASE -------

CREATE DOMAIN dNome as VARCHAR(50) NOT NULL;
CREATE DOMAIN dTelefone as VARCHAR(15) NOT NULL;
CREATE DOMAIN dLougradouro as VARCHAR(50) NOT NULL;
CREATE DOMAIN dNumero as VARCHAR(5) NOT NULL;
CREATE DOMAIN dCidade as VARCHAR(50) NOT NULL;
CREATE DOMAIN dBairro as VARCHAR(50) NOT NULL;
CREATE DOMAIN dComplemento as VARCHAR(50);
CREATE DOMAIN dEstado as CHAR(2) NOT NULL;


CREATE TABLE clientes (
    idCliente INTEGER PRIMARY KEY NOT NULL,
    nome dNome,
    telefone  dTelefone,
    logradouro dLougradouro,
    numero dNumero,
    cidade dCidade,
    bairro dBairro,
    complemento dComplemento,
    estado dEstado
);

CREATE TABLE funcionarios (
    idFuncionario INTEGER PRIMARY KEY NOT NULL,
    nome dNome,
    cargo VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL
);

CREATE TABLE pedidos (
    idPedido INTEGER PRIMARY KEY NOT NULL,
    Data DATE NOT NULL,
	Status VARCHAR(15) NOT NULL,
	idCliente INTEGER NOT NULL,
    idFuncionario INTEGER NOT NULL,
    FOREIGN KEY (idFuncionario) REFERENCES funcionarios (idFuncionario) ON DELETE CASCADE,
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente) ON DELETE CASCADE
);

CREATE TABLE fornecedores (
    idFornecedor INTEGER PRIMARY KEY NOT NULL,
    nome dNome,
    telefone dTelefone
);

CREATE TABLE produtos (
    idProduto INTEGER PRIMARY KEY NOT NULL,
    nome dNome,
    descricao VARCHAR(50) NOT NULL,
    preco DECIMAL(15,2) NOT NULL,
    estoque VARCHAR(100) NOT NULL
);

CREATE TABLE transportadoras (
    idTransportadoras INTEGER PRIMARY KEY NOT NULL,
    telefone dTelefone,
    cnpj VARCHAR(14) NOT NULL,
    nome dNome,
    logradouro dLougradouro,
    numero dNumero,
    cidade dCidade,
    bairro dBairro,
    complemento dComplemento,
    estado dEstado
);

CREATE TABLE itens_pedidos (
	idItemPedido INTEGER PRIMARY KEY NOT NULL,
    tamanho VARCHAR(15) NOT NULL,
    quantidade DECIMAL(4) NOT NULL,
    idPedido INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES pedidos (idPedido) ON DELETE CASCADE,
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto) ON DELETE CASCADE
);

CREATE TABLE fornecem (
    idFornecedor INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    PRIMARY KEY (idFornecedor, idProduto),
    FOREIGN KEY (idFornecedor) REFERENCES fornecedores (idFornecedor) ON DELETE CASCADE,
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto) ON DELETE CASCADE
);

CREATE TABLE entregam (
    idPedido INTEGER NOT NULL,
    idTransportadoras INTEGER NOT NULL,
    PRIMARY KEY (idPedido, IdTransportadoras),
    FOREIGN KEY (idPedido) REFERENCES pedidos (idPedido) ON DELETE CASCADE,
    FOREIGN KEY (idTransportadoras) REFERENCES transportadoras (idTransportadoras) ON DELETE CASCADE
);
----- INSERTS -------

-- CLIENTES
INSERT INTO CLIENTES (IdCliente, Nome, Telefone, Logradouro, Numero, Cidade, Bairro, Complemento, Estado)
VALUES
    (1, 'Maria Silva', '31987654321', 'Rua das Flores', '123', 'Belo Horizonte', 'Centro', 'Apto 101', 'MG'),
    (2, 'João Santos', '11987654321', 'Avenida Brasil', '456', 'São Paulo', 'Vila Madalena', 'Casa 2', 'SP'),
    (3, 'Ana Oliveira', '21987654321', 'Rua da Praia', '789', 'Rio de Janeiro', 'Copacabana', 'Sala 3', 'RJ'),
    (4, 'Pedro Almeida', '31987654322', 'Rua das Palmeiras', '456', 'Salvador', 'Barra', 'Apto 501', 'BA'),
    (5, 'Carla Ferreira', '21987654323', 'Avenida das Américas', '987', 'Niterói', 'Icaraí', 'Casa 1', 'RJ'),
    (6, 'Lucas Oliveira', '41987654324', 'Rua das Mangueiras', '321', 'Brasília', 'Asa Sul', 'Apto 201', 'DF'),
	(7, 'Roberta Souza', '51987654325', 'Avenida das Palmeiras', '654', 'Salvador', 'Barra', 'Apto 601', 'BA'),
    (8, 'Marcos Lima', '31987654326', 'Rua dos Coqueiros', '987', 'Florianópolis', 'Centro', 'Casa 4', 'SC'),
    (9, 'Carolina Mendes', '21987654327', 'Avenida das Flores', '321', 'Curitiba', 'Bairro Novo', 'Apto 301', 'PR'),
    (10, 'Ricardo Alves', '41987654328', 'Rua das Árvores', '147', 'Porto Alegre', 'Centro', 'Casa 5', 'RS');

-- FUNCIONÁRIOS
INSERT INTO FUNCIONARIOS (idfuncionario, Nome, Cargo, Departamento)
VALUES
    (1, 'Paula Lima', 'Gerente', 'Administração'),
    (2, 'Marcos Santos', 'Vendedor', 'Vendas'),
    (3, 'Fernanda Oliveira', 'Analista', 'TI'),
    (4, 'Rafael Souza', 'Atendente', 'Atendimento'),
    (5, 'Juliana Silva', 'Supervisor', 'Produção'),
    (6, 'Rodrigo Mendes', 'Coordenador', 'Logística');

-- FORNECEDORES
INSERT INTO FORNECEDORES (IdFornecedor, Nome, Telefone)
VALUES
    (1, 'Fornecedor A', '11987654321'),
    (2, 'Fornecedor B', '21987654321'),
    (3, 'Fornecedor C', '31987654321'),
    (4, 'Fornecedor D', '41987654321'),
    (5, 'Fornecedor E', '51987654321'),
    (6, 'Fornecedor F', '61987654321');


-- FUNCIONÁRIOS
INSERT INTO FUNCIONARIOS (idfuncionario, Nome, Cargo, Departamento)
VALUES
	(7, 'Luiza Costa', 'Analista', 'Financeiro'),
    (8, 'Gustavo Pereira', 'Estagiário', 'Recursos Humanos'),
    (9, 'Camila Rodrigues', 'Desenvolvedor', 'Tecnologia'),
    (10, 'Mariana Santos', 'Assistente', 'Marketing');

-- FORNECEDORES
INSERT INTO FORNECEDORES (IdFornecedor, Nome, Telefone)
VALUES
	(7, 'Marta Santos', 'Analista'),
    (8, 'Carlos Oliveira', 'Estagiário'),
    (9, 'Leticia Rodrigues', 'Desenvolvedor'),
    (10, 'Henrique Silva', 'Assistente');

-- PEDIDOS
INSERT INTO PEDIDOS (IdPedido, Data, idCliente, Status, IdFuncionario)
VALUES
    (1, '2024-05-01', 1, 'Em andamento', 1),
    (2, '2024-05-02', 2, 'Concluído', 2),
    (3, '2024-05-03', 3, 'Em andamento', 3),
    (4, '2024-05-04', 4, 'Pendente', 4),
    (5, '2024-05-05', 5, 'Concluído', 5),
    (6, '2024-05-06', 6, 'Em andamento', 6),
    (7, '2024-05-07', 7, 'Concluído', 7),
    (8, '2024-05-08', 8, 'Pendente', 8),
    (9, '2024-05-09', 9, 'Concluído', 9),
    (10, '2024-05-10', 10, 'Em andamento', 10);


-- PRODUTOS
INSERT INTO PRODUTOS (IdProduto, Nome, Descricao, Preco, Estoque)
VALUES
    (1, 'Produto A', 'Descrição do Produto A', 10.50, '100 unidades'),
    (2, 'Produto B', 'Descrição do Produto B', 15.75, '75 unidades'),
    (3, 'Produto C', 'Descrição do Produto C', 20.00, '50 unidades'),
    (4, 'Produto D', 'Descrição do Produto D', 12.99, '120 unidades'),
    (5, 'Produto E', 'Descrição do Produto E', 30.25, '30 unidades'),
    (6, 'Produto F', 'Descrição do Produto F', 18.50, '90 unidades'),
    (7, 'Produto G', 'Descrição do Produto G', 25.80, '60 unidades'),
    (8, 'Produto H', 'Descrição do Produto H', 8.99, '150 unidades'),
    (9, 'Produto I', 'Descrição do Produto I', 22.50, '40 unidades'),
    (10, 'Produto J', 'Descrição do Produto J', 19.75, '80 unidades');

-- TRANSPORTADORAS
INSERT INTO TRANSPORTADORAS (IdTransportadoras, Telefone, Cnpj, Nome, Logradouro, Numero, Cidade, Bairro, Complemento, Estado)
VALUES
    (1, '21987654321', '01234567890123', 'Transportadora X', 'Rua das Árvores', '123', 'São Paulo', 'Centro', 'Sala 101', 'SP'),
    (2, '31987654321', '98765432109876', 'Transportadora Y', 'Avenida das Flores', '456', 'Rio de Janeiro', 'Copacabana', 'Apto 202', 'RJ'),
    (3, '41987654321', '76543210987654', 'Transportadora Z', 'Rua dos Santos', '789', 'Belo Horizonte', 'Barreiro', 'Casa 3', 'MG'),
    (4, '51987654321', '54321098765432', 'Transportadora W', 'Avenida das Palmeiras', '987', 'Salvador', 'Pituba', 'Apto 401', 'BA'),
    (5, '61987654321', '32109876543210', 'Transportadora V', 'Rua dos Coqueiros', '234', 'Brasília', 'Asa Norte', 'Apto 102', 'DF'),
    (6, '71987654321', '10987654321098', 'Transportadora U', 'Avenida dos Lírios', '567', 'Curitiba', 'Centro', 'Casa 2', 'PR'),
    (7, '81987654321', '98765432101234', 'Transportadora T', 'Rua das Margaridas', '876', 'Fortaleza', 'Aldeota', 'Apto 501', 'CE'),
    (8, '91987654321', '76543210987654', 'Transportadora S', 'Avenida das Orquídeas', '321', 'Recife', 'Boa Viagem', 'Casa 5', 'PE'),
    (9, '10198765432', '54321098765432', 'Transportadora R', 'Rua das Violetas', '654', 'Manaus', 'Centro', 'Casa 10', 'AM'),
    (10, '11198765432', '32109876543210', 'Transportadora Q', 'Avenida das Bromélias', '987', 'Porto Alegre', 'Centro', 'Sala 3', 'RS');

-- ITENS_PEDIDOS
INSERT INTO ITENS_PEDIDOS (Tamanho, Quantidade, IdItemPedido, IdPedido, IdProduto)
VALUES
    ('Pequeno', 5, 1, 1, 1),
    ('Grande', 10, 2, 2, 2),
    ('Médio', 8, 3, 3, 3),
    ('Pequeno', 3, 4, 4, 4),
    ('Grande', 15, 5, 5, 5),
    ('Médio', 7, 6, 6, 6),
    ('Pequeno', 4, 7, 7, 7),
    ('Grande', 12, 8, 8, 8),
    ('Médio', 9, 9, 9, 9),
    ('Pequeno', 6, 10, 10, 10);


------ CONSULTAS ------
SELECT
    c.nome AS "Nome",
    p.data AS "Data do pedido",
    array_agg(DISTINCT CONCAT(pro.nome, ' - ', i.tamanho, ' - ', 'R$ ', CAST(pro.preco AS TEXT))) AS "Itens do pedido",
    SUM(pro.preco) AS "Total"
FROM
    clientes c
JOIN
    pedidos p ON c.idCliente = p.idCliente
JOIN
    itens_pedidos i ON p.idPedido = i.idPedido
JOIN
    produtos pro ON i.idProduto = pro.idProduto
GROUP BY
    c.nome, p.data, p.idPedido
ORDER BY
    p.data;
-- Consultar pedidos por clientes e data do pedido

SELECT
    c.nome AS "Nome do Cliente",
    p.idPedido AS "ID do Pedido",
    p.data AS "Data do Pedido"
FROM
    clientes c
JOIN
    pedidos p ON c.idCliente = p.idCliente
ORDER BY
    c.nome, p.data;

-- Consultar disponibilidade de produto por fornecedor

----ERRO
--SELECT
--    f.nome AS "Nome do Fornecedor",
--    p.nome AS "Nome do Produto",
--    p.descricao AS "Descrição do Produto",
--    p.estoque AS "Estoque Disponível",
--    p.preco AS "Preço"
--FROM
--    fornecedores f
--JOIN
--    fornecem fo ON f.idFornecedor = fo.idFornecedor
--JOIN
--    produtos p ON fo.idProduto = p.idProduto
--ORDER BY
--    f.nome, p.nome;
----ERRO



-- Mostrar descrição dos itens através de produtos

SELECT
    p.nome AS "Nome do Produto",
    p.descricao AS "Descrição do Produto",
    p.estoque AS "Estoque Disponível",
    p.preco AS "Preço",
    ip.tamanho AS "Tamanho",
    ip.quantidade AS "Quantidade"
FROM
    itens_pedidos ip
JOIN
    produtos p ON ip.idProduto = p.idProduto
ORDER BY
    p.nome, ip.tamanho;

-- Associar pedidos a transportadoras


-----ERRO
--SELECT
--    p.idPedido,
--    p.Data,
--    p.Status,
--    t.idTransportadoras,
--    t.nome AS "Nome da Transportadora",
--    t.telefone AS "Telefone da Transportadora",
--    t.logradouro AS "Logradouro da Transportadora",
--    t.numero AS "Número da Transportadora",
--    t.cidade AS "Cidade da Transportadora",
--    t.estado AS "Estado da Transportadora"
--FROM
--    pedidos p
--JOIN
--    entregam e ON p.idPedido = e.idPedido
--JOIN
--    transportadoras t ON e.idTransportadoras = t.idTransportadoras;
----ERRO





-- Mostrar qual funcionário gerencia aquele pedido

SELECT
    p.idPedido,
    p.Data,
    p.Status,
    f.idFuncionario,
    f.nome AS "Nome do Funcionário",
    f.cargo AS "Cargo do Funcionário",
    f.departamento AS "Departamento do Funcionário"
FROM
    pedidos p
JOIN
    funcionarios f ON p.idFuncionario = f.idFuncionario;

-- Mostrar status do pedido

SELECT
    idPedido,
    Data,
    Status
FROM
    pedidos;

----- CODIGOS VIEW

-- View para exibir informações dos pedidos, incluindo cliente e itens
CREATE VIEW vw_pedidos_com_itens AS
SELECT
    c.nome AS "Nome do Cliente",
    p.data AS "Data do Pedido",
    array_agg(DISTINCT CONCAT(pro.nome, ' - ', i.tamanho, ' - ', 'R$ ', CAST(pro.preco AS TEXT))) AS "Itens do Pedido",
    SUM(pro.preco) AS "Total"
FROM
    clientes c
JOIN
    pedidos p ON c.idCliente = p.idCliente
JOIN
    itens_pedidos i ON p.idPedido = i.idPedido
JOIN
    produtos pro ON i.idProduto = pro.idProduto
GROUP BY
    c.nome, p.data, p.idPedido
ORDER BY
    p.data;

SELECT * FROM vw_pedidos_com_itens;

-- View para exibir pedidos por cliente e data
CREATE VIEW vw_pedidos_cliente_data AS
SELECT
    c.nome AS "Nome do Cliente",
    p.idPedido AS "ID do Pedido",
    p.data AS "Data do Pedido"
FROM
    clientes c
JOIN
    pedidos p ON c.idCliente = p.idCliente
ORDER BY
    c.nome, p.data;

SELECT * FROM vw_pedidos_cliente_data;

-- View para exibir a disponibilidade de produtos por fornecedor
CREATE VIEW vw_disponibilidade_produtos_fornecedor AS
SELECT
    f.nome AS "Nome do Fornecedor",
    p.nome AS "Nome do Produto",
    p.descricao AS "Descrição do Produto",
    p.estoque AS "Estoque Disponível",
    p.preco AS "Preço"
FROM
    fornecedores f
JOIN
    fornecem fo ON f.idFornecedor = fo.idFornecedor
JOIN
    produtos p ON fo.idProduto = p.idProduto
ORDER BY
    f.nome, p.nome;

SELECT * FROM vw_disponibilidade_produtos_fornecedor;

-- View para exibir informações dos itens de pedido e produtos
CREATE VIEW vw_itens_pedido_produtos AS
SELECT
    p.nome AS "Nome do Produto",
    p.descricao AS "Descrição do Produto",
    p.estoque AS "Estoque Disponível",
    p.preco AS "Preço",
    ip.tamanho AS "Tamanho",
    ip.quantidade AS "Quantidade"
FROM
    itens_pedidos ip
JOIN
    produtos p ON ip.idProduto = p.idProduto
ORDER BY
    p.nome, ip.tamanho;

SELECT * FROM vw_itens_pedido_produtos;

-- View para associar pedidos às transportadoras
CREATE VIEW vw_pedidos_transportadoras AS
SELECT
    p.idPedido,
    p.Data,
    p.Status,
    t.idTransportadoras,
    t.nome AS "Nome da Transportadora",
    t.telefone AS "Telefone da Transportadora",
    t.logradouro AS "Logradouro da Transportadora",
    t.numero AS "Número da Transportadora",
    t.cidade AS "Cidade da Transportadora",
    t.estado AS "Estado da Transportadora"
FROM
    pedidos p
JOIN
    entregam e ON p.idPedido = e.idPedido
JOIN
    transportadoras t ON e.idTransportadoras = t.idTransportadoras;

SELECT * FROM vw_pedidos_transportadoras;


-- View para exibir pedidos e o funcionário responsável
CREATE VIEW vw_pedidos_funcionarios AS
SELECT
    p.idPedido,
    p.Data,
    p.Status,
    f.idFuncionario,
    f.nome AS "Nome do Funcionário",
    f.cargo AS "Cargo do Funcionário",
    f.departamento AS "Departamento do Funcionário"
FROM
    pedidos p
JOIN
    funcionarios f ON p.idFuncionario = f.idFuncionario;

SELECT * FROM vw_pedidos_funcionarios;
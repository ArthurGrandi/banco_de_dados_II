-- CONSULTAS SELECT VIEW

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
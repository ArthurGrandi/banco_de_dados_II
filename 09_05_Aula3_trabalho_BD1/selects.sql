-- CONSULTAS SELECT JOIN


-- Listar Pedidos associando nome, data, itens do pedido e preço

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
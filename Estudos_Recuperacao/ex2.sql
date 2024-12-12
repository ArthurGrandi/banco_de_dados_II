CREATE VIEW v_pedidos AS 
SELECT
    p.num_pedido,
    p.data,
    c.nome,
    pr.descricao,
    ip.quantidade
FROM
    pedidos p
JOIN
    clientes c ON p.id_cliente = c.id_cliente
JOIN
    itens_pedido ip ON p.num_pedido = ip.num_pedido
JOIN
    produtos pr ON ip.idProduto = pr.idProduto;
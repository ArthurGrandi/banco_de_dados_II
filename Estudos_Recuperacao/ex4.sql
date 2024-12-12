CREATE VIEW v_faturamento AS
SELECT 
    p.data,
    COUNT(p.num_pedido) AS numero_pedidos,
    SUM(pr.preco * ip.quantidade) AS valor_total
FROM 
    pedidos p
JOIN 
    itens_pedido ip ON p.num_pedido = ip.num_pedido
JOIN 
    produtos pr ON ip.idProduto = pr.idProduto
GROUP BY 
    p.data;

SELECT 
    data,
    numero_pedidos,
    valor_total
FROM 
    v_faturamento
WHERE 
    data BETWEEN '2023-01-01' AND '2023-12-31';
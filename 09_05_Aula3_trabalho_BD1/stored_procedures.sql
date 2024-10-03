----- CODIGOS STORED PROCEDURES

---  INSERIR CLIENTE
CREATE OR REPLACE FUNCTION inserir_cliente(
    p_nome dNome,
    p_telefone dTelefone,
    p_logradouro dLougradouro,
    p_numero dNumero,
    p_cidade dCidade,
    p_bairro dBairro,
    p_complemento dComplemento,
    p_estado dEstado
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO clientes (nome, telefone, logradouro, numero, cidade, bairro, complemento, estado)
    VALUES (p_nome, p_telefone, p_logradouro, p_numero, p_cidade, p_bairro, p_complemento, p_estado);
END;
$$ LANGUAGE plpgsql;

--- ATUALIZAR CLIENTE
CREATE OR REPLACE FUNCTION atualizar_cliente(
    p_idCliente INTEGER,
    p_nome dNome,
    p_telefone dTelefone,
    p_logradouro dLougradouro,
    p_numero dNumero,
    p_cidade dCidade,
    p_bairro dBairro,
    p_complemento dComplemento,
    p_estado dEstado
)
RETURNS VOID AS $$
BEGIN
    UPDATE clientes
    SET nome = p_nome,
        telefone = p_telefone,
        logradouro = p_logradouro,
        numero = p_numero,
        cidade = p_cidade,
        bairro = p_bairro,
        complemento = p_complemento,
        estado = p_estado
    WHERE idCliente = p_idCliente;
END;
$$ LANGUAGE plpgsql;

---  EXCLUIR CLIENTE

CREATE OR REPLACE FUNCTION excluir_cliente(
    p_idCliente INTEGER
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM clientes WHERE idCliente = p_idCliente;
END;
$$ LANGUAGE plpgsql;

--- INSERIR PEDIDO

CREATE OR REPLACE FUNCTION inserir_pedido(
    p_data DATE,
    p_status VARCHAR(15),
    p_idCliente INTEGER,
    p_idFuncionario INTEGER
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO pedidos (Data, Status, idCliente, idFuncionario)
    VALUES (p_data, p_status, p_idCliente, p_idFuncionario);
END;
$$ LANGUAGE plpgsql;

---  ATUALIZAR PEDIDO

CREATE OR REPLACE FUNCTION atualizar_pedido(
    p_idPedido INTEGER,
    p_data DATE,
    p_status VARCHAR(15),
    p_idCliente INTEGER,
    p_idFuncionario INTEGER
)
RETURNS VOID AS $$
BEGIN
    UPDATE pedidos
    SET Data = p_data,
        Status = p_status,
        idCliente = p_idCliente,
        idFuncionario = p_idFuncionario
    WHERE idPedido = p_idPedido;
END;
$$ LANGUAGE plpgsql;

--- EXCLUIR PEDIDO

CREATE OR REPLACE FUNCTION excluir_pedido(
    p_idPedido INTEGER
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM pedidos WHERE idPedido = p_idPedido;
END;
$$ LANGUAGE plpgsql;

---  CONSULTAR  PEDIDOS POR CLIENTE

CREATE OR REPLACE FUNCTION consultar_pedidos_por_cliente(
    p_idCliente INTEGER
)
RETURNS TABLE(idPedido INTEGER, Data DATE, Status VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT p.idPedido, p.Data, p.Status
    FROM pedidos p
    WHERE p.idCliente = p_idCliente
    ORDER BY p.Data;
END;
$$ LANGUAGE plpgsql;
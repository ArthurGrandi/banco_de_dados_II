----- CODIGOS FUNCTION

---  INSERIR CLIENTE
CREATE OR REPLACE FUNCTION inserir_cliente(           
    v_nome dNome,
    v_telefone dTelefone,
    v_logradouro dLogradouro,   
    v_numero dNumero,
    v_cidade dCidade,
    v_bairro dBairro,
    v_complemento dComplemento,
    v_estado dEstado
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO clientes (nome, telefone, logradouro, numero, cidade, bairro, complemento, estado)
    VALUES (v_nome, v_telefone, v_logradouro, v_numero, v_cidade, v_bairro, v_complemento, v_estado); -- Incluído v_idCliente no INSERT
END;
$$ LANGUAGE plpgsql;

--- ATUALIZAR CLIENTE
CREATE OR REPLACE FUNCTION atualizar_cliente(
    p_idCliente INTEGER,
    p_nome dNome,
    p_telefone dTelefone,
    p_logradouro dLogradouro,
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

--- INSERIR  PEDIDO

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

	CREATE OR REPLACE FUNCTION log_conclusao_pedido()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se o status do pedido inserido é "Concluído"
    IF NEW.status = 'Concluído' THEN
        -- Registro de mensagem no log para sinalizar que o pedido foi concluído
        RAISE NOTICE 'Pedido % foi concluído com sucesso para o cliente %', NEW.idPedido, NEW.idCliente;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criação da Trigger

CREATE TRIGGER trigger_conclusao_pedido
AFTER INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION log_conclusao_pedido();

INSERT INTO pedidos (idPedido, Data, Status, idCliente, idFuncionario)
VALUES (11, '2024-10-31', 'Concluído', 1, 2);
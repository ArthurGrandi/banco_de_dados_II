CREATE VIEW v_clientes AS
SELECT 
    id_cliente,
    nome,
    telefone,
    endereco,
    cidade
FROM 
    clientes
WITH CHECK OPTION;

INSERT INTO v_clientes (nome, telefone, endereco, cidade) VALUES
('João Silva', '48912345678', 'Rua das Flores, 123', 'Florianópolis'),
('Maria Oliveira', '48987654321', 'Avenida Brasil, 456', 'Balneário Camboriú'),
('Pedro Santos', '48965432109', 'Praça Central, 789', 'Joinville');
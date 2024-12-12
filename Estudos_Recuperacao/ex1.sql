-- Escreva o código SQL/DDL para criar as tabelas CLIENTE e UF. Use definições de DOMINIO para atributos que representam o mesmo contexto/semântica nas tabelas do diagrama e a cláusula SERIAL quando aplicável. [1 pt.] --

-- Definição de Domínios
CREATE DOMAIN dnome AS VARCHAR(100) NOT NULL; -- Nome padrão
CREATE DOMAIN duf AS CHAR(2) NOT NULL;        -- Estado (SP, RJ, etc.)

-- Tabela UF
CREATE TABLE UF (
    uf duf PRIMARY KEY,           -- Estado é chave primária
    descricao VARCHAR(100)        -- Descrição do estado
);

-- Tabela CLIENTE
CREATE TABLE CLIENTE (
    id_cliente SERIAL PRIMARY KEY,  -- Chave primária auto-incrementada
    nome dnome,                     -- Usando o domínio 'dnome'
    cpf CHAR(11),                   -- CPF com tamanho fixo
    cnpj CHAR(14),                  -- CNPJ com tamanho fixo
    municipio VARCHAR(100),         -- Município do cliente
    uf duf REFERENCES UF(uf)        -- Chave estrangeira referenciando UF
);
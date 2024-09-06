CREATE DOMAIN dNome as VARCHAR(50) NOT NULL;
CREATE DOMAIN dTelefone as VARCHAR(15) NOT NULL;
CREATE DOMAIN dLougradouro as VARCHAR(50) NOT NULL;
CREATE DOMAIN dNumero as VARCHAR(5) NOT NULL;
CREATE DOMAIN dCidade as VARCHAR(50) NOT NULL;
CREATE DOMAIN dBairro as VARCHAR(50) NOT NULL;
CREATE DOMAIN dComplemento as VARCHAR(30);
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
    idCliente INTEGER NOT NULL,
    Status VARCHAR(15) NOT NULL,
    idFuncionario INTEGER NOT NULL,
    FOREIGN KEY (IdFuncionario) REFERENCES FUNCIONÁRIOS(IdFuncionario) ON DELETE CASCADE,
    FOREIGN KEY (IdCliente) REFERENCES CLIENTES(IdCliente) ON DELETE CASCADE
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
    tamanho VARCHAR(15) NOT NULL,
    quantidade VARCHAR(4) NOT NULL,
    idItemPedido INTEGER PRIMARY KEY NOT NULL,
    idPedido INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    FOREIGN KEY (IdPedido) REFERENCES PEDIDOS(IdPedido) ON DELETE CASCADE,
    FOREIGN KEY (IdProduto) REFERENCES PRODUTOS(IdProduto) ON DELETE CASCADE
);

CREATE TABLE fornecem (
    idFornecedor INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    PRIMARY KEY (IdFornecedor, IdProduto),
    FOREIGN KEY (IdFornecedor) REFERENCES FORNECEDORES(IdFornecedor) ON DELETE CASCADE,
    FOREIGN KEY (IdProduto) REFERENCES PRODUTOS(IdProduto) ON DELETE CASCADE
);

CREATE TABLE entregam (
    idPedido INTEGER NOT NULL,
    idTransportadoras INTEGER NOT NULL,
    PRIMARY KEY (IdPedido, IdTransportadoras),
    FOREIGN KEY (IdPedido) REFERENCES PEDIDOS(IdPedido) ON DELETE CASCADE,
    FOREIGN KEY (IdTransportadoras) REFERENCES TRANSPORTADORAS(IdTransportadoras) ON DELETE CASCADE
);

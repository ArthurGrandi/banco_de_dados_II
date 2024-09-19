CREATE DOMAIN dNome as VARCHAR(50) NOT NULL;
CREATE DOMAIN dTelefone as VARCHAR(15) NOT NULL;
CREATE DOMAIN dLougradouro as VARCHAR(50) NOT NULL;
CREATE DOMAIN dNumero as VARCHAR(5) NOT NULL;
CREATE DOMAIN dCidade as VARCHAR(50) NOT NULL;
CREATE DOMAIN dBairro as VARCHAR(50) NOT NULL;
CREATE DOMAIN dComplemento as VARCHAR(50);
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
	Status VARCHAR(15) NOT NULL,
	idCliente INTEGER NOT NULL,
    idFuncionario INTEGER NOT NULL,
    FOREIGN KEY (idFuncionario) REFERENCES funcionarios (idFuncionario) ON DELETE CASCADE,
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente) ON DELETE CASCADE
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
	idItemPedido INTEGER PRIMARY KEY NOT NULL,
    tamanho VARCHAR(15) NOT NULL,
    quantidade DECIMAL(4) NOT NULL,
    idPedido INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES pedidos (idPedido) ON DELETE CASCADE,
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto) ON DELETE CASCADE
);

CREATE TABLE fornecem (
    idFornecedor INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    PRIMARY KEY (idFornecedor, idProduto),
    FOREIGN KEY (idFornecedor) REFERENCES fornecedores (idFornecedor) ON DELETE CASCADE,
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto) ON DELETE CASCADE
);

CREATE TABLE entregam (
    idPedido INTEGER NOT NULL,
    idTransportadoras INTEGER NOT NULL,
    PRIMARY KEY (idPedido, IdTransportadoras),
    FOREIGN KEY (idPedido) REFERENCES pedidos (idPedido) ON DELETE CASCADE,
    FOREIGN KEY (idTransportadoras) REFERENCES transportadoras (idTransportadoras) ON DELETE CASCADE
);
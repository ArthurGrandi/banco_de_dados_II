-- DUMP
-- c:\pgdump -U postgres > bkp_nome.sql
-- c:\dropbc -U postgres nome_banco
-- c:\createdb -U postgres nome_banco
-- c:\psql -U postgres nome_banco > bkp_nome.sql

CREATE OR REPLACE FUNCTION
soma ( a INTEGER, b INTEGER )
RETURNS INTEGER AS $$
DECLARE result INTEGER ;
BEGIN
result := a + b ;
RETURN result ;
END;
$$ LANGUAGE 'plpgsql';

CREATE TABLE itens_pedidos (
	idItemPedido INTEGER PRIMARY KEY NOT NULL,
    tamanho VARCHAR(15) NOT NULL,
    quantidade DECIMAL(4) NOT NULL,
    idPedido INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES pedidos (idPedido) ON DELETE CASCADE,
    FOREIGN KEY (idProduto) REFERENCES produtos (idProduto) ON DELETE CASCADE
);


-- Exercícios
-- 
--  Uma prática utilizada durante o desenvolvimento de aplicações que
-- interagem com BDs é a de definir procedimentos ou funções
-- responsáveis pela inclusão, alteração e exclusão de registros.
 
--  Para as tabelas de Ambulatorios, Funcionarios, Doencas e
-- Pacientes, crie funções que atendam a essas operações,
-- respeitando as seguintes regras:
 
-- a) no caso de inclusões, a função deve retornar a chave primária do novo registro
-- como resultado;
 
-- b) no caso de alterações, a chave primária cujo registro deve ser modificado deve
-- ser passada como parâmetro (juntamente com os dados a serem modificados no
-- registro). O retorno dessa função deve ser nulo;
 
-- c) no caso de exclusões, a chave primária cujo registro deve ser removido deve ser
-- passada como parâmetro. O retorno dessa função deve ser nulo.

class Ambulatorio:
    def __init__(self, id, nome):
        self.id = id
        self.nome = nome

class Funcionario:
    def __init__(self, id, nome, cargo):
        self.id = id
        self.nome = nome
        self.cargo = cargo

class Doenca:
    def __init__(self, id, nome):
        self.id = id
        self.nome = nome

class Paciente:
    def __init__(self, id, nome, cpf):
        self.id = id
        self.nome = nome
        self.cpf = cpf

-- Simulando tabelas com listas
ambulatorios = []
funcionarios = []
doencas = []
pacientes = []

-- Funções para as operações

def incluir_ambulatorio(nome):
    novo_id = len(ambulatorios) + 1
    novo_ambulatorio = Ambulatorio(novo_id, nome)
    ambulatorios.append(novo_ambulatorio)
    return novo_id

def alterar_ambulatorio(id, novo_nome):
    for amb in ambulatorios:
        if amb.id == id:
            amb.nome = novo_nome
            return
    return None

def excluir_ambulatorio(id):
    global ambulatorios
    ambulatorios = [amb for amb in ambulatorios if amb.id != id]

def incluir_funcionario(nome, cargo):
    novo_id = len(funcionarios) + 1
    novo_funcionario = Funcionario(novo_id, nome, cargo)
    funcionarios.append(novo_funcionario)
    return novo_id

def alterar_funcionario(id, novo_nome, novo_cargo):
    for func in funcionarios:
        if func.id == id:
            func.nome = novo_nome
            func.cargo = novo_cargo
            return
    return None

def excluir_funcionario(id):
    global funcionarios
    funcionarios = [func for func in funcionarios if func.id != id]

def incluir_doenca(nome):
    novo_id = len(doencas) + 1
    nova_doenca = Doenca(novo_id, nome)
    doencas.append(nova_doenca)
    return novo_id

def alterar_doenca(id, novo_nome):
    for doenca in doencas:
        if doenca.id == id:
            doenca.nome = novo_nome
            return
    return None

def excluir_doenca(id):
    global doencas
    doencas = [doenca for doenca in doencas if doenca.id != id]

def incluir_paciente(nome, cpf):
    novo_id = len(pacientes) + 1
    novo_paciente = Paciente(novo_id, nome, cpf)
    pacientes.append(novo_paciente)
    return novo_id

def alterar_paciente(id, novo_nome, novo_cpf):
    for paciente in pacientes:
        if paciente.id == id:
            paciente.nome = novo_nome
            paciente.cpf = novo_cpf
            return
    return None

def excluir_paciente(id):
    global pacientes
    pacientes = [paciente for paciente in pacientes if paciente.id != id]

-- Exemplos de uso
id_amb = incluir_ambulatorio("Ambulatório Central")
print(f"Ambulatório incluído com ID: {id_amb}")
alterar_ambulatorio(id_amb, "Ambulatório Atualizado")

id_func = incluir_funcionario("Maria", "Enfermeira")
print(f"Funcionário incluído com ID: {id_func}")
excluir_funcionario(id_func)

id_doenca = incluir_doenca("Gripe")
print(f"Doença incluída com ID: {id_doenca}")

id_paciente = incluir_paciente("João da Silva", "123.456.789-00")
print(f"Paciente incluído com ID: {id_paciente}")
alterar_paciente(id_paciente, "João da Silva Neto", "123.456.789-01")
excluir_paciente(id_paciente)

--
-- Exercícios
-- 
-- Crie uma função que realiza o agendamento de
-- uma Consulta.

-- A função deve receber o nome e o CPF do paciente, a
-- data e a hora da consulta e o CPF do médico.

-- Caso o paciente não esteja cadastrado, a função deve
-- inserir o paciente.

class Paciente:
    def __init__(self, nome, cpf):
        self.nome = nome
        self.cpf = cpf

class Medico:
    def __init__(self, nome, cpf):
        self.nome = nome
        self.cpf = cpf

class Consulta:
    def __init__(self, paciente, data_hora, medico):
        self.paciente = paciente
        self.data_hora = data_hora
        self.medico = medico

-- Lista para armazenar pacientes e consultas
pacientes = []
consultas = []

def cadastrar_paciente(nome, cpf):
    -- Verifica se o paciente já está cadastrado
    for paciente in pacientes:
        if paciente.cpf == cpf:
            return paciente
    -- Se não estiver cadastrado, cria e adiciona um novo paciente
    novo_paciente = Paciente(nome, cpf)
    pacientes.append(novo_paciente)
    return novo_paciente

def agendar_consulta(nome_paciente, cpf_paciente, data_hora, cpf_medico):
    -- Cadastra o paciente se necessário
    paciente = cadastrar_paciente(nome_paciente, cpf_paciente)
    
    -- Aqui você deve incluir a lógica para verificar se o médico existe
    -- Para simplificar, vamos assumir que o médico é válido
    medico = Medico("Dr. Exemplo", cpf_medico)  -- Substitua pelo objeto real do médico

    -- Cria e armazena a consulta
    nova_consulta = Consulta(paciente, data_hora, medico)
    consultas.append(nova_consulta)
    return nova_consulta

-- Exemplo de uso
consulta_agendada = agendar_consulta("João da Silva", "123.456.789-00", "2024-10-01 15:00", "987.654.321-00")
print(f"Consulta agendada para {consulta_agendada.paciente.nome} em {consulta_agendada.data_hora} com o médico {consulta_agendada.medico.nome}.")

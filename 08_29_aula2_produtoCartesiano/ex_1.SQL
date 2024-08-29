-- DRIVE DA AULA -- 
https://drive.google.com/drive/folders/1F-diTPUdJ_MPM1UyW4VDHQepi198nKnA

/*
Consulta em mais de uma tabela

produto cartesiano

Restrições de integridade ou RI
RI = PK -> FK
*/

- SQL - Select 
- SQL DML
- SQL DQL

SELECT * 
FROM A, B
WHERE A.PK = B.FK
ORDER BY .... descendente ;
GROUP BY ....;
HAVING ....;
LIMIT ....;

exemplo:

SELECT a.nome AS Aluno, d.disciplina AS Disciplina
    FROM alunos a,
    matricula m,
    disciplina d
    WHERE a.matricula - m.matricula AND
    m.id_disciplina = d.id_disciplina;

/*
MODELO CONCEITUAL TEM IDENTIFICADORES, RELACIONAMENTOS E ATRIBUTOS

MODELO RELACIONAL TEM TABELAS, CHAVES PRIMARIAS E ESTRANGEIRAS
*/

-------COMENTARIO---------
--assim q faz

funcionarios 1000 - dependentes 2000

qual o numero maximo para uma consulta de todos os funcionarios que tem dependentes? 1000

/*
assim 
tbm 
funciona
*/


-- toda especialização herda os atributos da sua generalização

/*
TIPOS DE ESPECIALIZAÇÃO

- Compartilhada
- Exclusiva
- Total
- Parcial
*/

Existem tres formas de adaptar uma especialização do conceitual para o lógico

colocar todos na mesma tabela generalizada
criar tabelas apenas para as especializações
criar tabelas para a generalização e para as especializações

----------

Junções (JOIN)

inner JOIN
full JOIN
left JOIN
right JOIN
natural JOIN

SELECT <select_list> 
  FROM tabA A
  INNER JOIN tabB B
  ON A.Key = B.Key

--Exemplo INNER JOIN:
SELECT a.nome AS Aluno, d.disciplina AS Disciplina
  FROM alunos a
  JOIN matricula m
    ON a.matricula = m.matricula
  JOIN disciplina d
    ON m.id_disciplina = d.id_disciplina;

--------------

--Exemplo NATURAL JOIN:
SELECT a.nome AS Aluno, d.disciplina AS
Disciplina

FROM alunos a

NATURAL JOIN matricula m
NATURAL JOIN disciplina d ;
/*
Claro! Em modelagem de dados, especialmente em diagramas de entidade-relacionamento e em modelagem de banco de dados, a especialização é uma técnica usada para definir diferentes subtipos dentro de um tipo mais geral (ou supertipo). Aqui estão as diferenças entre cada tipo de especialização:

1. **Especialização Compartilhada**:
   - **Descrição**: Neste tipo, um supertipo pode ter vários subtipos e cada instância do supertipo pode pertencer a um ou mais subtipos simultaneamente. 
   - **Exemplo**: Imagine uma entidade "Veículo" que pode ser especializada em "Carro" e "Caminhão". Se um veículo pode ser tanto um carro quanto um caminhão (talvez um veículo modificado para usos diferentes), então a especialização seria compartilhada.
   - **Características**: 
     - Uma instância do supertipo pode pertencer a mais de um subtipo.
     - Cada subtipo não precisa ser mutuamente exclusivo.

2. **Especialização Exclusiva**:
   - **Descrição**: Aqui, cada instância do supertipo deve pertencer a exatamente um subtipo. Os subtipos são mutuamente exclusivos.
   - **Exemplo**: Considere a entidade "Pessoa" com subtipos "Aluno" e "Professor". Cada pessoa é apenas um aluno ou um professor, mas não ambos.
   - **Características**:
     - Cada instância do supertipo está associada a apenas um subtipo.
     - Os subtipos são disjuntos, ou seja, não há sobreposição.

3. **Especialização Total**:
   - **Descrição**: Em uma especialização total, todas as instâncias do supertipo devem pertencer a um subtipo. Não há instâncias do supertipo que não sejam instâncias de algum subtipo.
   - **Exemplo**: Suponha a entidade "Animal" com os subtipos "Mamífero" e "Aves". Se cada animal deve ser classificado como um mamífero ou uma ave, então a especialização é total.
   - **Características**:
     - Não existem instâncias do supertipo que não pertencem a algum subtipo.
     - Todos os elementos do supertipo estão cobertos pelos subtipos.

4. **Especialização Parcial**:
   - **Descrição**: Aqui, nem todas as instâncias do supertipo precisam pertencer a um subtipo. Algumas instâncias podem não se encaixar em nenhum dos subtipos definidos.
   - **Exemplo**: Considere a entidade "Funcionário" com subtipos "Gerente" e "Assistente". Se há funcionários que não se encaixam como gerente nem assistente, então a especialização é parcial.
   - **Características**:
     - Há instâncias do supertipo que não pertencem a nenhum subtipo.
     - Os subtipos são opcionais, e algumas instâncias podem não ser especializadas.

Esses conceitos ajudam a estruturar e organizar dados de maneira eficaz, permitindo uma melhor representação e manipulação das informações no banco de dados.
*/

/*
As **restrições de integridade** são regras que garantem a precisão, consistência e validade dos dados em um banco de dados. Elas desempenham um papel crucial no gerenciamento de dados e ajudam a manter a qualidade e a confiança nos dados armazenados. Aqui estão os principais tipos de restrições de integridade que você pode encontrar:

### 1. **Integridade de Entidade**
- **Descrição**: Garante que cada entidade (ou linha) em uma tabela seja identificada de forma única.
- **Exemplo**: A restrição de chave primária assegura que cada registro em uma tabela tenha um identificador único. Por exemplo, um número de matrícula de um aluno deve ser único em uma tabela de alunos.
- **Implementação**: A chave primária é usada para identificar exclusivamente cada linha em uma tabela, e não pode haver valores nulos ou duplicados nesta coluna.

### 2. **Integridade Referencial**
- **Descrição**: Assegura que as relações entre tabelas permaneçam consistentes. Quando uma tabela (tabela filha) tem uma chave estrangeira que refere-se a uma chave primária em outra tabela (tabela pai), essa relação deve ser válida.
- **Exemplo**: Se uma tabela de "Pedidos" faz referência a uma tabela de "Clientes" através de uma chave estrangeira, a integridade referencial garante que cada pedido esteja associado a um cliente válido. Não é permitido criar um pedido com um cliente que não existe.
- **Implementação**: É comum utilizar chaves estrangeiras para manter essas relações, e restrições como "ON DELETE CASCADE" ou "ON UPDATE RESTRICT" para definir o comportamento quando o registro na tabela pai é alterado ou excluído.

### 3. **Integridade de Domínio**
- **Descrição**: Garante que os valores armazenados em uma coluna estejam dentro de um conjunto válido de valores. Define o tipo e o formato dos dados que podem ser armazenados.
- **Exemplo**: Uma coluna "Idade" em uma tabela de funcionários deve aceitar apenas valores numéricos inteiros dentro de uma faixa específica, como 0 a 120 anos.
- **Implementação**: É controlada por tipos de dados e restrições de verificação (CHECK constraints), que garantem que os dados atendam aos critérios definidos.

### 4. **Integridade de Usuario**
- **Descrição**: Refere-se a regras específicas de negócios que podem ser implementadas para garantir que os dados atendam a requisitos específicos da aplicação.
- **Exemplo**: Uma regra pode exigir que o "Salário" de um funcionário não seja menor que o salário mínimo estabelecido pela empresa ou que a "Data de Fim do Contrato" não possa ser anterior à "Data de Início do Contrato".
- **Implementação**: Geralmente implementada usando restrições de verificação (CHECK constraints) ou triggers (gatilhos) para garantir que as regras de negócios sejam respeitadas.

### 5. **Integridade de Tabela**
- **Descrição**: Relacionada à estrutura e às regras internas da tabela, como a definição de chaves primárias, chaves estrangeiras e restrições de unicidade.
- **Exemplo**: Uma restrição de unicidade garante que valores em uma coluna ou conjunto de colunas sejam únicos em toda a tabela.
- **Implementação**: Usando restrições como UNIQUE, que impede a inserção de valores duplicados na coluna especificada.

### **Exemplos de Implementação Prática:**

- **Chave Primária**:
  ```sql
  CREATE TABLE Alunos (
      Matricula INT PRIMARY KEY,
      Nome VARCHAR(100)
  );
  ```

- **Chave Estrangeira**:
  ```sql
  CREATE TABLE Pedidos (
      PedidoID INT PRIMARY KEY,
      ClienteID INT,
      FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
  );
  ```

- **Restrição de Domínio (CHECK)**:
  ```sql
  CREATE TABLE Funcionarios (
      ID INT PRIMARY KEY,
      Nome VARCHAR(100),
      Idade INT CHECK (Idade >= 0 AND Idade <= 120)
  );
  ```

- **Restrição de Unicidade**:
  ```sql
  CREATE TABLE Produtos (
      CodigoProduto INT UNIQUE,
      NomeProduto VARCHAR(100)
  );
  ```

Essas restrições são essenciais para garantir que o banco de dados funcione corretamente e mantenha a integridade dos dados ao longo do tempo.
*/
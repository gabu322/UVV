/*Inicio da criaçao de tabelas*/
DROP TABLE IF EXISTS empregados, regioes, paises, departamentos, localizacoes, cargos, historico_cargos;

/*Criação da tabela empregados com restrições básicas*/
CREATE TABLE empregados(
    id_empregado INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(75) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    data_contratacao DATE NOT NULL,
    id_cargo VARCHAR(10) NOT NULL, /*FK cargos*/
    salario DECIMAL(8, 2),
    comissao DECIMAL(4, 2),
    id_supervisor INTEGER, /*FK empregados*/
    id_departamento INTEGER /*FK departamentos*/
);

/*Criação da tabela regioes com restrições básicas*/
CREATE TABLE regioes(
    id_regiao INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(25) NOT NULL UNIQUE
);

/*Criação da tabela paises com restrições básicas*/
CREATE TABLE paises(
    id_pais CHAR(2) NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    id_regiao INTEGER /*FK regioes*/
);

/*Criação da tabela localizacoes com restrições básicas*/
CREATE TABLE localizacoes(
    id_localizacao INTEGER NOT NULL PRIMARY KEY,
    endereco VARCHAR(50),
    cep VARCHAR(12),
    cidade VARCHAR(50),
    uf VARCHAR(25),
    id_pais CHAR(2) /*FK paises*/
);

/*Criação da tabela departamentos com restrições básicas*/
CREATE TABLE departamentos(
    id_departamento INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE,
    id_gerente INTEGER, /*FK empregados*/
    id_localizacao INTEGER /*FK localizacoes*/
);

/*Criação da tabela cargos com restrições básicas*/
CREATE TABLE cargos(
    id_cargo VARCHAR(10) NOT NULL PRIMARY KEY,
    cargo VARCHAR(35) NOT NULL UNIQUE,
    salario_minimo DECIMAL(8, 2),
    salario_maximo DECIMAL(8, 2)
);

/*Criação da tabela historico_cargos com restrições básicas*/
CREATE TABLE historico_cargos(
    id_empregado INTEGER NOT NULL, /*FK empregados*/
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    id_cargo VARCHAR NOT NULL, /*FK cargos*/
    id_departamento INTEGER, /*FK departamentos*/
    PRIMARY KEY (id_empregado,data_inicial)
);



/*Início da adição de comentários*/
/*Comentários da tabela empregados:*/
COMMENT ON TABLE empregados IS 'Tabela que contém todas as informações dos empregados.';
COMMENT ON COLUMN empregados.id_empregado IS 'Chave primária de identificação dos empregados.';
COMMENT ON COLUMN empregados.nome IS 'Nome do empregado.';
COMMENT ON COLUMN empregados.email IS 'Endereço de email do empregado.';
COMMENT ON COLUMN empregados.telefone IS 'Telefone do empregado.';
COMMENT ON COLUMN empregados.data_contratacao IS 'Data de contratação do empregado.';
COMMENT ON COLUMN empregados.id_cargo IS 'Chave estrangeira que indica o cargo atual do empregado.';
COMMENT ON COLUMN empregados.salario IS 'Salário mensal do empregado.';
COMMENT ON COLUMN empregados.comissao IS 'Comissão em porcentagem do empregado (nem todos os setores possuem comissão).';
COMMENT ON COLUMN empregados.id_departamento IS 'Chave estrangeira que indica o departamento do empregado.';
COMMENT ON COLUMN empregados.id_supervisor IS 'Chave estrangeira para a própria tabela que indica o supervisor (que também é um empregado).';

/*Comentários da tabela regioes*/
COMMENT ON TABLE regioes IS 'Tabela que contém todas as informações das regiões.';
COMMENT ON COLUMN regioes.id_regiao IS 'Chave primária de identificação das regiões.';
COMMENT ON COLUMN regioes.nome IS 'Nome das regiões.';

/*Comentários da tabela paises*/
COMMENT ON TABLE paises IS 'Tabela que contém as informações sobre os países.';
COMMENT ON COLUMN paises.id_pais IS 'Chave primária de identificação dos países.';
COMMENT ON COLUMN paises.nome IS 'Chave única para indicar o nome do país.';
COMMENT ON COLUMN paises.id_regiao IS 'Chave primária de identificação das regiões.';
/*Comentários da tabela localizacoes*/
COMMENT ON TABLE localizacoes IS 'Tabela que contém as informações sobre as localizações dos departamentos.';
COMMENT ON COLUMN localizacoes.endereco IS 'Coluna que indica o endereço(logadouro e número) do local da empresa.';
COMMENT ON COLUMN localizacoes.cep IS 'CEP do local da empresa.';
COMMENT ON COLUMN localizacoes.cidade IS 'Cidade do local da empresa.';
COMMENT ON COLUMN localizacoes.uf IS 'Estado (unidade federal) do local da empresa.';
COMMENT ON COLUMN localizacoes.id_pais IS 'Chave estrangeira que indica o país que está o local da empresa.';

/*Comentários da tabela departamentos*/
COMMENT ON TABLE departamentos IS 'Tabela que contém as informações de cada departamento da empresa.';
COMMENT ON COLUMN departamentos.id_departamento IS 'Chave primária de identificação dos departamentos.';
COMMENT ON COLUMN departamentos.nome IS 'Nome do departamento.';
COMMENT ON COLUMN departamentos.id_gerente IS 'Chave estrangeira para a identificação do gerente do departamento.';

/*Comentários da tabela cargos*/
COMMENT ON TABLE cargos IS 'Tabela que contém as informações dos cargos (salário mínimo e máximo).';
COMMENT ON COLUMN cargos.id_cargo IS 'Chave primária de identificação dos cargos.';
COMMENT ON COLUMN cargos.cargo IS 'Nome do cargo.';
COMMENT ON COLUMN cargos.salario_minimo IS 'Salário mínimo do cargo.';
COMMENT ON COLUMN cargos.salario_maximo IS 'Salário máximo do cargo.';

/*Comentários da tabela historico_cargos*/
COMMENT ON TABLE historico_cargos IS 'Tabela que contém a informação sobre o histórico de cargos dos empregados entre os departamentos.';
COMMENT ON COLUMN historico_cargos.id_empregado IS 'Chave primária estrangeira que indica o histórico do cargo dos empregados.';
COMMENT ON COLUMN historico_cargos.data_inicial IS 'Chave primária que indica a data de início do cargo.';
COMMENT ON COLUMN historico_cargos.data_final IS 'Data de finalização do cargo.';
COMMENT ON COLUMN historico_cargos.id_cargo IS 'Chave estrangeira que indica o cargo que foi alterado.';
COMMENT ON COLUMN historico_cargos.id_departamento IS 'Chave estrangeira para a identificação do departamento.';

\i inserting.sql;
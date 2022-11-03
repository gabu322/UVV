CREATE TABLE empregados(
    id_empregado INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(75) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    data_contratacao DATE NOT NULL,
    id_cargo VARCHAR(10) NOT NULL,
    salario DECIMAL(8, 2),
    comissao DECIMAL(4, 2),
    id_departamento INTEGER,
    id_supervisor INTEGER
);

CREATE TABLE regioes(
    id_regiao INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE paises(
    id_pais CHAR(2) NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    id_regiao INTEGER REFERENCES regioes(id_regiao)
);

CREATE TABLE localizacoes(
    id_localizacao INTEGER NOT NULL PRIMARY KEY,
    endereco VARCHAR(50),
    cep VARCHAR(12),
    cidade VARCHAR(50),
    uf VARCHAR(25),
    id_pais CHAR(2) REFERENCES paises(id_pais)
);

CREATE TABLE departamentos(
    id_departamento INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE,
    id_localizacao INTEGER REFERENCES localizacoes(id_localizacao),
    id_gerente INTEGER REFERENCES empregados(id_empregado)
);

CREATE TABLE cargos(
    id_cargo VARCHAR(10) NOT NULL PRIMARY KEY,
    cargo VARCHAR(35) NOT NULL UNIQUE,
    salario_minimo DECIMAL(8, 2),
    salario_maximo DECIMAL(8, 2)
);

CREATE TABLE historico_cargos(
    id_empregado INTEGER NOT NULL PRIMARY KEY, 
    /*data_inicial DATE NOT NULL PRIMARY KEY,*/
    data_final DATE NOT NULL,
    id_cargo VARCHAR NOT NULL REFERENCES cargos(id_cargo),
    id_departamento INTEGER REFERENCES departamentos(id_departamento)
);
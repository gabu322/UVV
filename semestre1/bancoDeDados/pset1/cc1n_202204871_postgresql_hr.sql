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
    id_regiao INTEGER 
);

CREATE TABLE localizacoes(
    id_localizacao INTEGER NOT NULL PRIMARY KEY,
    endereco VARCHAR(50),
    cep VARCHAR(12),
    cidade VARCHAR(50),
    uf VARCHAR(25),
    id_pais CHAR(2)
);

CREATE TABLE departamentos(
    id_departamento INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE,
    id_localizacao INTEGER,
    id_gerente INTEGER
);

CREATE TABLE cargos(
    id_cargo VARCHAR(10) NOT NULL PRIMARY KEY,
    cargo VARCHAR(35) NOT NULL UNIQUE,
    salario_minimo DECIMAL(8, 2),
    salario_maximo DECIMAL(8, 2)
);

CREATE TABLE historico_cargos(
    id_empregado INTEGER NOT NULL, 
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    id_cargo VARCHAR NOT NULL,
    id_departamento INTEGER,
    PRIMARY KEY (id_empregado,data_inicial)
);

ALTER TABLE empregados
    ADD FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo);
ALTER TABLE empregados
    ADD FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento);
ALTER TABLE empregados
    ADD FOREIGN KEY (id_supervisor) REFERENCES empregados(id_empregado);
    

ALTER TABLE paises
    ADD FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao);

ALTER TABLE localizacoes
    ADD FOREIGN KEY (id_pais) REFERENCES paises(id_pais);

ALTER TABLE departamentos
    ADD FOREIGN KEY (id_localizacao) REFERENCES localizacoes(id_localizacao);
ALTER TABLE departamentos
    ADD FOREIGN KEY (id_gerente) REFERENCES empregados(id_empregado);
    
ALTER TABLE historico_cargos
    ADD FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo);
ALTER TABLE historico_cargos
    ADD FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento);


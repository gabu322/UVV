STR_TO_DATE('07,06,2002', '%d,%m,%Y')

CREATE DATABASE uvv;
use uvv;
CREATE TABLE regioes (
                id_regiao INT NOT NULL,
                nome VARCHAR(25) NOT NULL,
                PRIMARY KEY (id_regiao)
);

ALTER TABLE regioes COMMENT 'Tabela com número e o nome das regiões.';

ALTER TABLE regioes MODIFY COLUMN id_regiao INTEGER COMMENT 'Representa a Chave Primária das regiões';

ALTER TABLE regioes MODIFY COLUMN nome VARCHAR(25) COMMENT 'Indica o nome das Regiões.';


CREATE UNIQUE INDEX regioes_idx
 ON regioes
 ( nome );

CREATE TABLE paises (
                id_pais CHAR(2) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_regiao INT,
                PRIMARY KEY (id_pais)
);

ALTER TABLE paises COMMENT 'Tabela com informações dos países.';

ALTER TABLE paises MODIFY COLUMN id_pais CHAR(2) COMMENT 'Representa a Chave Primária da tabela páises';

ALTER TABLE paises MODIFY COLUMN nome VARCHAR(50) COMMENT 'Indica o nome do país';

ALTER TABLE paises MODIFY COLUMN id_regiao INTEGER COMMENT 'Representa a FK para a tabela regiões.';


CREATE UNIQUE INDEX paises_idx
 ON paises
 ( nome );

CREATE TABLE localizacoes (
                id_localizacao INT NOT NULL,
                endereco VARCHAR(50),
                cep VARCHAR(12),
                cidade VARCHAR(50),
                uf VARCHAR(25),
                id_pais CHAR(2),
                PRIMARY KEY (id_localizacao)
);

ALTER TABLE localizacoes COMMENT 'localização dos escritórios que trabalham os empregados.';

ALTER TABLE localizacoes MODIFY COLUMN id_localizacao INTEGER COMMENT 'Representa a Chave Primária da tabela';

ALTER TABLE localizacoes MODIFY COLUMN endereco VARCHAR(50) COMMENT 'Endereço com Logradouro e nº de um escritório da empresa';

ALTER TABLE localizacoes MODIFY COLUMN cep VARCHAR(12) COMMENT 'CEP do endereço do escritório ou facilidade da empresa.';

ALTER TABLE localizacoes MODIFY COLUMN cidade VARCHAR(50) COMMENT 'Cidade';

ALTER TABLE localizacoes MODIFY COLUMN uf VARCHAR(25) COMMENT 'Estado (sigla ou de forma extensa.';

ALTER TABLE localizacoes MODIFY COLUMN id_pais CHAR(2) COMMENT 'Representa a Chave Estrangeira para a tabela países';


CREATE TABLE cargos (
                id_cargo VARCHAR(10) NOT NULL,
                cargo VARCHAR(35) NOT NULL,
                salario_minimo DECIMAL(8,2),
                salario_maximo DECIMAL(8,2),
                PRIMARY KEY (id_cargo)
);

ALTER TABLE cargos COMMENT 'Tabela responsável por armazenar os cargos que existem no período atual da empresa e o salário mínimo e máximo de cada cargo.';

ALTER TABLE cargos MODIFY COLUMN id_cargo VARCHAR(10) COMMENT 'Representa a PK da tabela';

ALTER TABLE cargos MODIFY COLUMN cargo VARCHAR(35) COMMENT 'Indica o nome do Cargo.';

ALTER TABLE cargos MODIFY COLUMN salario_minimo DECIMAL(8, 2) COMMENT 'Indica o menor salário da empresa.';

ALTER TABLE cargos MODIFY COLUMN salario_maximo DECIMAL(8, 2) COMMENT 'O maior salário da empresa.';


CREATE UNIQUE INDEX cargos_idx
 ON cargos
 ( cargo );

CREATE TABLE departamentos (
                id_departamento INT NOT NULL,
                nome VARCHAR(50),
                id_localizacao INT NOT NULL,
                id_gerente INT,
                PRIMARY KEY (id_departamento)
);

ALTER TABLE departamentos COMMENT 'Tabela Departamentos da empresa';

ALTER TABLE departamentos MODIFY COLUMN id_departamento INTEGER COMMENT 'Representa a chave primária do departamento';

ALTER TABLE departamentos MODIFY COLUMN nome VARCHAR(50) COMMENT 'Nome dos departamentos';

ALTER TABLE departamentos MODIFY COLUMN id_localizacao INTEGER COMMENT 'Representa a Chave Primária da tabela';

ALTER TABLE departamentos MODIFY COLUMN id_gerente INTEGER COMMENT 'Chave estrangeira para a tabela de localizações.';


CREATE UNIQUE INDEX departamentos_idx
 ON departamentos
 ( nome );

CREATE TABLE empregados (
                id_empregados INT NOT NULL,
                nome VARCHAR(75) NOT NULL,
                email VARCHAR(35) NOT NULL,
                telefone VARCHAR(20),
                data_contratacao DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                salario DECIMAL(8,2),
                comissao DECIMAL(4,2),
                id_departamento INT,
                id_supervisor INT NOT NULL,
                PRIMARY KEY (id_empregados)
);

ALTER TABLE empregados COMMENT 'Informações dos empregados';

ALTER TABLE empregados MODIFY COLUMN id_empregados INTEGER COMMENT 'Representa Chave Primária do empregado';

ALTER TABLE empregados MODIFY COLUMN nome VARCHAR(75) COMMENT 'Nome e Sobrenome do colaborador';

ALTER TABLE empregados MODIFY COLUMN email VARCHAR(35) COMMENT 'E-mail do empregado sem o @';

ALTER TABLE empregados MODIFY COLUMN telefone VARCHAR(20) COMMENT 'telefone com espaço para o código referente a país e estado.';

ALTER TABLE empregados MODIFY COLUMN data_contratacao DATE COMMENT 'Começou a trabalhar em seu atual cargo.';

ALTER TABLE empregados MODIFY COLUMN id_cargo VARCHAR(10) COMMENT 'FK no relac.tab. cargos. Atual cargo do colaborador';

ALTER TABLE empregados MODIFY COLUMN salario DECIMAL(8, 2) COMMENT 'Valor do salário p/ mês do colaborador, em seu cargo atual.';

ALTER TABLE empregados MODIFY COLUMN comissao DECIMAL(4, 2) COMMENT 'Comissão do departamento de vendas recebe';

ALTER TABLE empregados MODIFY COLUMN id_departamento INTEGER COMMENT 'FK tab. de depart.,indica o atual do colaborador.';

ALTER TABLE empregados MODIFY COLUMN id_supervisor INTEGER COMMENT 'Um auto-relacionamento 
';


CREATE UNIQUE INDEX empregados_idx
 ON empregados
 ( email );

CREATE TABLE hsitorico_cargos (
                id_empregados INT NOT NULL,
                data_inicial DATE NOT NULL,
                data_final DATE NOT NULL,
                id_cargo VARCHAR(10) NOT NULL,
                id_departamento INT,
                PRIMARY KEY (id_empregados, data_inicial)
);

ALTER TABLE hsitorico_cargos COMMENT '"carreira" de um empregado dentro da empresa. 
';

ALTER TABLE hsitorico_cargos MODIFY COLUMN id_empregados INTEGER COMMENT 'Representa Chave Primária do empregado';

ALTER TABLE hsitorico_cargos MODIFY COLUMN data_inicial DATE COMMENT 'Data Inicial no atual cargo, <data_final';

ALTER TABLE hsitorico_cargos MODIFY COLUMN data_final DATE COMMENT 'Data Final(último dia trabalhado no cargo) >data_inicial.';

ALTER TABLE hsitorico_cargos MODIFY COLUMN id_cargo VARCHAR(10) COMMENT 'FK p/ tabela "cargos". Cargo trab. no passado.';

ALTER TABLE hsitorico_cargos MODIFY COLUMN id_departamento INTEGER COMMENT 'FK tab. depart. Empregado trabalhou algum dia.';


ALTER TABLE paises ADD CONSTRAINT regioes_paises_fk
FOREIGN KEY (id_regiao)
REFERENCES regioes (id_regiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE localizacoes ADD CONSTRAINT paises_localizacoes_fk
FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE hsitorico_cargos ADD CONSTRAINT cargos_hsitorico_cargos_fk
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE empregados ADD CONSTRAINT departamentos_empregados_fk
FOREIGN KEY (id_departamento)
REFERENCES departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE hsitorico_cargos ADD CONSTRAINT departamentos_hsitorico_cargos_fk
FOREIGN KEY (id_departamento)
REFERENCES departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE hsitorico_cargos ADD CONSTRAINT empregados_hsitorico_cargos_fk
FOREIGN KEY (id_empregados)
REFERENCES empregados (id_empregados)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE empregados ADD CONSTRAINT empregados_empregados_fk
FOREIGN KEY (id_supervisor)
REFERENCES empregados (id_empregados)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE departamentos ADD CONSTRAINT empregados_departamentos_fk
FOREIGN KEY (id_gerente)
REFERENCES empregados (id_empregados)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
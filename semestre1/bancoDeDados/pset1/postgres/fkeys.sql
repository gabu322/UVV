/*Início da criação das foreign keys*/

/*FKs da tabela empregados*/
/*FK de empregados em cargos da coluna 'id_cargo'*/
ALTER TABLE empregados
    ADD FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo);
/*FK de empregados em departamentos da coluna 'id_departamento'*/
ALTER TABLE empregados
    ADD FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento);
/*FK de empregados em empregados da coluna 'id_supervisor' em 'empregado'*/
ALTER TABLE empregados
    ADD FOREIGN KEY (id_supervisor) REFERENCES empregados(id_empregado);
    
/*FKs da tabela paises*/
/*FK de paises em regioes da coluna 'id_regiao'*/
ALTER TABLE paises
    ADD FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao);

/*FKs da tabela localizacoes*/
/*FK de localizacoes em paises da coluna 'id_pais'*/
ALTER TABLE localizacoes
    ADD FOREIGN KEY (id_pais) REFERENCES paises(id_pais);

/*FKs da tabela departamentos*/
/*FK de departamentos em localizacoes da coluna 'id_localizacao'*/
ALTER TABLE departamentos
    ADD FOREIGN KEY (id_localizacao) REFERENCES localizacoes(id_localizacao);
/*FK de departamentos em empregados da coluna 'id_gerente' em 'id_empregado'*/
ALTER TABLE departamentos ADD CONSTRAINT departamentos_gerente
    FOREIGN KEY (id_gerente) REFERENCES empregados(id_empregado);

/*FKs da tabela historico_cargos*/
/*FK de historico_cargos em cargos da coluna 'id_cargo'*/
ALTER TABLE historico_cargos
    ADD FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo);
/*FK de historico_cargos em departamentos da coluna 'id_departamento'*/
ALTER TABLE historico_cargos
    ADD FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento);
/*FK de historico_cargos em empregados da coluna 'id_empregado'*/
ALTER TABLE historico_cargos
    ADD FOREIGN KEY (id_empregado) REFERENCES empregados(id_empregado);


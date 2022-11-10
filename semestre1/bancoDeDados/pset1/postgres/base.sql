CREATE USER aluno SUPERUSER CREATEDB; 
\c postgres aluno;
CREATE DATABASE uvv; 
\c uvv aluno; 
CREATE SCHEMA hr; 
SET SEARCH_PATH TO hr, "$user", public;

\i cc1n_202204871_postgresql_hr.sql;
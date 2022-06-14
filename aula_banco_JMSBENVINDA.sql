/**
eliminando base de dados 
só executa se existir
*/
DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco; 
USE aula_banco; -- CRIANDO COMENTARIOS
CREATE TABLE estado (
id INT NOT NULL PRIMARY KEY 
,nome VARCHAR (200) NOT NULL UNIQUE -- CONTRAINT INLINE
,sigla CHAR (2) NOT NULL UNIQUE
,ativo CHAR (1) NOT NULL
,data_cadastro DATETIME NOT NULL 
,CHECK (ativo in ('s', 'n')) -- CONSTRAINT OUT OF LINE
,CONSTRAINT coluna_ativo_deve_ser_s_ou_n CHECK (ativo in ('s', 'n')) -- CONSTRAINT OUT OF LINE
);
INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (1, 'PARANÁ', 'PR', 'S', '2020-12-15');
INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (2, 'BAHIA', 'BA', 'S', '2020-12-15');
INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (3, 'SÃO PAULO', 'SP', 'N', '2020-12-15');
SELECT id, nome, sigla, ativo, data_cadastro FROM estado;
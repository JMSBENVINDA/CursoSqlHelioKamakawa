/**
eliminando base de dados 
só executa se existir
*/
DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco; 
USE aula_banco; -- CRIANDO COMENTARIOS
CREATE TABLE estado (
id INT NOT NULL auto_increment 
,nome VARCHAR (200) NOT NULL UNIQUE -- CONTRAINT INLINE
,sigla CHAR (2) NOT NULL UNIQUE
,ativo CHAR (1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
-- ,CHECK (ativo in ('s', 'n')) -- CONSTRAINT OUT OF LINE
,CONSTRAINT pk_estado primary key (id)
,CONSTRAINT estado_ativo_deve_ser_s_ou_n CHECK (ativo in ('S', 'N')) -- CONSTRAINT OUT OF LINE
);
-- INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (1, 'PARANÁ', 'PR', 'S', '2020-12-15');
-- INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (2, 'BAHIA', 'BA', 'S', '2020-12-15');
INSERT INTO estado (nome, sigla) VALUES ('SÃO PAULO', 'SP');
INSERT INTO estado (nome, sigla) VALUES ('Paraná', 'Pr');
ALTER TABLE estado DROP COLUMN nome;
SELECT id, nome, sigla, ativo, data_cadastro FROM estado;
CREATE TABLE cidade (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR (200) NOT NULL
,ativo CHAR (1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
, CONSTRAINT pk_cidade PRIMARY KEY (id)
, CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S' , 'N'))
,CONSTRAINT cidade_unica UNIQUE (nome, estado_id)
);
INSERT INTO cidade (nome, estado_id) VALUES ('Curitiba', 1);
ALTER TABLE estado ADD COLUMN regiao INT;
SELECT * FROM estado;
DESCRIBE estado;
ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100) NOT NULL;
ALTER TABLE estado DROP COLUMN regiao;
ALTER TABLE estado ADD COLUMN regiao VARCHAR(100) NOT NULL DEFAULT 'VALOR NÃO INFORMADO' AFTER sigla;
ALTER TABLE estado CHANGE regiao regiao_estado VARCHAR (100) NOT NULL;
ALTER TABLE estado CHANGE nome estado VARCHAR (200) NOT NULL;
ALTER TABLE estado DROP CONSTRAINT estado_ativo_deve_ser_s_ou_n;
ALTER TABLE estado MODIFY COLUMN ativo ENUM ('S','N') NOT NULL;
INSERT INTO estado (nome, sigla, ativo) VALUES ('MATO GROSSO', 'MT', 'S');

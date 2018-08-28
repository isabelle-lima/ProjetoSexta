CREATE DATABASE CONTROLEPONTO; 

USE CONTROLEPONTO;

CREATE TABLE UF (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    UF CHAR(2) NOT NULL UNIQUE,
    NOME_UF VARCHAR(40) NOT NULL
);

INSERT INTO UF (UF, NOME_UF) VALUES ('SP', 'SÃO PAULO');
INSERT INTO UF (UF, NOME_UF) VALUES ('RJ', 'RIO DE JANEIRO');
INSERT INTO UF (UF, NOME_UF) VALUES ('MG', 'MINAS GERAIS');
INSERT INTO UF (UF, NOME_UF) VALUES ('ES', 'ESPÍRITO SANTO');
INSERT INTO UF (UF, NOME_UF) VALUES ('PR', 'PARANÁ');
INSERT INTO UF (UF, NOME_UF) VALUES ('SC', 'SANTA CATARINA');
INSERT INTO UF (UF, NOME_UF) VALUES ('RS', 'RIO GRANDE DO SUL');

CREATE TABLE CARGO (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    CARGO VARCHAR(60) NOT NULL,
    CARGA_HORARIA TIME,
    SALARIO_BASE DECIMAL(10, 2)
);

CREATE TABLE FUNCIONARIOS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(60) NOT NULL,
    ENDERECO VARCHAR(80) NOT NULL,
    CEP VARCHAR(9) NOT NULL,
    CIDADE VARCHAR(40) NOT NULL,
    TELEFONE VARCHAR(11),
    CELULAR VARCHAR(12),
    IDUF INT,
    IDCARGO INT,
    IDAPONTAMENTO INT,
    foreign key (IDUF) references UF (ID),
    foreign key (IDCARGO) references CARGO (ID)
);

CREATE TABLE LOGIN (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    USERNAME VARCHAR(40) NOT NULL UNIQUE,
    PWD VARCHAR(40) NOT NULL,
    IDFUNC INT,
    foreign key (IDFUNC) references FUNCIONARIOS (ID)
);

CREATE TABLE APONTAMENTO_HORAS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    DATACAD DATE NOT NULL,
    HRENTRADA TIME,
    HRSAIDAALMOCO TIME,
    HRVOLTAALMOCO TIME,
    HRSAIDA TIME,
    IDFUNC INT,
    foreign key (IDFUNC) references FUNCIONARIOS (ID)
);


CREATE DATABASE proj_pessoal;

USE proj_pessoal;

CREATE TABLE condominio(
	id_condominio TINYINT(3) PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    endereco VARCHAR(150),
    situacao ENUM('em construcao', 'construido')
);

CREATE TABLE pessoa(
	cpf CHAR(11) PRIMARY KEY NOT NULL UNIQUE,
    nome_completo VARCHAR(150),
    proprietário TINYINT(1),
    inquilino TINYINT(1)
);

CREATE TABLE unidade_apartamento(
	id_unidade SMALLINT(5) PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    bloco TINYINT(3),
    
    numero TINYINT(3),
    metros_quadrado DECIMAL(5,2),
    numero_comodos TINYINT(3),
    inquilino_cpf CHAR(11),
    id_condominio TINYINT(3),
    
    FOREIGN KEY(id_condominio) REFERENCES condominio(id_condominio),
    FOREIGN KEY(inquilino_cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE pessoa_has_unidade_apartamento(
    proprietario_cpf CHAR(11),
    id_unidade TINYINT(3),
    
    FOREIGN KEY(proprietario_cpf) REFERENCES pessoa(cpf),
    FOREIGN KEY(id_unidade) REFERENCES unidade_apartamento(id_unidade)
)
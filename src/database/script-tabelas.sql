-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
CREATE DATABASE isong;

USE isong;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nomeUsuario varchar(45),
	emailUsuario varchar(45),
	senhaUsuario varchar(45),
	pontos int
);

CREATE TABLE Produto (
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
	nomeProduto varchar(45),
	descricao varchar(200),
	preco decimal(10,2)
);

CREATE TABLE Curso (
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
	nomeCurso varchar(45),
	preco decimal(10,2)
);

CREATE TABLE Venda (
	idVenda int auto_increment,
	fkProduto int,
	foreign key (fkProduto) references Produto(idProduto),
	fkUsuario int,
	foreign key (fkUsuario) references Usuario(idUsuario),
	primary key (idVenda, fkProduto, fkUsuario),
	dtVenda date,
	tipoVenda varchar(45),
	parcelas int,
	desconto decimal(10,2)
);

CREATE TABLE Matricula (
	idMatricula int auto_increment,
	fkUsuario int,
	foreign key (fkUsuario) references Usuario(idUsuario),
	fkCurso int,
	foreign key (fkCurso) references Curso(idCurso),
	primary key(idMatricula, fkUsuario, fkCurso),
	dtMatricula date
);



/* para sql server - remoto - produção */

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
    descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
); 

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fk_aquario INT
);



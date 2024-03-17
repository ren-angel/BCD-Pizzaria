CREATE DATABASE pizzaria;

USE pizzaria;

CREATE TABLE tbl_clientes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(13) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_bebidas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    bebidas VARCHAR(50) NOT NULL,
    descricao VARCHAR(300),
    preco FLOAT
);

CREATE TABLE tbl_massas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_bordas(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_ingredientes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    quantidade INT
);

CREATE TABLE tbl_sabores(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    
    idIngrediente INT NOT NULL,
    
    FOREIGN KEY (idIngrediente) REFERENCES tbl_ingredientes (id)
);

CREATE TABLE tbl_pizzas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco FLOAT,
    pizzasOferecidas VARCHAR(100),
    
    idMassa INT NOT NULL,
    idBorda INT NOT NULL,
    idSabor INT NOT NULL,
    
    FOREIGN KEY (idMassa) REFERENCES tbl_massas (id),
    FOREIGN KEY (idBorda) REFERENCES tbl_bordas (id),
    FOREIGN KEY (idSabor) REFERENCES tbl_sabores (id)    
);

CREATE TABLE tbl_pedidos (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    valorTotal FLOAT,
    quantidadeBebida INT,
	quantidadePizzas INT,
	dataHora datetime NOT NULL,
    
    idCliente INT NOT NULL,
    idPizza INT NOT NULL,
    idBebida INT NOT NULL,
    
    FOREIGN KEY (idCliente) REFERENCES tbl_clientes (id),
    FOREIGN KEY (idPizza) REFERENCES tbl_pizzas (id),
    FOREIGN KEY (idBebida) REFERENCES tbl_bebidas (id)
);

CREATE TABLE tbl_fornadas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    
    idPizza INT,
    codigoPedido INT,
    
    FOREIGN KEY (idPizza) REFERENCES tbl_pizzas (id),
    FOREIGN KEY (codigoPedido) REFERENCES tbl_pedidos (codigo)
);
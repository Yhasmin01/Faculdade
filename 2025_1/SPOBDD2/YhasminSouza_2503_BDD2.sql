CREATE TABLE Fornecedor (
    Cod_Fornecedor INT PRIMARY KEY,
    Desc_Fornecedor VARCHAR(60),
    Rua_Forn VARCHAR(60),
    Numero_Forn INT,
    Bairro_Forn VARCHAR(60),
    CEP_Forn VARCHAR(9),
    Cidade_Forn VARCHAR(60),
    UF_Forn CHAR(2)
);

CREATE TABLE Telefone (
    Cod_Telefone INT PRIMARY KEY,
    Cod_Fornecedor INT,
    Telefone VARCHAR(20),
    FOREIGN KEY (Cod_Fornecedor) REFERENCES Fornecedor(Cod_Fornecedor)
);

CREATE TABLE Produto (
    Cod_Prod INT PRIMARY KEY,
    Cod_Fornecedor INT,
    Desc_Produto VARCHAR(60),
    Preco_Produto DECIMAL(6,3),
    Quant_Produto INT,
    FOREIGN KEY (Cod_Fornecedor) REFERENCES Fornecedor(Cod_Fornecedor)
);

CREATE TABLE Empregado (
    Cod_Empregado INT PRIMARY KEY,
    Nome_Empregado VARCHAR(60),
    CPF_Empregado VARCHAR(14),
    Rua_Empregado VARCHAR(60),
    Numero_Empregado INT,
    Bairro_Empregado VARCHAR(60),
    CEP_Empregado VARCHAR(9),
    Cidade_Empregado VARCHAR(60),
    UF_Empregado CHAR(2)
);

CREATE TABLE Venda (
    Cod_Venda INT PRIMARY KEY,
    Data_Venda DATE,
    Rua_Venda VARCHAR(60),
    Numero_Venda INT,
    Bairro_Venda VARCHAR(60),
    CEP_Venda VARCHAR(9),
    Cidade_Venda VARCHAR(60),
    UF_Venda CHAR(2)
);

CREATE TABLE Prod_Venda (
    Cod_Prod INT,
    Cod_Venda INT,
    Cod_Empregado INT,
    Quant_Produto INT,
    Comissao_Venda_Emp DECIMAL(5,2),
    PRIMARY KEY (Cod_Prod, Cod_Venda),
    FOREIGN KEY (Cod_Prod) REFERENCES Produto(Cod_Prod),
    FOREIGN KEY (Cod_Venda) REFERENCES Venda(Cod_Venda),
    FOREIGN KEY (Cod_Empregado) REFERENCES Empregado(Cod_Empregado)
);

INSERT INTO Fornecedor VALUES
(1, 'TechDistribuidora', 'Rua Alfa', 101, 'Centro', '01000-000', 'São Paulo', 'SP'),
(2, 'InfoParts', 'Rua Beta', 202, 'Jardim', '02000-000', 'Campinas', 'SP'),
(3, 'MegaComp', 'Rua Gama', 303, 'Industrial', '03000-000', 'Santos', 'SP');

INSERT INTO Telefone VALUES
(1, 1, '(11) 99999-1111'),
(2, 2, '(19) 98888-2222'),
(3, 3, '(13) 97777-3333');

INSERT INTO Produto VALUES
(1, 1, 'Mouse Óptico', 45.500, 100),
(2, 2, 'Teclado Mecânico', 150.000, 50),
(3, 3, 'Monitor 24"', 900.000, 20);

INSERT INTO Empregado VALUES
(1, 'Lucas Silva', '123.456.789-00', 'Rua Um', 10, 'Centro', '04000-000', 'São Paulo', 'SP'),
(2, 'Mariana Lima', '987.654.321-00', 'Rua Dois', 20, 'Jardim', '05000-000', 'Campinas', 'SP'),
(3, 'Carlos Souza', '456.789.123-00', 'Rua Três', 30, 'Industrial', '06000-000', 'Santos', 'SP');

INSERT INTO Venda VALUES
(1, '2025-03-10', 'Rua Venda A', 111, 'Centro', '07000-000', 'São Paulo', 'SP'),
(2, '2025-03-15', 'Rua Venda B', 222, 'Jardim', '08000-000', 'Campinas', 'SP'),
(3, '2025-03-20', 'Rua Venda C', 333, 'Industrial', '09000-000', 'Santos', 'SP');

INSERT INTO Prod_Venda VALUES
(1, 1, 1, 2, 10.0),
(2, 2, 2, 1, 12.5),
(3, 3, 3, 1, 15.0);

SELECT * FROM Fornecedor;

SELECT Desc_Fornecedor, Cidade_Forn FROM Fornecedor;

SELECT Cod_Prod, Cod_Fornecedor FROM Produto;

SELECT Cod_Empregado, Nome_Empregado, CPF_Empregado, Cidade_Empregado FROM Empregado;

SELECT * FROM Venda;

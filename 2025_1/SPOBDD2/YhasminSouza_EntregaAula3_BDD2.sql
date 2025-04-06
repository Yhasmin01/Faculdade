CREATE TABLE notafiscal (
    numNF INT PRIMARY KEY,
    dataNF DATE,
    nomeCliente VARCHAR(100),
    endeCliente VARCHAR(150)
);

CREATE TABLE servico (
    codigoServico INT PRIMARY KEY,
    descrServico VARCHAR(150),
    precoUnitServico DECIMAL(10,2)
);

CREATE TABLE servicoNota (
    numNF INT,
    codigoServico INT,
    quantServico INT,
    precoTotalServico DECIMAL(10,2),
    PRIMARY KEY (numNF, codigoServico),
    FOREIGN KEY (numNF) REFERENCES NotaFiscal(numNF),
    FOREIGN KEY (codigoServico) REFERENCES Servico(codigoServico)
);

DESCRIBE notafiscal;
DESCRIBE servico;
DESCRIBE serviconota;

--

CREATE TABLE Produto (
    Id INT PRIMARY KEY,
    Produto VARCHAR(20),
    Peso INT,
    Origem VARCHAR(50),
    Destino VARCHAR(50),
    Valor DECIMAL(10,2),
    Quantidade INT,
    Sigla CHAR(1)
);

DESCRIBE Produto;

INSERT INTO Produto (Id, Produto, Peso, Origem, Destino, Valor, Quantidade, Sigla) VALUES
(1, 'XPTO21', 1, 'Curitiba', 'Cuiabá', 230.00, 4000, 'J'),
(2, 'KLPX33', 3, 'Porto Alegre', 'Manaus', 200.00, 3000, 'P'),
(3, 'MMnO55', 2, 'Curitiba', 'Manaus', 210.00, 3500, 'A'),
(4, 'KKeeR21', 4, 'São Paulo', 'Recife', 190.00, 4100, 'B');

SELECT * FROM Produto;

SELECT * FROM Produto WHERE Peso >= 2;
SELECT * FROM Produto WHERE Destino = 'Manaus';
SELECT * FROM Produto WHERE Sigla > 'H';
SELECT * FROM Produto WHERE Origem = 'Curitiba' AND Valor > 230;
SELECT * FROM Produto WHERE Id > 1 AND Valor >= 200 AND Quantidade < 4000;


SELECT Produto, Origem, Destino FROM Produto
WHERE Valor > 210 OR Sigla = 'B';

-- 

-- EXERCÍCIO 4: 

SELECT Produto, Sigla FROM Produto
WHERE Origem = 'Curitiba' AND Valor >= 220 AND Quantidade > 1000;

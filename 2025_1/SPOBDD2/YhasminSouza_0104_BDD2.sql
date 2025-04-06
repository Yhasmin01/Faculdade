CREATE DATABASE BD_ENDERECO;
USE BD_ENDERECO;

CREATE TABLE Pais (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Estado (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Id_pais INT NOT NULL,
    FOREIGN KEY (Id_pais) REFERENCES Pais(Id)
);

CREATE TABLE Cidade (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Id_estado INT NOT NULL,
    FOREIGN KEY (Id_estado) REFERENCES Estado(Id)
);

CREATE TABLE Endereco (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdPessoa INT,
    Logradouro VARCHAR(100) NOT NULL,
    Complemento VARCHAR(100),
    Bairro VARCHAR(100) NOT NULL,
    Cep VARCHAR(10) NOT NULL,
    Id_cidade INT NOT NULL,
    FOREIGN KEY (Id_cidade) REFERENCES Cidade(Id)
);

CREATE INDEX idx_Nome_Cidade ON Cidade(Nome);

INSERT INTO Pais (Nome) VALUES ('Brasil');

INSERT INTO Estado (Nome, Id_pais) VALUES ('São Paulo', 1);
INSERT INTO Estado (Nome, Id_pais) VALUES ('Minas Gerais', 1);
INSERT INTO Estado (Nome, Id_pais) VALUES ('Santa Catarina', 1);

INSERT INTO Cidade (Nome, Id_estado) VALUES ('São Paulo', 1);
INSERT INTO Cidade (Nome, Id_estado) VALUES ('Campinas', 1);
INSERT INTO Cidade (Nome, Id_estado) VALUES ('Santos', 1);

INSERT INTO Cidade (Nome, Id_estado) VALUES ('Belo Horizonte', 2);
INSERT INTO Cidade (Nome, Id_estado) VALUES ('Uberlândia', 2);
INSERT INTO Cidade (Nome, Id_estado) VALUES ('Contagem', 2);

INSERT INTO Cidade (Nome, Id_estado) VALUES ('Florianópolis', 3);
INSERT INTO Cidade (Nome, Id_estado) VALUES ('Blumenau', 3);
INSERT INTO Cidade (Nome, Id_estado) VALUES ('Joinville', 3);

INSERT INTO Endereco (IdPessoa, Logradouro, Complemento, Bairro, Cep, Id_cidade)
VALUES
(101, 'Rua A', 'Apto 1', 'Centro', '01000-000', 1),
(102, 'Rua B', 'Casa', 'Jardim', '02000-000', 1),
(103, 'Rua C', 'Apto 2', 'Centro', '01001-000', 2),
(104, 'Rua D', 'Casa', 'Jardim', '02001-000', 2),
(105, 'Rua E', 'Apto 3', 'Centro', '01002-000', 3),
(106, 'Rua F', 'Casa', 'Jardim', '02002-000', 3),
(107, 'Rua G', 'Apto 4', 'Centro', '01003-000', 4),
(108, 'Rua H', 'Casa', 'Jardim', '02003-000', 4),
(109, 'Rua I', 'Apto 5', 'Centro', '01004-000', 5),
(110, 'Rua J', 'Casa', 'Jardim', '02004-000', 5),
(111, 'Rua K', 'Apto 6', 'Centro', '01005-000', 6),
(112, 'Rua L', 'Casa', 'Jardim', '02005-000', 6),
(113, 'Rua M', 'Apto 7', 'Centro', '01006-000', 7),
(114, 'Rua N', 'Casa', 'Jardim', '02006-000', 7),
(115, 'Rua O', 'Apto 8', 'Centro', '01007-000', 8),
(116, 'Rua P', 'Casa', 'Jardim', '02007-000', 8),
(117, 'Rua Q', 'Apto 9', 'Centro', '01008-000', 9),
(118, 'Rua R', 'Casa', 'Jardim', '02008-000', 9);

UPDATE Estado SET Nome = 'Paraná' WHERE Nome = 'Santa Catarina';

INSERT INTO Cidade (Nome, Id_estado)
VALUES ('Cascavel', (SELECT Id FROM Estado WHERE Nome = 'Paraná'));

DELETE FROM Endereco WHERE Id IN (1, 2, 3);

SELECT * FROM Cidade WHERE Nome LIKE 'C%';

UPDATE Cidade SET Nome = 'Curitiba' WHERE Nome = 'Cascavel';

SELECT c.*, e.Nome AS Nome_Estado
FROM Cidade c
JOIN Estado e ON c.Id_estado = e.Id;

CREATE DATABASE Clinica

GO
USE Clinica

CREATE TABLE Paciente (
numBeneficiario int NOT NULL,
nome varchar(100) NOT NULL,
logradouro varchar(200) NOT NULL,
numero int NOT NULL,
cep char(8) NOT NULL,
complemento varchar(255) NOT NULL,
telefone varchar(11) NOT NULL
PRIMARY KEY(numBeneficiario)
)

CREATE TABLE Especialidade (
id int NOT NULL,
especialidade varchar(100) NOT NULL
PRIMARY KEY(id)
)

CREATE TABLE Medico (
codigo int NOT NULL,
nome varchar(100) NOT NULL,
logradouro varchar(100) NOT NULL,
numero int NOT NULL,
cep char(8) NOT NULL,
complemento varchar(255) NOT NULL,
contato varchar(11) NOT NULL,
especialidadeId int NOT NULL
PRIMARY KEY(codigo)
FOREIGN KEY(especialidadeId) REFERENCES Especialidade(id)
)

CREATE TABLE Consulta (
pacienteNumBeneficiario int NOT NULL,
medicoCodigo int NOT NULL,
dataHora varchar(20) NOT NULL,
observacao varchar(255)
PRIMARY KEY(pacienteNumBeneficiario, medicoCodigo),
FOREIGN KEY(pacienteNumBeneficiario) REFERENCES Paciente(numBeneficiario),
FOREIGN KEY(medicoCodigo) REFERENCES Medico(codigo)
)

INSERT INTO Paciente(numBeneficiario, nome, logradouro, numero, cep, complemento, telefone)
VALUES(99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 'Casa', '922229999')

INSERT INTO Paciente
VALUES(99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, '03254010', 'Bloco B. Apto 25', '923450987')

INSERT INTO Paciente
VALUES(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, '06987020', 'Apto 1208', '912348765')

INSERT INTO Paciente
VALUES(99904, 'José Araujo', 'R. XV de Novembro', 18, '03678000', 'Casa', '945674312')

INSERT INTO Paciente
VALUES(99905, 'Joana Paula', 'R. 7 de Abril', 97, '01214000', 'Conjunto 3 - Apto 801', '912095674')

INSERT INTO Especialidade(id, especialidade)
VALUES(1, 'Otorrinolaringologista')

INSERT INTO Especialidade
VALUES(2, 'Urologista')

INSERT INTO Especialidade
VALUES(3, 'Geriatra')

INSERT INTO Especialidade
VALUES(4, 'Pediatra')

INSERT INTO Medico(codigo, nome, logradouro, numero, cep, complemento, contato, especialidadeId)
VALUES(100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 'Casa', '915689456', 1)

INSERT INTO Medico
VALUES(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', '923235454', 1)

INSERT INTO Medico
VALUES(100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 'Apto 205', '963698585', 2)

INSERT INTO Medico
VALUES(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', '932458745', 3)

INSERT INTO Consulta(pacienteNumBeneficiario, medicoCodigo, dataHora, observacao)
VALUES(99901, 100002, '2021/09/04 13:20', 'Infecção Urina')

INSERT INTO Consulta
VALUES(99902, 100003, '2021/09/04 13:15', 'Gripe')

INSERT INTO Consulta
VALUES(99901, 100001, '2021/09/04 12:30', 'Infecção Garganta')

ALTER TABLE Medico
ADD diaAtendimento varchar(10) NULL

UPDATE Medico
SET diaAtendimento = '2ª feira'
WHERE codigo = 100001

UPDATE Medico
SET diaAtendimento = '4ª feira'
WHERE codigo = 100002

UPDATE Medico
SET diaAtendimento = '2ª feira'
WHERE codigo = 100003

UPDATE Medico
SET diaAtendimento = '5ª feira'
WHERE codigo = 100004

DELETE Especialidade
WHERE id = 4

EXEC sp_rename 'dbo.Medico.diaAtendimento', 'diaSemanaAtendimento', 'COLUMN'

UPDATE Medico
SET logradouro = 'Av. Bras Leme', numero = 876, complemento = 'Apto 504', cep = '02122000'
WHERE codigo = 100003

ALTER TABLE	Consulta
ALTER COLUMN observacao varchar(200) NOT NULL
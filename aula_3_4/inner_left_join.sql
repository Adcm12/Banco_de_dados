-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_3_4\Exercicio2.db

CREATE TABLE IF NOT EXISTS Usuarios (

    id INTEGER PRIMARY KEY,
    Nombre_usu text (40),
    Edad_usu INTEGER,
    Email_usu text (40),
    Tipo_Conta_usu text (40),
    Sal_usu DOUBLE
);

INSERT INTO Usuarios(Nombre_usu, Edad_usu, Email_usu, Tipo_Conta_usu, Sal_usu)
Values('Adrian', 19, 'david.marcanao07@', 'Premium', 5000);

INSERT INTO Usuarios(Nombre_usu, Edad_usu, Email_usu, Tipo_Conta_usu, Sal_usu)
Values('Marina', 28, 'Marina.marcanao07@', 'Premium', 5000);

INSERT INTO Usuarios(Nombre_usu, Edad_usu, Email_usu, Tipo_Conta_usu, Sal_usu)
Values('Rodrigo', 32, 'Rodrigo.marcanao07@', 'Premium', 6500);

INSERT INTO Usuarios(Nombre_usu, Edad_usu, Email_usu, Tipo_Conta_usu, Sal_usu)
Values('Ana', 28, 'Ana.marcanao07@', 'Premium', 5000);

INSERT INTO Usuarios(Nombre_usu, Edad_usu, Email_usu, Tipo_Conta_usu, Sal_usu)
Values('Elaine', 48, 'david.marcanao07@', 'Premium', 5000);

INSERT INTO Usuarios(Nombre_usu, Edad_usu, Email_usu, Tipo_Conta_usu, Sal_usu)
Values('Eduardo', 32, 'Eduardo.marcanao07@', 'Free ', 7000);

INSERT INTO Usuarios(Nombre_usu, Edad_usu, Email_usu, Tipo_Conta_usu, Sal_usu)
Values('Pro may', 36, 'ProMay.marcanao07@', 'Free', 10000);


SELECT Usuarios.Nombre_usu AS Nombre_usuarios,
Alumnos.Nombre AS Nombre_Alumnos,
Alumnos.Email AS Email_e_igual
from Alumnos INNER JOIN Usuarios
on Alumnos.Email = Usuarios.Email_usu;

SELECT Usuarios.Nombre_usu AS Nombre_usuarios,
Alumnos.Nombre AS Nombre_Alumnos,
Alumnos.Edad AS Edad_e_igual
from Alumnos INNER JOIN Usuarios
on Alumnos.Edad = Usuarios.Edad_usu;

-- Ahora vamos a suponer que deseas obtener una lista de datos de todos
-- Los programadores y si hay, el nombre de usuario correspondiente
-- con base en la direccion de email

SELECT Alumnos.Nombre AS Nombre_alumnos,
Usuarios.Nombre_usu As Nombre_usuarios
FROM Usuarios
LEFT JOIN Alumnos
ON Alumnos.Email = Usuarios.Email_usu;

-- |--- EX 2 ---|
-- Criar tabela Contatos com mesmas colunas que Usuarios + coluna telefone (e outras se desejado)
-- Insira 20 linhas na tabela Contatos e repita o exercícios anterior
-- trocando a tabela usuarios pela tabela contatos*

CREATE TABLE IF NOT EXISTS Contactos (

    id INTEGER PRIMARY KEY,
    Nombre_usu text (40),
    Edad_usu INTEGER,
    Telefone INTEGER,
    Email_usu text (40),
    Tipo_Conta_usu text (40),
    Sal_usu DOUBLE

);

INSERT INTO Contactos(Nombre_usu, Edad_usu, Telefone, Email_usu, Tipo_Conta_usu, Sal_usu)
Values ('Pedro', 22, 47992191554,'pedro@email.com', 'Normal', 2000),
    ('Ana', 28, 47992191554,'ana@email.com', 'Premium', 4000),
    ('Carlos', 35, 47992197554,'carlos@email.com', 'Normal', 2800),
    ('Lúcia', 27, 47992191554,'lucia@email.com', 'Premium', 4500),
    ('Fernando', 29, 47997191554,'fernando@email.com', 'Normal', 2300),
    ('Sofia', 31,47992191554, 'sofia@email.com', 'Premium', 5000),
    ('Mário', 26, 47992196554,'mario@email.com', 'Normal', 2600),
    ('Laura', 33, 47992191574,'laura@email.com', 'Premium',3800);

SELECT Contactos.Nombre_usu AS Nombre_Contactos,
Usuarios.Nombre_usu AS Nombre_e_igual,
Usuarios.Edad_usu AS Email_e_igual
from Usuarios INNER JOIN Contactos
on Usuarios.Edad_usu = Contactos.Edad_usu;

SELECT Contactos.Nombre_usu AS Nombre_Contactos,
Usuarios.Nombre_usu AS Nombre_e_igual,
Usuarios.Email_usu AS Email_e_igual
from Usuarios INNER JOIN Contactos
on Usuarios.Email_usu = Contactos.Email_usu;

SELECT Contactos.Nombre_usu AS Nombre_Contactos,
Usuarios.Nombre_usu AS Nombre_e_igual,
Usuarios.Tipo_Conta_usu AS Email_e_igual
from Usuarios INNER JOIN Contactos
on Usuarios.Tipo_Conta_usu = Contactos.Tipo_Conta_usu;

ALTER TABLE Usuarios
ADD Activo;

UPDATE Usuarios
SET Activo = TRUE
WHERE id >7;

-- Agora, suponha que você queira obter uma lista dos Usuarios juntamente 
-- com os contatos correspondentes com base no id.
-- Vamos inserir a coluna ativo em ambas as tabelas do tipo boolean (pesquisar como inserir boolean)
-- Metade das linhas das duas tabelas tem que estar com o ativo sendo true, e a outra metade false
-- A consulta deve retornar apenas os usuarios que possuem um id na tabela 
-- contatos correspondente ao id da tabela usuarios.
-- Após o ON, adicione um where no final para adicionar ao filtro também
-- apenas as idades que são maiores que 18 e menores que 30
-- No Final ordene por nome

SELECT Contactos.Nombre_usu AS Nombre_Contactos,
Usuarios.Nombre_usu AS Nombre_e_igual,
Usuarios.id AS id
from Usuarios INNER JOIN Contactos
on Usuarios.Activo = TRUE
And Contactos.Activo = TRUE
WHERE Usuarios.Edad_usu BETWEEN 18 AND 30
AND Contactos.Edad_usu BETWEEN 18 AND 30
ORDER BY Contactos.Nombre_usu AND Usuarios.Nombre_usu ASC
-- ORDER BY Usuarios.Nombre_usu ASC;

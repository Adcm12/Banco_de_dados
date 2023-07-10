-- database: c:\Users\Apex02\Desktop\Banco_de_dados\aula_1e2\mydatabase.db
-- Use the ▷ button in the top right corner to run the entire file.
-- 1 Crear una tabela 
--Primary key: auto incrementa el valor del campo
--Fuerza el campo no estar vacio
-- Garantir que cada ususario tenga un valor vacio
--IF NOT EXISTS:
--Garante que la tabaela apenas sera creada
--Caso una tabela con nombre informado no exista
CREATE TABLE IF NOT EXISTS
    Tabla (
        id INTEGER PRIMARY KEY,
        nome TEXT (100),
        edad INTEGER,
        email TEXT (100)
    );

-- 2 Inserindo datos en la tabela creada
--INSERT INTO es el comando SQL para inserir datosd en las tebelas
INSERT INTO
    Tabla (nome, edad, email)
VALUES
    ('Jose', 33, 'david.jose@gmail.com');

INSERT INTO
    Tabla (nome, edad, email)
VALUES
    ('Leo', 27, 'kdfsmkdas');

INSERT INTO
    Tabla (nome, edad, email)
VALUES
    ('fabricia', 22, 'kdfsmkdas');

INSERT INTO
    Tabla (nome, edad, email)
VALUES
    ('maria', 47, 'dsdsds');

INSERT INTO
    Tabla (nome, edad, email)
VALUES
    ('LeJJJo', 227, 'ddddd');

--Alterando tabelas:
--Usado para alterar tabelas
--RENAME TO que renombra la tabela
ALTER TABLE Tablas
RENAME TO Tabla;

-- ADD COLUMN adiciona una columna
ALTER TABLE Tabla
ADD COLUMN columna_nova;

--DROP COLUMN
ALTER TABLE Tabla
DROP COLUMN columna_nova;

--Resetando Tabelas
--DELETE From BORRA TODOS LOS DATOS DE LA TABELA SI NO FUERON PASADOS POR UNA CONDICION ESPEFICA
--VACUM comienza de nuevo el id
DELETE FROM Tabla;

VACUUM;

--Destruindo tabela
DROP TABLE Tabla;

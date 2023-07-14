-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\exercicio\Exercicio1.db


CREATE TABLE IF NOT EXISTS 
    uzuarios(

        id INTEGER PRIMARY KEY,
        nombre TEXT (20),
        sobrenombre TEXT (40),
        edad INTEGER
    );

ALTER TABLE uzuarios
RENAME TO Usuarios;

ALTER TABLE Usuarios
ADD COLUMN email;

ALTER TABLE Usuarios
DROP COLUMN sobrenombre;

INSERT INTO
    Usuarios(email)
VALUES
    ('Vanessa16vanessa.rosa@gmail.com');

INSERT INTO
    Usuarios(email)
VALUES
    ('Andressa36andressa.simas@uol.com.br');

INSERT INTO
    Usuarios(email)
VALUES
    ('Adailton22adailton.mas@yahoo.com');

INSERT INTO
    Usuarios(email)
VALUES
    ('Mayra24mayra_antunes@gmail.com');

INSERT INTO
    Usuarios(email)
VALUES
    ('Cristiane14cris.maya@gmail.com');

INSERT INTO
    Usuarios(email)
VALUES
    ('Carina27carina.almeida@gmail.com');

INSERT INTO
    Usuarios(email)
VALUES
    ('Clóvis29clovis.simao@hotmail.com');

INSERT INTO
    Usuarios(email)
VALUES
    ('Gabriela23gabriela.bragantino@live.com');

INSERT INTO
    Usuarios(email)
VALUES
    ('Cibelenullcibele_lins@uol.com.br25');





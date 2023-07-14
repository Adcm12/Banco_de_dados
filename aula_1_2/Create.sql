-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_1_2\BBDD.db
CREATE TABLE IF NOT EXISTS
    Contactos (
        id INTEGER PRIMARY KEY,
        nome TEXT (100),
        edad INTEGER,
        email TEXT (100)
    );

VACUUM;

INSERT INTO
    Contactos (nome, edad, email)
VALUES
    ('Azaelys', 17, 'david.@gmail.com');



DELETE FROM Contactos
WHERE
    nome == 'AAAA';

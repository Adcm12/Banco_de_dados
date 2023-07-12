-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_1_2\BBDD.db

CREATE TABLE IF NOT EXISTS
    Contactos (
        id INTEGER PRIMARY KEY,
        nome TEXT (100),
        edad INTEGER,
        email TEXT (100)
    );

INSERT INTO
    Contactos (nome, edad, email)
VALUES
    ('Alejandra', 10, 'david.@gmail.com');

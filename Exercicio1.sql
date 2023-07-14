-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\Exercicio1.db


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
DROP COLUMN sobrenombre;



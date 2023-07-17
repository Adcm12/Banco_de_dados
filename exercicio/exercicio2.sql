-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\exercicio\exercicio2.db

CREATE TABLE IF NOT EXISTS

    Clientes(
        
        id INTEGER PRIMARY KEY,
        nome TEXT(20),
        idade INTEGER,
        email TEXT(20)
             );

INSERT INTO Clientes
    (nome, idade, email)
VALUES
    ('Adrian', 19, 'david.marcanao07@gmail.com');

INSERT INTO Clientes
    (nome, idade, email)
VALUES
    ('Aridana', 35, 'lucero.marcanao07@gmail.com');

INSERT INTO Clientes
    (nome, idade, email)
VALUES
    ('Alejandra', 10, 'Alejandra.marcanao07@gmail.com');

UPDATE Clientes
SET idade = (18)
WHERE id = 1;

DELETE FROM Clientes
where id = 2;

select count (*) from Clientes
where idade < 18;

--DE MENOR A MAYOR
select*from Clientes order BY idade DESC;

--DE MAYOR A MENOR
select*from Clientes order BY idade ASC;

SELECT email FROM Clientes
WHERE idade > 30;

select count (*) from Clientes;

select avg(idade) as media_edad from Clientes;


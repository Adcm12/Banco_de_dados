-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_1_2\aula3\mydatabase.db

CREATE TABLE IF NOT EXISTS Programadores (

    id INTEGER PRIMARY KEY,
    nome text (40),
    idade INTEGER,
    email text(40)
);

SELECT * FROM Programadores;

INSERT INTO Programadores
(nome, idade, email)
VALUES( 'Adrian', 18, 'David.marcanao07@');

--REvision

-- CREAT, DROP, DELETE, INSERT, WHERE, LIKE, SELECT, AND, COUNT, UPDATE, MAX MIN, avg

--deletar una tabela
DROP TABLE Programadores;

--Inserir valores y filtrar

INSERT INTO Programadores (nome, idade, email)
VALUES ('Adrian', 18, 'david.marcanao');

INSERT INTO Programadores (nome, idade, email)
VALUES ('Ariadna', 30, 'ariadna.marcanao');

INSERT INTO Programadores (nome, idade, email)
VALUES ('Azaelys', 17, 'azaelyz.marcanao');

INSERT INTO Programadores (nome, idade, email)
VALUES ('Matilde', 45, 'matilde.marcanao');

INSERT INTO Programadores (nome, idade, email)
VALUES ('Carlo', 40, 'carlo.marcanao');

INSERT INTO Programadores (nome, idade, email)
VALUES ('Alejandra', 10, 'allejandra.marcanao');

--Aplicar filtros

SELECT * FROM Programadores;

--Actualizar datos

UPDATE Programadores
SET nome= 'Alejandro', idade=90, email = 'aaaa@@@'
where id = 2;

SELECT id, nome, idade, email from Programadores
where nome = 'Alejandro';

ALTER TABLE Programadores
add COLUMN Linguagem_programacion TEXT(40);

--Inserir las lenguajen de programacion

INSERT INTO Programadores (nome, idade, email, Linguagem_programacion)
VALUES ('Jose', 35, 'jjjjj222', 'Python');

UPDATE Programadores
set Linguagem_programacion = 'React'
where id = 10;

--Buscar valores min, max

SELECT MAX(id) AS Id_Mayor,
MIN(idade) AS idade_menor FROM Programadores;

SELECT nome, idade, email, ROUND(AVG(idade), 2) AS media_idade
FROM Programadores;

SELECT * FROM Programadores
where nome like '%ar%';

-- ORDER BY = Ordene por

SELECT * from Programadores
ORDER BY idade DESC;

SELECT * from Programadores
ORDER BY idade ASC;

SELECT * from Programadores
ORDER BY nome ASC;

SELECT * from Programadores
ORDER BY nome DESC;

-- Exercicio

-- Ordene la tabela programadores por todas las columnas usando tanto DESC y ASC
SELECT * from Programadores
ORDER BY email ASC;

SELECT * from Programadores
ORDER BY email DESC;

SELECT * from Programadores
ORDER BY id ASC;

SELECT * from Programadores
ORDER BY id DESC;

SELECT * from Programadores
ORDER BY Linguagem_programacion ASC;

SELECT * from Programadores
ORDER BY Linguagem_programacion DESC;

SELECT (idade) AS cantidad_edad FROM Programadores
WHERE idade > 18
GROUP BY idade;

SELECT COUNT(nome) AS cantidad_edad FROM Programadores
WHERE nome = 'Carlo'
GROUP BY nome;

SELECT COUNT(Linguagem_programacion) AS cantidad_edad FROM Programadores
WHERE Linguagem_programacion = 'Python'
GROUP BY Linguagem_programacion;







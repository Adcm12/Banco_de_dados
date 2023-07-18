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

-- EXERCICIO 1 -------------------------------------------------
-- Criar a coluna salario_dev na tabela Programadores e inserir salários diferentes
-- para todos as linhas.

-- Em seguida, selecionar os dados ordenando por id
 
-- Mostrar a média da coluna salario_dev 

Alter TABLE Programadores
Add Salario_Dev;

UPDATE Programadores
SET Salario_Dev = 20000
where id = 12;

SELECT * FROM Programadores
ORDER BY Salario_Dev ASC;

SELECT * FROM Programadores
ORDER BY Salario_Dev DESC;


SELECT AVG(Salario_Dev) AS media_Salario
FROM Programadores;


------EXERCICIO 2 --------------------------------------------------------------------------------------------------

-- Criar mais 5 colunas em uma das tabelas
ALTER TABLE Programadores
ADD Endereço

-- inserir os dados manualmente com insert into

UPDATE Programadores
Set Sobrenome = 'Varela', Tempo_na_empresa = 2, Numero_tlf = 47991569787, Endereço ='Rua Bolivar 64'
where id = 12;

-- Selecionar a maior idade, e o menor id da tabela Programadores

SELECT MAX(idade) AS Idade_mayor,
MIN(id) AS Id_menor FROM Programadores;

-- Selecionar todas as colunas da tabela Programadores e ordenar pelo nome em ordem aufabética

SELECT * FROM Programadores
ORDER BY nome ASC;

-- Selecionar a idade da tabela Programadores, agrupando pela idade 
-- mostrando a mesma como total_idade_grup apenas onde a idade é maior ou igual a 18

SELECT count(idade) AS total_idade_grup, idade AS Idade  FROM Programadores
WHERE idade >= 18
GROUP BY idade;

-- Ordenar a tabela Programadores e ordenando por id

SELECT * from Programadores
ORDER BY id ASC;

-- Homework:
-- Criar uma tabela nova, inserir 20 linhas e 8 colunas na tabela
-- Refazer todos os exercícios desse arquivo com a tabela criada










 
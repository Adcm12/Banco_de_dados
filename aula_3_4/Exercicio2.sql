-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_3_4\Exercicio2.db

-- # Exercícios:C:\Users\Adrian12\Desktop\Banco_de_dados\aula3\Exercicio2.dbC:\Users\Adrian12\Desktop\Banco_de_dados\aula3\Exercicio2.dbC:\Users\Adrian12\Desktop\Banco_de_dados\aula3\Exercicio2.dbC:\Users\Adrian12\Desktop\Banco_de_dados\aula3\Exercicio2.dbC:\Users\Adrian12\Desktop\Banco_de_dados\aula3\Exercicio2.dbC:\Users\Adrian12\Desktop\Banco_de_dados\aula3\Exercicio2.dbC:\Users\Adrian12\Desktop\Banco_de_dados\aula3\Exercicio2.dbC:\Users\Adrian12\Desktop\Banco_de_dados\aula3\Exercicio2.dbC:\Users\Adrian12\Desktop\Banco_de_dados\aula3\Exercicio2.db

-- OBS: Se o exercício pedir por dados que ainda não existem, inserir os mesmos.
    -- Cada nota, corresponderá a uma matéria do aluno, portanto o alunos pode
    -- aparecer mais de um vez na tabela com notas distintas para cada matéria,
    -- no entando deve ter o id único com uma chave primária
    -- Se o exercício estiver muito difícil, pule e volte depois

-- Crie uma tabela chamada "Alunos" com as colunas id como inteiro e chave primária,
-- nome como texto, idade como inteiro, notas como double, matéria como texto.

CREATE TABLE IF NOT EXISTS Alumnos (

    id INTEGER PRIMARY KEY,
    Nombre text (40),
    Edad INTEGER,
    Notas DOUBLE,
    Materia TEXT (40)
);

-- Insira 20 linhas distintas na tabela alunos para cada linha, tente incluir diversidade nas notas e matérias.
INSERT INTO Alumnos (Nombre, Edad, Notas, Materia)
Values('Pablo Vazques', 20, 20, 'Ingles');
INSERT INTO Alumnos (Nombre, Edad, Notas, Materia)
Values('Martha Castillo', 17, 16, 'Ingles');
INSERT INTO Alumnos (Nombre, Edad, Notas, Materia)
Values('Keilyn', 17, 17, 'Ingles');
INSERT INTO Alumnos (Nombre, Edad, Notas, Materia)
Values('Ariadna Marcano', 20, 20, 'Ingles');
INSERT INTO Alumnos (Nombre, Edad, Notas, Materia)
Values('Adrian Castillo', 20, 20, 'Ingles');

-- Selecione todos os registros da tabela "Alunos".

SELECT * FROM Alumnos;

-- Selecione apenas o nome e a idade dos alunos da tabela "Alunos".

SELECT Nombre, Edad FROM Alumnos;

-- Insira um novo aluno na tabela "Alunos" com nome "João" e idade 25, sem matéria e sem notas.

INSERT INTO Alumnos (Nombre, Edad)
Values('João', 25);

-- Selecione todas as colunas onde a matéria está com valor null.
SELECT * FROM Alumnos
WHERE Materia IS NULL;

-- Atualize a idade do aluno com id 10 para 22 anos na tabela "Alunos".
UPDATE Alumnos
SET Email = 'Ana.llll@'
WHERE id > 23;

-- Selecione a maior idade presente na tabela "Alunos".
SELECT MAX(Edad) AS Edad_Mayor
FROM Alumnos;

-- Selecione o menor valor da coluna "notas".
SELECT MIN(Notas) AS Nota_menor
FROM Alumnos;

-- Ordene os alunos da tabela "Alunos" por nota em ordem decrescente.
SELECT * FROM Alumnos
ORDER BY Notas DESC;

-- Calcule a média das notas dos alunos.
SELECT round(AVG(Notas), 2) AS Media_Notas
FROM Alumnos;
-- Inserir mais 15 linhas com dados distintos, e modirifcar três linhas existentes
--em pelo menos duas colunas cada.

INSERT INTO Alumnos (Nombre, Edad, Notas, Materia, Email)
Values('Adrian Castillo', 20, 19, 'Biología', 'david.marcanao07@');
INSERT INTO Alumnos (Nombre, Edad, Notas, Materia)
Values('Martha Castillo', 17, 15, 'Biología');
INSERT INTO Alumnos (Nombre, Edad, Notas, Materia)
Values('Keilyn', 17, 13, 'Biología');
INSERT INTO Alumnos (Nombre, Edad, Notas, Materia)
Values('Ariadna Marcano', 20, 17, 'Biología');
INSERT INTO Alumnos (Nombre, Edad, Notas, Materia)
Values('Adrian Castillo', 20, 18, 'Biología');

-- Crie uma coluna escola e insira as escolas para os alunos usando update 
ALTER TABLE Alumnos
ADD Escola;  

-- Selecione os alunos cujo nome começa com a letra "A" na tabela "Alunos".
SELECT * FROM Alumnos
where Nombre like 'A%';

-- Ordene os alunos da tabela "Alunos" por idade em ordem crescente.
SELECT * FROM Alumnos
ORDER BY Edad ASC;

-- Selecione os alunos que têm idade entre 20 e 25 anos na tabela "Alunos".
SELECT * FROM Alumnos
WHERE Edad BETWEEN 20 AND 25;

-- Selecione os alunos que têm idade maior que 18 e que estudam na escola "Bom Jesus" na tabela "Alunos".
SELECT * FROM Alumnos
WHERE Edad > 18 AND Escola = 'Bom Jesus';

-- Escreva uma consulta SQL que calcule a média de idade dos alunos para cada escola
SELECT round(AVG(Edad), 2) AS Media_Edad
FROM Alumnos;

-- Selecione os alunos que obtiveram uma nota maior ou igual a 7 na disciplina de "Matemática".

SELECT * FROM Alumnos
WHERE Notas >= 17 AND Materia = 'Matematica';
-- Selecione os alunos que obtiveram uma nota menor que 5 na disciplina de "História".

SELECT * FROM Alumnos
WHERE Notas <15 AND Materia = 'Biología';

-- Selecione os alunos que têm o nome terminado com a letra "o" na tabela "Alunos".
SELECT * FROM Alumnos
where Nombre like '%o';

-- Selecione os alunos que estudam na escola "Escola Y" e têm idade menor que 30 anos na tabela "Alunos".
SELECT * FROM Alumnos
WHERE Edad <30 AND Escola = 'UEC. Monte Sacro';

-- Selecione os alunos que estudam na escola "Escola Z" ou têm mais de 35 anos na tabela "Alunos".
SELECT * FROM Alumnos
WHERE Edad >20 AND Escola = 'UEC. Monte Carmelo';

-- Ordene os alunos da tabela "Alunos" por nome em ordem alfabética.
SELECT * FROM Alumnos
ORDER BY Nombre ASC;

-- Conte quantos alunos obtiveram a nota máxima na disciplina de "Química".
SELECT COUNT(*) AS Nota_Maxima FROM Alumnos
WHERE Notas = 20 AND Materia = 'Quimica';

-- Selecione os alunos cujo nome contém a letra "e" e a idade é maior que 25 na tabela "Alunos".
SELECT * FROM Alumnos
where Nombre like '%e%' AND Edad > 25;

-- Escreva uma consulta SQL que liste o nome do aluno mais velho de cada escola
SELECT Nombre, Edad, Escola FROM Alumnos
WHERE Edad >= 50 ;



ALTER TABLE Alumnos
add Email;


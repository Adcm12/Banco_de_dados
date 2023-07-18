-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_1_2\aula3\Exercicio2.db

-- # Exercícios:

-- OBS: Se o exercício pedir por dados que ainda não existem, inserir os mesmos.
    -- Cada nota, corresponderá a uma matéria do aluno, portanto o alunos pode
    -- aparecer mais de um vez na tabela com notas distintas para cada matéria,
    -- no entando deve ter o id único com uma chave primária
    -- Se o exercício estiver muito difícil, pule e volte depois

-- Crie uma tabela chamada "Alunos" com as colunas id como inteiro e chave primária,
-- nome como texto, idade como inteiro, notas como double, matéria como texto.

-- Insira 20 linhas distintas na tabela alunos para cada linha, tente incluir diversidade nas notas e matérias.

-- Selecione todos os registros da tabela "Alunos".

-- Selecione apenas o nome e a idade dos alunos da tabela "Alunos".

-- Insira um novo aluno na tabela "Alunos" com nome "João" e idade 25, sem matéria e sem notas.

-- Selecione todas as colunas onde a matéria está com valor null.

-- Atualize a idade do aluno com id 10 para 22 anos na tabela "Alunos".

-- Selecione a maior idade presente na tabela "Alunos".

-- Selecione o menor valor da coluna "notas".

-- Ordene os alunos da tabela "Alunos" por nota em ordem decrescente.

-- Calcule a média das notas dos alunos.

-- Inserir mais 15 linhas com dados distintos, e modirifcar três linhas existentes em pelo menos duas colunas cada.

-- Crie uma coluna escola e insira as escolas para os alunos usando update 

-- Selecione os alunos cujo nome começa com a letra "A" na tabela "Alunos".

-- Ordene os alunos da tabela "Alunos" por idade em ordem crescente.

-- Selecione os alunos que têm idade entre 20 e 25 anos na tabela "Alunos".

-- Selecione os alunos que têm idade maior que 18 e que estudam na escola "Bom Jesus" na tabela "Alunos".

-- Escreva uma consulta SQL que calcule a média de idade dos alunos para cada escola

-- Selecione os alunos que obtiveram uma nota maior ou igual a 7 na disciplina de "Matemática".

-- Selecione os alunos que obtiveram uma nota menor que 5 na disciplina de "História".

-- Selecione os alunos que têm o nome terminado com a letra "o" na tabela "Alunos".

-- Selecione os alunos que estudam na escola "Escola Y" e têm idade menor que 30 anos na tabela "Alunos".

-- Selecione os alunos que estudam na escola "Escola Z" ou têm mais de 35 anos na tabela "Alunos".

-- Ordene os alunos da tabela "Alunos" por nome em ordem alfabética.

-- Conte quantos alunos obtiveram a nota máxima na disciplina de "Química".

-- Selecione os alunos cujo nome contém a letra "e" e a idade é maior que 25 na tabela "Alunos".

-- Escreva uma consulta SQL que liste o nome do aluno mais velho de cada escola.

CREATE TABLE IF NOT EXISTS Alumnos (

    id INTEGER PRIMARY KEY,
    Nombre text (40),
    Edad INTEGER,
    Notas DOUBLE,
    Materia TEXT (40)
);

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

SELECT * FROM Alumnos;

SELECT Nombre, Edad FROM Alumnos;

INSERT INTO Alumnos (Nombre, Edad)
Values('João', 25);

UPDATE Alumnos
SET Edad = 22
WHERE id = 10;

SELECT MAX(Edad) AS Edad_Mayor
FROM Alumnos;

SELECT MIN(Notas) AS Nota_menor
FROM Alumnos;

SELECT * from Alumnos
ORDER BY id ASC;

-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_1_2\aula3\mydatabase.db

SELECT SUM(idade) AS soma_idade
FROM Programadores
where idade >30;

SELECT SUM(id) AS soma_id
FROM Programadores;

SELECT * FROM Programadores
WHERE idade BETWEEN 25 AND 35;

SELECT * FROM Programadores
WHERE idade BETWEEN 10 AND 25;



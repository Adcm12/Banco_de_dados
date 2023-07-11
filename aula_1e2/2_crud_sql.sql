-- database: c:\Users\Apex02\Desktop\Banco_de_dados\aula_1e2\mydatabase.db

-- Usado para seleccionar datos especificos o no de una tabla de datos

SELECT nome, edad, email FROM Tabla
WHERE edad >18 AND nome  = 'Jose';

SELECT * FROM Tabla
WHERE nome = "Jose"
AND edad >18
AND id > 2;


-- Deletar datos

DELETE FROM Tabla
WHERE id < 5;


--Modificar datos de la tabela

UPDATE Tabla
SET nome = 'Test'
WHERE nome = 'Leo';



UPDATE Tabla
SET nome = 'Null', edad = 19, email ='AAAA@@@@'
WHERE id > 14
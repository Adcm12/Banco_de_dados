-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_1e2\Tabla.db

-- Usado para seleccionar datos especificos o no de una tabla de datos

SELECT nome, edad, email FROM Tabla
WHERE edad >18 AND nome  = 'Jose';

SELECT * FROM Contactos;


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
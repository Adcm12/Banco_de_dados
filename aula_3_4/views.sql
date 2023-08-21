-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_3_4\Exercicio2.db

CREATE VIEW SelectContactos AS  
select id, Nombre_usu, Edad_usu, Email_usu, Telefone
from Contactos;

SELECT * from SelectContactos;

DROP VIEW SelectContactos;

CREATE VIEW ProgramadoresUsuariosEmailMatch AS  
select Contactos.Nombre_usu As Programadores,
Contactos.Email_usu As Email,
Usuarios.Nombre_usu AS Usuario
From Contactos INNER JOIN Usuarios
ON Contactos.Email_usu = ,
WHERE Nombre_usu is not null 
ORDER BY Nombre_usu ASC;

SELECT * from ProgramadoresUsuariosEmailMatch;
-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_3_4\Exercicio2.db

CREATE VIEW SelectContactos AS  
select id, Nombre_usu, Edad_usu, Email_usu, Telefone
from Contactos;

SELECT * from SelectContactos;

DROP VIEW SelectContactos;
-- database: c:\Users\Adrian12\Desktop\Banco_de_dados\aula_1_2\BBDD.db


select max(edad) from Contactos;

select * from Contactos;

select min(edad) from Contactos;

-- AVG = avarage, que es la media
-- AS = como 

select avg(edad) as media_edad from Contactos;

-- COUNT = ejecuta cuentas en las columnas 

select count (*) from Contactos;

select count(email) from Contactos;

select count (*) from Contactos
where edad < 18;

select count(email) as cantidad_final from Contactos
where email is null;

select count(email) from Contactos;

insert into Contactos(nome, edad)
values('Arquimedes', 80 );

--LIKe sirve para bbuscar palabras o partes de palabras

select nome from Contactos
where nome like '%'
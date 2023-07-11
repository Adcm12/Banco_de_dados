#En el comienzo del archivo realizamos las importaciones necesarias
#Biblioteca SQLite que sirve para manipulas bancos de datos de sqlite
import sqlite3

#Bibblioteca que sirve para manipular el sistema operacional
import os

os.system('cls')

#Conexion con la BBDD
conexion = sqlite3.connect('Tabla.db')
print('Conexion creada con exito')

#Cursor para manipular el banco de datos
cursor = conexion.cursor()

#Variable para crear nueva tabla
nombre_tabla = ''

while True: 

    #Leer el nombre de la tabla

    nombre_tabla = input('Informe el nombre de la tabla: ')

    #Verificar si el nombre es valido

    if nombre_tabla != '' and len(nombre_tabla) > 3:

        print(f'Nombre {nombre_tabla} es valido para la tabla.')
        break

    else:

        print('Informa un nombre valido')


#Ejecutar comandos 
cursor.execute(f'''

    CREATE TABLE IF NOT EXISTS {nombre_tabla}(

        id INTEGER PRIMARY KEY,
        nome TEXT,
        edad INTEGER,
        email TEXT
    )

 ''')

print('Tabla creada con exito')

#pedir los datos al usuario 

usuario_nome = ''
usuario_edad = 0
usuario_email = ''


while True:

    # OBS: input por padrao recibe strings
    usuario_nome = input('Informe nombre: ')
    usuario_edad = input('Informe la edad: ')
    usuario_email = input('Informe el email: ')

    usuario_edad =int(usuario_edad)

    # validar los datos almacenados valores True False en vairables de validacion

    validacion = usuario_nome != '' and len(usuario_nome) >= 3
    validacion1 = usuario_edad > 10 and usuario_edad < 100
    validacion2 = usuario_edad != '' and '@' in usuario_email

    if validacion and validacion1 and validacion2 :

        print(f'Nome {usuario_nome}, edad {usuario_edad}, e email {usuario_email}, son datos validos')

        break
    
    else :
        print(f'Nombre es valido {validacion}')
        print(f'Edad es valido {validacion1}')
        print(f'Email es valido {validacion2}')
        print('Informe datos de validos')


# Inserir datos en la base de datos

cursor.execute(f'''

    INSERT INTO {nombre_tabla}( nome, edad, email)

    VALUES('{usuario_nome}', {usuario_edad} , '{usuario_email}')

 ''')

print('Datos inseridos con exito')

conexion.commit()
print('Comito datos con exito')

conexion.close()
print('Conexion cerrada con exito')
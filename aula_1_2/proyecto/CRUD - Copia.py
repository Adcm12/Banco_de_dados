#Importa librerias
import sqlite3
import os

#Limpia el terminal
os.system('cls')

if not os.path.exists('BBDD.db'):

    #Crea la base de datos
    conexionn = sqlite3.connect('BBDD.db')
    print('Base de datos creada con exito')
    cursor=conexionn.cursor()

    s_n= input('Debes crear una tabla de datos, quieres crear una? (s/n): ')

    if s_n == "s":
        # Obtener información del usuario
        nombre_tabla = input("Ingrese el nombre de la tabla: ")
        cantidad_columnas = int(input("Ingrese la cantidad de columnas que desea: "))

        # Crear la tabla
        consulta = f"CREATE TABLE {nombre_tabla} ("

        for i in range(cantidad_columnas):
            nombre_columna = input(f"Ingrese el nombre de la columna {i+1}: ")
            tipo_columna = input(f"Ingrese el tipo de dato para la columna {nombre_columna} (texto / entero): ")

            if tipo_columna.lower() == "texto":              
                consulta += f"{nombre_columna} TEXT"
            elif tipo_columna.lower() == "entero":
                consulta += f"{nombre_columna} INTEGER"

            if i < cantidad_columnas - 1:
                consulta += ", "
            else:
                consulta += ")"

        cursor.execute(consulta)
        conexionn.commit()

        print('Tabla creada con exito')
            
else:
    print('La base de datos ya existe')

#Mensaje para crud
menu_crud = '\n\nEscoje una opcion abajo: '
menu_crud += '\n\n1) Selecionar'
menu_crud += '\n2) Deletar'
menu_crud += '\n3) Actualizar'
menu_crud += '\n4) Inserir'
menu_crud += '\n5) Salir'
menu_crud += '\nInforme las opciones: '

#Bucle para utilizar el CRUD
while True:

    operacion = input(menu_crud)

    # Muestra la lista SELECT * FROM
    if operacion == '1':

        os.system('cls')

        cursor.execute(f'''
            SELECT * FROM {nombre_tabla}
        ''')

        resultado = cursor.fetchall()

        for item in resultado:

            print('\n', item)

    # Elimina la columna informada por la id \ DELETE FROM
    elif operacion == '2':

        nro_id = input('\nInforme un numero de la id: ')

        nro_id = int(nro_id)

        # Ler id de la columna a ser deletada

        cursor.execute(f''' 
                       
        DELETE FROM {nombre_tabla}
        WHERE id == {nro_id};

        ''')

        os.system('cls')
        print('Id eliminada con exito')

    # Actualiza la columna informada por la id \ UPDATE
    elif operacion == '3':

        # Leer la id de la columna a modificar
        nro_id = input('\nInforme un numero de la id: ')

        nombre = input('Informa el nuevo nombre: ')
        edad = input('Informa la nueva edad: ')
        email = input('Informa el nuevo email: ')

        todo= (nombre, edad, email)

        nro_id = int(nro_id)

        cursor.execute(f'''

        UPDATE Contactos
        SET nome == ?, edad == ?, email == ?
        WHERE id == {nro_id}

         ''', todo)
        
        # executar         
        conexionn.commit()

        # print mesaje        
        print('\nDatos cambiados con exito!')

    # Coloca en la BBDD nuevas columnas\ INSERT IN TO
    elif operacion == '4':

       # leer dados novos
        nombre = input('\nInforma el nuevo nombre: ')
        edad = input('Informa la nueva edad: ')
        email = input('Informa el nuevo email: ')
        
        # validar dados novos
        edad = int(edad)      

        validacion = nombre != '' and len(nombre) >= 3
        validacion1 = edad > 10 and edad < 100
        validacion2 = email != '' and '@' in email

        if validacion and validacion1 and validacion2 :

            print(f'\nNome {nombre}, edad {edad}, e email {email}, son datos validos')
            
        else :
            print(f'Nombre no es valido {validacion}')
            print(f'Edad no es valido {validacion1}')
            print(f'Email no es valido {validacion2}')
            print('Informe datos de validos')

        cursor.execute(f'''

            INSERT INTO Contactos ( nome, edad, email)

            VALUES('{nombre}', {edad} , '{email}')

        ''')

        print('Datos inseridos con exito')
        conexionn.commit()

    # Sale del bucle
    elif operacion == '5':
        # parar programa
        print('Parado con proceso')
        exit()
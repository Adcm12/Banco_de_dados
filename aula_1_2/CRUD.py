import sqlite3
import os

os.system('cls')

conexionn = sqlite3.connect('BBDD.db')
print('Conexion creada con exito')
cursor = conexionn.cursor()

#Mensaje para crud

menu_crud = '\n\nEscoje una opcion abajo: '
menu_crud += '\n\n1) Selecionar'
menu_crud += '\n2) Deletar'
menu_crud += '\n3) Actualizar'
menu_crud += '\n4) Inserir'
menu_crud += '\n5) Salir'
menu_crud += '\n6) Informe las opciones: '

while True:

    operacion = input(menu_crud)

    if operacion == '1':

        os.system('cls')

        cursor.execute(f'''
            SELECT * FROM Contactos
        ''')

        resultado = cursor.fetchall()

        for item in resultado:

            print('\n', item)

    elif operacion == '2':

        nro_id = input('\nInforme un numero de la id: ')

        nro_id = int(nro_id)

        # Ler id de la columna a ser deletada

        cursor.execute(f''' 
                       
        DELETE FROM Contactos
        WHERE id == {nro_id};

        ''')

        os.system('cls')
        print('Id eliminada con exito')

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
        print('Datos cambiados con exito!')


        ...
    
    elif operacion == '4':

       # leer dados novos
        nombre = input('Informa el nuevo nombre: ')
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
            print(f'Nombre es valido {validacion}')
            print(f'Edad es valido {validacion1}')
            print(f'Email es valido {validacion2}')
            print('Informe datos de validos')

        cursor.execute(f'''

            INSERT INTO Contactos ( nome, edad, email)

            VALUES('{nombre}', {edad} , '{email}')

        ''')

        print('Datos inseridos con exito')

        conexionn.commit()
        print('Comito datos con exito')


        # se es valido mostrar inserir en la BBDD

    elif operacion == '5':
        # parar programa
        print('Parado con proceso')
        exit()
import sqlite3
import os

os.system('cls')

conexion = sqlite3.connect('mydatabase.db')
print('Conexion creada con exito')
cursor = conexion.cursor()

#Mensaje para crud

menu_crud = '\n\nEscoje una opcion abajo: '
menu_crud += '\n1) Selecionar'
menu_crud += '\n2) Deletar'
menu_crud += '\n3) Actualizar'
menu_crud += '\n4) Inserir'
menu_crud += '\n5) Salir'
menu_crud += '\n6) Informe las opciones: '

while True:

    operacion = input(menu_crud)

    if operacion == '1':

        os.system('cls')

        cursor.execute('SELECT * FROM Contactos')

        resultado = cursor.fetchall()

        for item in resultado:
            print(item)

    # elif operacion == '2':

        # os.system('cls')

        # deletar = input('Informe un numero de la id: ')

        # delatar = int(deletar)

        # #Ler id de la columna a ser deletada

        # cursor.execute(''' 
                       
        # DELETE FROM Tabla
        # WHERE id = deletar;

        # ''')

        # print('Id eliminada con exito')
        # # executar o codigo SQL 

        # #Printar mesanje de exito
        
    elif operacion == '3':

        # Leer la id de la columna a modificar

        # executar 
        # print mesaje
        ...
    elif operacion == '4':
        
        # leer dados novos

        # validar dados novos
        
        # se es valido mostrar inserir en la BBDD

        ...
    elif operacion == '5':

        # parar programa
        print('Parado con proceso')

    
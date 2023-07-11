import sqlite3
import os

os.system('cls')

conexion = sqlite3.connect('mydatabase.db')
print('Conexion creada con exito')
cursor = conexion.cursor()

#Mensaje para crud

menu_crud = '\nEscoje una opcion abajo: '
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

        cursor.execute(f''' 
        SELECT * FROM Tabla
        ''')

        resultado = cursor.fetchall()

        # print(resultado)
        # print(type(resultado))

        for item in resultado:
            print(item)



    elif operacion == '2':
        ...
    elif operacion == '3':
        ...
    elif operacion == '4':
        ...
    elif operacion == '5':
        print('Parado con proceso')

    
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
    opcion = int(input(menu_crud))

    #Seleccionar
    if opcion == 1:
        nombre_tabla = input("Ingrese el nombre de la tabla que desea seleccionar: ")

        consulta = f"SELECT * FROM {nombre_tabla}"

        cursor.execute(consulta)
        filas = cursor.fetchall()

        for fila in filas:
            print(fila)

    #Deletar
    elif opcion == 2:

        nombre_tabla = input("Ingrese el nombre de la tabla en la que desea eliminar registros: ")

        columna_eliminar = input("Ingrese el nombre de la columna para eliminar registros: ")

        valor_eliminar = input("Ingrese el valor de la columna para eliminar registros: ")

        consulta = f"DELETE FROM {nombre_tabla} WHERE {columna_eliminar} = {valor_eliminar}"

        cursor.execute(consulta)
        conexionn.commit()
        print("Registros eliminados correctamente")

    #Actualizar
    elif opcion == 3:

        nombre_tabla = input("Ingrese el nombre de la tabla en la que desea actualizar registros: ")

        columna_actualizar = input("Ingrese el nombre de la columna para actualizar registros: ")

        valor_actualizar = input("Ingrese el valor nuevo para la columna: ")

        columna_condicion = input("Ingrese el nombre de la columna para la condición: ")

        valor_condicion = input("Ingrese el valor de la columna para la condición: ")

        consulta = f"UPDATE {nombre_tabla} SET {columna_actualizar} = {valor_actualizar} WHERE {columna_condicion} = {valor_condicion}"

        cursor.execute(consulta)
        conexionn.commit()
        print("Registros actualizados correctamente")

    #Insertar
    elif opcion == 4:

        nombre_tabla = input("Ingrese el nombre de la tabla en la que desea insertar registros: ")
        valores_insertar = []

        for i in range(cantidad_columnas):
            valor = input(f"Ingrese el valor para la columna {i+1}: ")
            valores_insertar.append(valor)

        consulta = f"INSERT INTO {nombre_tabla} VALUES ({','.join(valores_insertar)})"
        cursor.execute(consulta)
        conexionn.commit()
        print("Registros insertados correctamente")

    #Salir
    elif opcion == 5:
        break

    else:
        print("Opción inválida")
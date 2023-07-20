import sqlite3
import os

# Limpia el terminal
os.system('cls')

def crear_tabla(conexion, nombre_tabla, cantidad_columnas):
    # Crear la tabla
    consulta = f"CREATE TABLE {nombre_tabla} ("

    for i in range(cantidad_columnas):
        nombre_columna = input(f"Ingrese el nombre de la columna {i + 1}: ")
        tipo_columna = input(f"Ingrese el tipo de dato para la columna {nombre_columna} (texto / entero): ")

        if tipo_columna.lower() == "texto":
            consulta += f"{nombre_columna} TEXT"
        elif tipo_columna.lower() == "entero":
            consulta += f"{nombre_columna} INTEGER"

        if i < cantidad_columnas - 1:
            consulta += ", "
        else:
            consulta += ")"

    cursor = conexion.cursor()
    cursor.execute(consulta)
    conexion.commit()
    print('Tabla creada con éxito')

def insertar_registro(conexion, nombre_tabla):
    cursor = conexion.cursor()
    valores = []
    nombres_columnas = []

    # Obtener los nombres de las columnas
    cursor.execute(f"PRAGMA table_info{nombre_tabla}")
    column_info = cursor.fetchall()
    for col in column_info:
        nombres_columnas.append(col[1])

    # Obtener los valores del usuario
    for nombre_columna in nombres_columnas:
        valor = input(f"Ingrese el valor para la columna '{nombre_columna}': ")
        valores.append(valor)

    # Crear la consulta de inserción
    consulta = f"INSERT INTO {nombre_tabla} ({', '.join(nombres_columnas)}) VALUES ({', '.join(['?']*len(nombres_columnas))})"
    cursor.execute(consulta, valores)
    conexion.commit()
    print('Registro insertado con éxito')

def seleccionar_registros(conexion, nombre_tabla):
    cursor = conexion.cursor()
    cursor.execute(f"SELECT * FROM {nombre_tabla}")
    registros = cursor.fetchall()

    if registros:
        print(f"Registros en la tabla '{nombre_tabla}':")
        for registro in registros:
            print(registro)
    else:
        print("La tabla está vacía")

def eliminar_registro(conexion, nombre_tabla):
    cursor = conexion.cursor()
    identificador = int(input("Ingrese el ID del registro que desea eliminar: "))
    cursor.execute(f"DELETE FROM {nombre_tabla} WHERE rowid=?", (identificador,))
    conexion.commit()
    print('Registro eliminado con éxito')

def actualizar_registro(conexion, nombre_tabla):
    cursor = conexion.cursor()
    identificador = int(input("Ingrese el ID del registro que desea actualizar: "))
    nombres_columnas = []

    # Obtener los nombres de las columnas
    cursor.execute(f"PRAGMA table_info({nombre_tabla})")
    column_info = cursor.fetchall()
    for col in column_info:
        nombres_columnas.append(col[1])

    # Obtener los valores del usuario
    valores = []
    for nombre_columna in nombres_columnas:
        valor = input(f"Ingrese el nuevo valor para la columna '{nombre_columna}': ")
        valores.append(valor)

    # Crear la consulta de actualización
    consulta = f"UPDATE {nombre_tabla} SET {', '.join([f'{column}=?' for column in nombres_columnas])} WHERE rowid=?"
    cursor.execute(consulta, valores + [identificador])
    conexion.commit()
    print('Registro actualizado con éxito')

if not os.path.exists('BBDD.db'):
    # Crea la base de datos
    conexion = sqlite3.connect('BBDD.db')
    print('Base de datos creada con éxito')

    s_n = input('Debes crear una tabla de datos, quieres crear una? (s/n): ')

    if s_n.lower() == "s":
        # Obtener información del usuario
        nombre_tabla = input("Ingrese el nombre de la tabla: ")
        cantidad_columnas = int(input("Ingrese la cantidad de columnas que desea: "))
        crear_tabla(conexion, nombre_tabla, cantidad_columnas)

else:
    print('La base de datos ya existe')

# Mensaje para CRUD
menu_crud = '\n\nEscoje una opción abajo: '
menu_crud += '\n\n1) Seleccionar'
menu_crud += '\n2) Eliminar'
menu_crud += '\n3) Actualizar'
menu_crud += '\n4) Insertar'
menu_crud += '\n5) Salir'

# Abrir la conexión a la base de datos
conexion = sqlite3.connect('BBDD.db')
nombre_tabla = ""
while True:
    print(menu_crud)
    opcion = input('Informe la opción: ')

    if opcion == '1':
        seleccionar_registros(conexion, nombre_tabla)
    elif opcion == '2':
        eliminar_registro(conexion, nombre_tabla)
    elif opcion == '3':
        actualizar_registro(conexion, nombre_tabla)
    elif opcion == '4':
        insertar_registro(conexion, nombre_tabla)
    elif opcion == '5':
        # Salir del programa
        print('Saliendo...')
        break
    else:
        print('Opción no válida. Por favor, seleccione una opción válida.')
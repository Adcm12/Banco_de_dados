import sqlite3
import os

def create_table():

    conexion = sqlite3.connect("Comidas.db")
    cursor = conexion.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS Comidas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            Nombre TEXT,
            Valor REAL,
            Seccion TEXT ) ''')

    conexion.commit()
    print('\nTabla creada con exito!!!')


def inserir_dados(nome, valor, seccion):

    conexion = sqlite3.connect("Comidas.db")
    cursor = conexion.cursor()

    cursor.execute('INSERT INTO Comidas (Nombre, Valor, Seccion) VALUES (?, ?, ?)', (nome, valor, seccion))
    
    conexion.commit()
    print('\nDatos insertados correctamente!!')


def update(nome, valor):

    conexion = sqlite3.connect("Comidas.db")
    cursor = conexion.cursor()

    cursor.execute(f'''UPDATE Comidas 
                   SET Valor == ? 
                   WHERE Nombre == {nome}''', (valor))
    
    conexion.commit()
    print('\nDato actualizado con exito!!!')


def delete(nome):

    conexion = sqlite3.connect("Comidas.db")
    cursor = conexion.cursor()

    cursor.execute(f''' 
                    
    DELETE FROM Comidas
    WHERE Nombre == {nome}; ''')

    print('\nDato eliminado con exito!!!')


def mostrar(opcion, nome, seccion):

    conexion = sqlite3.connect("Comidas.db")
    cursor = conexion.cursor()

    if opcion == 1:
    
        cursor.execute(f''' 
                        
        SELECT * FROM Comidas
        WHERE Nombre == ? ''', (nome,))

        resultado = cursor.fetchone()

        if resultado:

            id, Nombre, Valor, Seccion = resultado
            print(f'\nId: {id} \nNombre: {Nombre} \nValor: {Valor} \nSeccion: {Seccion}')

        else:
            print("Comida no encontrada")
    
    elif opcion == 2:

        cursor.execute(f''' 
                        
        SELECT * FROM Comidas
        WHERE Seccion == ? ''', (seccion,))

        resultado = cursor.fetchall()

        if resultado:

            for id, Nombre, Valor, Seccion in (resultado):
                print(f'\nId: {id} \nNombre: {Nombre} \nValor: {Valor} \nSeccion: {Seccion}')

        else:
            print("No se encontraron comidas en esa sección")

    else:
        print('\nOpcion invalida!!!')


def main():

    while True:
            
        try:

            menu = '''\nMenu:
                \n1 - Crear Tabla
                \n2 - Mostrar comida
                \n3 - Inserir nuevos datos
                \n4 - Actualizar datos
                \n5 - Eliminar datos
                \n6 - Salir
                \nEscolha uma opção: '''
            
            escolha = input(menu)

            if escolha == '1':

                create_table()

            elif escolha == '2':
                
                opcion = int(input(f'\n1 - Mostrar por comida \n2 - Mostrar por seccion \n\nEscolha uma opção: '))
                
                if opcion == 1:

                    nome = input('\nNombre de la comida: ')
                    seccion = None

                elif opcion == 2: 
                    nome = None
                    seccion = input('\nSeccion de comida: ')

                else: 
                    print('\nOpcion invalida')

                mostrar(opcion, nome, seccion)

            elif escolha == '3':

                nome_n = input('Nombre de la comida: ')             
                valor_n = float(input('Valor: '))           
                seccion_n = input('Seccion de la comida: ')

                inserir_dados(nome_n, valor_n, seccion_n)     

            elif escolha == '6':
                break


        except Exception as e:
            print(f'Ocurrió un error: {str(e)}')

if __name__ == '__main__':
    os.system('cls')
    main()
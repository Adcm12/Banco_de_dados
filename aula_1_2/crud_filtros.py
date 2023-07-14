import os
import sqlite3
import pandas as pd

# Instalar o pandas na nossa máquina local
# com o comando pip install pandas

def ejecutar_comandos_sql(sql_string):

    """ Primera docstring: Funcion para ejecutar comando SQL en la base de datos usando PANDAS"""

    #Crear conexion
    conexion =sqlite3.connect('BBDD.db')

    #Funcion de pandas llamda read_sql_query ejecuta SQL
    #espera como parametros strings como el SQL a ser ejecutado
    # y la conexion com la base de datos 

    retorno_do_sql = pd.read_sql_query(sql_string, conexion)
  
   #Cerrar conexion
    conexion.close()

    #Retonar los datos de query 
    return retorno_do_sql


def mostrar_opciones(columnas_lista):

    """ Funcion para mostrar las opciones disponibles para el usuario """

    print('\nColumnas disponinbles: ')

    #Printar los datos usando un for en la lista con las columnas disponibles
    for indice, columna_string in enumerate(columnas_lista):
        print(f'Columna {indice+1}: {columna_string}')

    #el enumerate permite que sea posible rodar el for com dos variables 
    #uno siendo el indice (i) de la linea, y otra siendo el valor
    #  
    print('\n')


def retornar_media_columna(columna_nome):

    """ FUncion para retonar la media de una columna informada por el usuario"""

    #COmando SQL
    sql_string = f'select avg({columna_nome}) from Contactos'

    #Ejecutar el SQL
    retorno = ejecutar_comandos_sql(sql_string)

    #Mostrar el resultado
    print('\n')
    print('MÉDIA:')
    print(retorno)


def contar_lineas_coluna(columna_nome):

    """ Funcion para dar un COunt en la columna informada"""

    # COmando sql
    sql_string = f'select count({columna_nome}) from Contactos'

    # Executar o SQL
    retorno = ejecutar_comandos_sql(sql_string)

    # Mostrar o resultado
    print('\n')
    print('COUNT:')
    print(retorno)


def buscar_palabras(nombre_columna, tipo_busca, string_usuario): 

    """ Funcion para buscar palabras usando el like"""

    # Crear el string com el padrao de la palbra que sera buscado
    string_busqueda = ''

    if tipo_busca == 'start':
        string_busqueda= f"'{string_usuario}%'"
    elif tipo_busca == 'end':
        string_busqueda= f"'%{string_usuario}'"
    elif tipo_busca == 'medio':
        string_busqueda= f"'%{string_usuario}%'"

    else:
        print('Tipo de busqueda es invalido')

    # Comando SQL
    sql_string = f"""

    select * from Contactos\
    where {nombre_columna} LIKE {string_busqueda}

    """
    # Executar o SQL
    retorno = ejecutar_comandos_sql(sql_string)

    # Mostrar o resultado
    print('\n')
    print('LIKE:')
    print(retorno)


def retornar_minEmax(columna_nome):

    """ Funcion para retornar el menor y el mayor de la columna"""

    # Comando SQL
    sql_string = f'select max({columna_nome}), min({columna_nome}) from Contactos'

    # Executar o SQL
    retorno = ejecutar_comandos_sql(sql_string)

    # Mostrar o resultado
    print('\n')
    print('MIN-MAX:')
    print(retorno)


#START
os.system('cls')
# Usando o PRAGMA table_info() para buscar informações sobre a tabela usuário
sql_retorno_columnas = 'PRAGMA table_info(Contactos)'
# Executando o SQL
columnas= ejecutar_comandos_sql(sql_retorno_columnas)
# Separado apenas as colunas do retorno SQL
columnas_listas = columnas ['name'].tolist()
# Variável contador que vai contar quantas operações no banco de dados foram realizadas
contador = 0

# print(columnas_listas)

rodar= True 

while rodar is True:

    print('\n')
    mostrar_opciones(columnas_listas)
    print('Digite s para salir\n')

    columna_posicion= input('Informe la poscion de la columna a manipular: ')

    if columna_posicion == 's':
        break

    columna_posicion= int(columna_posicion)

    if columna_posicion > 0 and columna_posicion <= len(columnas_listas) :

        columna_nome =  columnas_listas[columna_posicion -1]
        print(f'columna {columna_nome} seleccionada con exito ')

        menu_operaciones = '\n1) Media'
        menu_operaciones += '\n2) Count'
        menu_operaciones +='\n3) Busca usando LIKE'
        menu_operaciones +='\n4) Min / MAX'
        menu_operaciones +='\nInforme la operacion: '

        operacion = int(input(menu_operaciones))

        if operacion == 1:

            retornar_media_columna(columna_nome)

        elif operacion ==2:

            contar_lineas_coluna(columna_nome)

        elif operacion == 3:
            
            menu_input = '\n1) start'
            menu_input += '\n2) end'
            menu_input += '\n3) medio'
            menu_input += '\n Informe la poscion: '

            tipo_busca = input(menu_input)

            string_usuario = input('\nInforme el string que ira  para buscar en el banco: ')

            buscar_palabras(columna_nome, tipo_busca, string_usuario)

        elif operacion == 4:

            retornar_minEmax(columna_nome)

        elif operacion == 5:

            break

    else:

        print('Informe una poscion valida')



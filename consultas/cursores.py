import mysql.connector


cnx = mysql.connector.connect(user='userBienestar', password='Bienestar123.',
                              host='bienestar-db.mysql.database.azure.com',
                              database='bienestar-db')
cursor = cnx.cursor()

def horas_estudiante(id):
    query =f'call horas_bienestar_estudiante({id})'
    cursor.execute(query)

    filas=cursor.fetchall()

    columnas=cursor.column_names
   
    resultados = [dict(zip(columnas, fila)) for fila in filas]

    return resultados






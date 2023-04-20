from fastapi import FastAPI,Response
from fastapi.responses import FileResponse
from openpyxl import Workbook
from openpyxl.utils.dataframe import dataframe_to_rows
from modelos.reportes import Estudiantes,session,Eventos,engine,text
from fastapi.middleware.cors import CORSMiddleware
import json
import pandas as pd

app = FastAPI()

origins = [
    "http://localhost",
    "http://localhost:8080",
    "http://127.0.0.1",
    "http://127.0.0.1:8080",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_methods=["*"],
    allow_headers=["*"],
)



@app.get("/")
async def read_root():
    return {"Hello": "World"}

@app.get('/api/estudiantes/')
async def ver_estudiantes():
    estudiantes=session.query(Estudiantes).all()
    return estudiantes

@app.get('/api/estudiantes/{id}')
async def ver_estudiante(id):
    estudiante =session.query(Estudiantes).get(id)
    return estudiante

@app.get('/api/eventos/')
async def ver_eventos():
    eventos = session.query(Eventos).all()
    return eventos


@app.get('/api/estudiantes_programa/')
async def estudiantes_carrera():
    with engine.connect() as conn:
        query = text('SELECT * FROM estudiantes_programa')
        result = conn.execute(query)
    columnas = result.keys()

    # Convertir los resultados a una lista de diccionarios
    filas = result.fetchall()
    resultados = [dict(zip(columnas, fila)) for fila in filas]

    jason=json.dumps(resultados)
    jason=json.loads(jason)

    return jason
  
@app.get('/reporte_excel/')
async def generar_reporte(reponse:Response):
    with engine.connect() as conn:
        query = text('SELECT * FROM estudiantes_programa')
        result = conn.execute(query)
    # columnas = result.keys()
    # filas = result.fetchall()
    df=pd.DataFrame(result.fetchall(),columns=result.keys())
    libro = Workbook()
    hoja = libro.active
    hoja.title='estudiantesXprograma'

    for row in dataframe_to_rows(df, index=False, header=True):
        hoja.append(row)

    # Escribir los datos
    for row in dataframe_to_rows(df, index=False, header=False):
        hoja.append(row)
    
    nombre_archivo = "reporte.xlsx"
    libro.save(nombre_archivo)
    return FileResponse(nombre_archivo, media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")

@app.get('/api/horas_estudiante/')
async def ver_horas_estudiantes():
    with engine.connect() as conn:
        query = text('SELECT * FROM horas_estudiantes')
        result = conn.execute(query)
    columnas = result.keys()

    # Convertir los resultados a una lista de diccionarios
    filas = result.fetchall()
    resultados = [dict(zip(columnas, fila)) for fila in filas]

    print(resultados)
  

    return resultados

@app.get('/api/horas_estudiante/generar_reporte')
async def generar_reporte_horas(response:Response):
    with engine.connect() as conn:
        query = text('SELECT * FROM horas_estudiantes')
        result = conn.execute(query)
    # columnas = result.keys()
    # filas = result.fetchall()
    df=pd.DataFrame(result.fetchall(),columns=result.keys())
    libro = Workbook()
    hoja = libro.active
    hoja.title='estudiantesXhoras'

    for row in dataframe_to_rows(df, index=False, header=True):
        hoja.append(row)

    # Escribir los datos
    for row in dataframe_to_rows(df, index=False, header=False):
        hoja.append(row)
    
    nombre_archivo = "reporte.xlsx"
    libro.save(nombre_archivo)
    return FileResponse(nombre_archivo, media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
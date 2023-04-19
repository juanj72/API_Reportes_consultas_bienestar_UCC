from fastapi import FastAPI
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
  

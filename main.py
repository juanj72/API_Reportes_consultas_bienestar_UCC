from fastapi import FastAPI
from modelos.reportes import Estudiantes,session,Eventos
from modelo import modelo
from fastapi.middleware.cors import CORSMiddleware

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
def read_root():
    return {"Hello": "World"}

@app.get("/variable/{id}")
def parametros_datos(id):

    return {"variable":id,"message":'perro asqueroso'}

@app.get('/prueba_parametro_entero/{id}')
def parametros(id:int):
    print()
    return {"parametro":id}

@app.post('/modelo')
def modelo(modelo:modelo):
    return modelo

@app.get('/api/estudiantes/')
def ver_estudiantes():
    estudiantes=session.query(Estudiantes).all()
    return estudiantes

@app.get('/api/eventos/')
def ver_eventos():
    eventos = session.query(Eventos).all()
    return eventos
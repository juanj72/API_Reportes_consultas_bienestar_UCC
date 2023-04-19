from fastapi import FastAPI
from modelos.reportes import Estudiantes,session
from modelo import modelo

app = FastAPI()



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

@app.get('/estudiantes')
def ver_estudiantes():
    estudiantes=session.query(Estudiantes).all()
    return estudiantes
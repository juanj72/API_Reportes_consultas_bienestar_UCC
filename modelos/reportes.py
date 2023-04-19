from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql+mysqlconnector://userBienestar:Bienestar123.@bienestar-db.mysql.database.azure.com/bienestar-db')
Session = sessionmaker(bind=engine)
session = Session()

Base = declarative_base()

class Estudiantes(Base):
    __tablename__='estudiante'
    idEstudiante=Column(Integer,primary_key=True)
    Perfil_idPerfil=Column(Integer)
    Programa_idPrograma=Column(Integer)
    nombre = Column(String) 
    apellido = Column(String) 
    telefono = Column(String) 
    codigo = Column(Integer)




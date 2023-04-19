
from pydantic import BaseModel


class modelo(BaseModel):
    nombre : str
    descripcion : str | None

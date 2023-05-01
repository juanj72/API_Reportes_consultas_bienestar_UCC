from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class Rol(models.Model):
    descripcion = models.CharField(max_length=255)
    def __str__(self):
        return str(self.descripcion)

class Programa(models.Model):
    codigo = models.CharField(max_length=255)
    nombre = models.CharField(max_length=255)

class Estado (models.Model):
    nombre = models.CharField(max_length=255)
    def __str__(self):
        return str(self.nombre)


class Perfil(AbstractUser):
    email = models.EmailField(unique=True)
    rol = models.ForeignKey(Rol, on_delete=models.SET_NULL,null=True,blank=True)
    def __str__(self):
        return str(self.first_name)+' '+str(self.last_name)


class Estudiante(models.Model):
    perfil = models.ForeignKey(Perfil,on_delete=models.SET_NULL,null=True,blank=False)
    documento = models.IntegerField()
    telefono = models.IntegerField()
    def __str__(self):
        return str(self.perfil)

class Administrativo(models.Model):
    perfil = models.ForeignKey(Perfil,on_delete=models.SET_NULL,null=True)
    documento = models.IntegerField()
    telefono = models.IntegerField()
    cargo = models.CharField(max_length=255)
    def __str__(self):
        return str(self.perfil)


class Actividad (models.Model):
    nombre = models.CharField(max_length=255)
    administrativo = models.ForeignKey(Administrativo,on_delete=models.SET_NULL,null=True)
    descripcion = models.TextField()
    lugar = models.CharField(max_length=255)
    estado = models.ForeignKey(Estado,on_delete=models.SET_NULL,null=True)

class Evento (models.Model):
    nombre = models.CharField(max_length=255)
    administrativo = models.ForeignKey(Administrativo,on_delete=models.SET_NULL,null=True)
    descripcion = models.TextField()
    lugar = models.CharField(max_length=255)
    fecha_inicio = models.DateField()
    fecha_fin= models.DateField()
    Estado = models.ForeignKey(Estado,on_delete=models.SET_NULL,null=True)

    



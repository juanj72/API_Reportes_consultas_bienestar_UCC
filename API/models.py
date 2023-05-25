from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.


class Rol(models.Model):
    descripcion = models.CharField(max_length=255)

    def __str__(self):
        return str(self.descripcion)


class Dia(models.Model):
    nombre = models.CharField(max_length=255)

    def __str__(self):
        return str(self.nombre)


class Programa(models.Model):
    codigo = models.CharField(max_length=255)
    nombre = models.CharField(max_length=255)

    def __str__(self):
        return str(self.nombre)


class Estado (models.Model):
    nombre = models.CharField(max_length=255)

    def __str__(self):
        return str(self.nombre)


class Perfil(AbstractUser):
    email = models.EmailField(unique=True)
    rol = models.ForeignKey(
        Rol, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return str(self.first_name)+' '+str(self.last_name)


class Estudiante(models.Model):
    perfil = models.ForeignKey(
        Perfil, on_delete=models.SET_NULL, null=True, blank=False)
    documento = models.IntegerField()
    telefono = models.IntegerField()
    programa = models.ForeignKey(
        Programa, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return str(self.perfil)


class Administrativo(models.Model):
    perfil = models.ForeignKey(Perfil, on_delete=models.SET_NULL, null=True)
    documento = models.IntegerField()
    telefono = models.IntegerField()
    cargo = models.CharField(max_length=255)

    # Campo Para Saber si necesita reporte automatico
    reporte = models.BooleanField(default=False)

    def __str__(self):
        return str(self.perfil)


class Tarea(models.Model):
    administrador = models.ForeignKey(Administrativo, on_delete=models.CASCADE)
    dia = models.IntegerField(null=True, blank=False)
    hora = models.IntegerField(null=True, blank=False)
    minuto = models.IntegerField(null=True, blank=False)
    task_id = models.CharField(max_length=255, null=True, blank=False)


class Actividad (models.Model):
    nombre = models.CharField(max_length=255)
    administrativo = models.ForeignKey(
        Administrativo, on_delete=models.SET_NULL, null=True)
    descripcion = models.TextField()
    lugar = models.CharField(max_length=255)
    estado = models.ForeignKey(Estado, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return str(self.nombre)


class Evento (models.Model):
    nombre = models.CharField(max_length=255)
    administrativo = models.ForeignKey(
        Administrativo, on_delete=models.SET_NULL, null=True)
    descripcion = models.TextField()
    lugar = models.CharField(max_length=255)
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    Estado = models.ForeignKey(Estado, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return str(self.nombre)


class ActividadDia(models.Model):
    dia = models.ForeignKey(Dia, on_delete=models.SET_NULL, null=True)
    actividad = models.ForeignKey(
        Actividad, on_delete=models.SET_NULL, null=True)
    hora_inicio = models.TimeField()
    hora_fin = models.TimeField()


class AsistenciaEvento(models.Model):
    estudiante = models.ForeignKey(
        Estudiante, on_delete=models.SET_NULL, null=True)
    evento = models.ForeignKey(Evento, on_delete=models.SET_NULL, null=True)
    horas_registradas = models.IntegerField()
    fecha = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.evento)+' - '+str(self.estudiante)


class AsistenciaActividad(models.Model):
    estudiante = models.ForeignKey(
        Estudiante, on_delete=models.SET_NULL, null=True)
    actividad = models.ForeignKey(
        Actividad, on_delete=models.SET_NULL, null=True)
    horas_registradas = models.IntegerField()
    fecha = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.actividad)+' - '+str(self.estudiante)

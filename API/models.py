from django.db import models

# Create your models here.



class django_migrations(models.Model):
    id=models.IntegerField(primary_key=True)
    app = models.CharField(max_length=255)
    name=models.CharField(max_length=255)
    applied =models.DateTimeField()
    class Meta:
        db_table='django_migrations'


class evento(models.Model):
    idEvento=models.IntegerField(primary_key=True)
    Administrativo_idAdministrativo=models.IntegerField()
    nombre_evento=models.CharField(max_length=255)
    descripcion=models.CharField(max_length=255)
    fecha_inicio=models.DateTimeField()
    fecha_final=models.DateTimeField()
    estado=models.CharField(max_length=255)
    correccion=models.CharField(max_length=255)
    class Meta:
        db_table='evento'


class programa(models.Model):
    idPrograma=models.IntegerField(primary_key=True)
    nombre_programa=models.CharField(max_length=255)
    codigo_programa=models.CharField(max_length=255)
    class Meta:
        db_table = 'programa'
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

from django.db import models

# Create your models here.

class administrativo(models.Model):
    idAdministrativo=models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=80)
    apellido = models.CharField(max_length=80)
    cargo =  models.CharField(max_length=80)
    documento = models.CharField(max_length=20)
    codigo = models.IntegerField()
    
    class Meta:
        db_table = 'administrativo'

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


class rol(models.Model):
    idRol = models.IntegerField(primary_key=True)
    nombre_rol=models.CharField(max_length=255)
    class Meta:
        db_table = 'rol'

class perfil(models.Model):
    idPerfil = models.IntegerField(primary_key=True)
    Rol_idRol = models.ForeignKey(rol,on_delete=models.SET_NULL,null=True)
    class Meta:
        db_table='perfil'

class estudiante(models.Model):
    idEstudiante = models.IntegerField(primary_key=True)
    Perfil_idPerfil = models.ForeignKey(perfil,on_delete=models.SET_NULL,null=True,db_column='Perfil_idPerfil')
    Programa_idPrograma = models.ForeignKey(programa,on_delete=models.SET_NULL,null=True,db_column='Programa_idPrograma')
    nombre = models.CharField(max_length=255)
    apellido = models.CharField(max_length=255)
    telefono = models.IntegerField()
    codigo = models.IntegerField(unique=True)
    class Meta:
        db_table='estudiante'
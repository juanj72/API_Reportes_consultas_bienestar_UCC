from django.db import models

# Create your models here.



class django_migrations(models.Model):
    id=models.IntegerField(primary_key=True)
    app = models.CharField(max_length=255)
    name=models.CharField(max_length=255)
    applied =models.DateTimeField()
    class Meta:
        db_table='django_migrations'
        

from rest_framework import serializers
from API.models import *


class migraciones_serializador(serializers.ModelSerializer):
    class Meta:
        model=django_migrations
        fields='__all__'


class pedir_datos_serialziador(serializers.Serializer):
    estado=serializers.CharField(max_length=200)
    edad=serializers.IntegerField()
    otra_variable=serializers.CharField(max_length=200)
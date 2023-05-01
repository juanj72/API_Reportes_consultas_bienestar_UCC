from rest_framework import serializers
from API.models import *

class serializadorEventos(serializers.ModelSerializer):
    class Meta:
        model = Evento
        fields = '__all__'



class listaSerializada(serializers.ListSerializer):
    child = serializers.DictField(child=serializers.CharField())

class RowSerializer(serializers.Serializer):
    # Aquí definimos los campos que queremos mostrar de cada fila
    id = serializers.IntegerField()
    nombre = serializers.CharField()
    descripcion = serializers.CharField()
    lugar = serializers.CharField()
    fecha_inicio = serializers.DateField()
    fecha_fin = serializers.DateField()
    administrativo = serializers.CharField()


    class Meta:
        list_serializer_class = listaSerializada
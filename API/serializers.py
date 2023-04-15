from rest_framework import serializers
from API.models import *



class consulta_eventos_seri(serializers.ModelSerializer):
    class Meta:
        model=evento
        fields='__all__'



class pedir_datos_evento(serializers.Serializer):
    id=serializers.IntegerField()


class programas_serializador(serializers.ModelSerializer):
    class Meta:
        model=programa
        fields='__all__'

class administrativos_serializer(serializers.ModelSerializer):
    class Meta:
        model=administrativo
        fields='__all__'


class estudiante_serializer(serializers.ModelSerializer):
    class Meta:
        model = estudiante
        fields = '__all__'


class consultar_estudiante_serializer(serializers.Serializer):
    id=serializers.IntegerField()


class perfil_serializer(serializers.ModelSerializer):
    class Meta:
        model = perfil
        fields = '__all__'
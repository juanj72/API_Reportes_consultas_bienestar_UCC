from rest_framework import serializers
from API.models import *


class serializadorEventos(serializers.ModelSerializer):
    class Meta:
        model = Evento
        fields = '__all__'

class ReporteAutomaticoSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tarea
        fields = '__all__'
        

class ReporteUpdateSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Tarea
        fields = ['dia','hora','minuto']
    

class tareaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tarea
        fields = '__all__'
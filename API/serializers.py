from rest_framework import serializers
from API.models import *

class serializadorEventos(serializers.ModelSerializer):
    class Meta:
        model = Evento
        fields = '__all__'



from django.shortcuts import render
from API.models import django_migrations
from API.serializers import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics

# Create your views here.


#mostrar datos de un modelo
class inicio(generics.ListAPIView):
    queryset = django_migrations.objects.all()
    serializer_class=migraciones_serializador
 


#ejemplo para pedir datos para consulta, o guardarlos en el modelo
class ejemplo_request(APIView):
    def post(self, request, format=None):
        serializer = pedir_datos_serialziador(data=request.data)
        if serializer.is_valid():
            nombre = serializer.validated_data['estado']
            edad = serializer.validated_data['edad']
            otra_variable=serializer.validated_data['otra_variable']
            
            return Response({'mensaje': f'Hola, {nombre} de {edad} años! y esta es otra variable: {otra_variable}'})
        else:
            return Response(serializer.errors, status=400)
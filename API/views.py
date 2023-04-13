from django.shortcuts import render
from API.models import django_migrations,evento,programa,administrativo
from API.serializers import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics
from rest_framework.generics import ListAPIView
from rest_framework.viewsets import ModelViewSet

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
            return Response({'mensaje': f'Hola, {nombre} de {edad} años! {otra_variable}' })
        else:
            return Response(serializer.errors, status=400)
        


class todos_los_eventos(ModelViewSet):
    queryset=evento.objects.all()
    serializer_class=consulta_eventos_seri


class unico_evento(APIView):
    def post(self, request, format=None):
        serializer = pedir_datos_evento(data=request.data)
        if serializer.is_valid():
            id = serializer.validated_data['id']
            evento_obj = evento.objects.get(idEvento=id)
            serializer = consulta_eventos_seri(evento_obj)  # usa el mismo objeto serializer para serializar los datos del evento
            return Response(serializer.data)
        else:
            return Response(serializer.errors)
    

class programas_lista(ListAPIView):
    queryset=programa.objects.all()
    serializer_class=programas_serializador


class administrativos_total(ListAPIView):
    queryset=administrativo.objects.all()
    serializer_class=administrativos_serializer


class ver_estudiantes(ListAPIView):
    queryset = estudiante.objects.all()
    serializer_class = estudiante_serializer
    def post(self, request, format=None):
        serializer = consultar_estudiante_serializer(data=request.data)
        if serializer.is_valid():
            id = serializer.validated_data['id']
            estudiante_obj = estudiante.objects.get(idEstudiante=id)
            serializer = estudiante_serializer(estudiante_obj)  # usa el mismo objeto serializer para serializar los datos del evento
            return Response(serializer.data)
        else:
            return Response(serializer.errors)


        

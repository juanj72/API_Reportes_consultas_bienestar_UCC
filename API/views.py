from django.shortcuts import render
from API.serializers import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics
from rest_framework.generics import ListAPIView
from rest_framework.viewsets import ModelViewSet
from django.db import connection
from django.http.response import JsonResponse
from openpyxl import Workbook
from django.http import HttpResponse
from API.models import *

# Create your views here.


#mostrar datos de un modelo


class eventosClaseVista(ModelViewSet):
    serializer_class = serializadorEventos
    queryset = Evento.objects.all()


class mostrarEventos(APIView):
    def get (self,request):
        with connection.cursor() as cursor:
            consulta = """
                    SELECT 
                    ev.id as id,
                    ev.nombre as nombre,
                    ev.descripcion as descripcion,
                    ev.lugar as lugar,
                    ev.fecha_inicio as fecha_inicio,
                    ev.fecha_fin as fecha_fin,
                    CONCAT(pe.first_name, ' ', pe.last_name) AS 'administrativo'
                FROM
                    api_evento ev
                        INNER JOIN
                    api_administrativo ad
                    on ev.administrativo_id = ad.id
                        INNER JOIN
                    api_perfil pe
                    on pe.id=ad.perfil_id
            """
            cursor.execute(consulta)
            rows = cursor.fetchall()
         

           
            return Response(rows)


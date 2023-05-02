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
    def get(self,request):
        with connection.cursor() as cursor:  # Activamos un cursor para las consultas a la BD
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
        # Ejecutar una linea SQL En este caso llamamos un procedimiento almacenado
            cursor.execute(consulta)

            columns = []  # Para guardar el nombre de las columnas

            # Recorrer la descripcion (Nombre de la columna)
            for column in cursor.description:

                columns.append(column[0])  # Guardando el nombre de las columnas

            data = []  # Lista con los datos que vamos a enviar en JSON

            for row in cursor.fetchall():  # Recorremos las fila guardados de la BD

                # Insertamos en data un diccionario
                data.append(dict(zip(columns, row)))

            cursor.close()  # Se cierra el cursor para que se ejecute el procedimiento almacenado

            connection.commit()  # Enviamos la sentencia a la BD
            connection.close()  # Cerramos la conección

        return Response(data)


class verEstudiantes(APIView):
    def get(self,request):

        with connection.cursor() as cursor:  # Activamos un cursor para las consultas a la BD
            consulta = """
            SELECT 
                    est.id,
                    est.documento,
                    CONCAT(pe.first_name, ' ', pe.last_name) AS nombre,
                    pe.email as correo,
                     est.telefono,
                    pro.nombre as programa
                FROM
                    api_estudiante est
                        INNER JOIN
                    api_perfil pe ON pe.id = est.perfil_id
                        INNER JOIN
                    api_programa pro ON pro.id = est.programa_id
                        """
        # Ejecutar una linea SQL En este caso llamamos un procedimiento almacenado
            cursor.execute(consulta)

            columns = []  # Para guardar el nombre de las columnas

            # Recorrer la descripcion (Nombre de la columna)
            for column in cursor.description:

                columns.append(column[0])  # Guardando el nombre de las columnas

            data = []  # Lista con los datos que vamos a enviar en JSON

            for row in cursor.fetchall():  # Recorremos las fila guardados de la BD

                # Insertamos en data un diccionario
                data.append(dict(zip(columns, row)))

            cursor.close()  # Se cierra el cursor para que se ejecute el procedimiento almacenado

            connection.commit()  # Enviamos la sentencia a la BD
            connection.close()  # Cerramos la conección

        return Response(data)
    

class consultaEstudiante(APIView):
    def get(self,request,id):
        resultados = f'hola perross {id}'
        return Response (resultados)
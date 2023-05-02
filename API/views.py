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
from rest_framework.authtoken.models import Token
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated

# Create your views here.


#mostrar datos de un modelo






class eventosClaseVista(ModelViewSet):
    permission_classes = [IsAuthenticated]
    serializer_class = serializadorEventos
    queryset = Evento.objects.all()


class mostrarEventos(APIView):
    permission_classes = [IsAuthenticated]

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
    permission_classes = [IsAuthenticated]

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
    permission_classes = [IsAuthenticated]

    def get(self,request,id):
        with connection.cursor() as cursor:  # Activamos un cursor para las consultas a la BD
            consulta = f"""
            SELECT 
    est.id,
    est.documento,
    CONCAT(pe.first_name, ' ', pe.last_name) AS estudiante,
    pe.email,
    sum(asis.horas_registradas) as horas_eventos,
    sum(asis_ac.horas_registradas) as horas_actividades,
     sum(asis.horas_registradas)+sum(asis_ac.horas_registradas) as total_horas
    
FROM
    api_estudiante est
        INNER JOIN
    api_perfil pe ON pe.id = est.perfil_id
        INNER JOIN
    api_asistenciaevento asis ON asis.estudiante_id = est.id
    left join api_asistenciaactividad asis_ac on asis_ac.estudiante_id=est.id 
    
    where est.id={id}
    
    group by est.id
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
    


class EstudiantesPrograma(APIView):
    def get(self,request):
        with connection.cursor() as cursor:  # Activamos un cursor para las consultas a la BD
            consulta = f"""
            SELECT 
            pro.nombre,count( est.id) as cantidad_est
            FROM
                api_estudiante est
                    INNER JOIN
                api_programa pro ON pro.id = est.programa_id
                
             group by pro.id

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
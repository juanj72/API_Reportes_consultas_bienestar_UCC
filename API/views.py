from django.shortcuts import render
from API.models import django_migrations,evento,programa,administrativo
from API.serializers import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics
from rest_framework.generics import ListAPIView
from rest_framework.viewsets import ModelViewSet
from django.db import connection
from django.http.response import JsonResponse
from openpyxl import Workbook

# Create your views here.


#mostrar datos de un modelo
class inicio(generics.ListAPIView):
    queryset = django_migrations.objects.all()
    serializer_class=migraciones_serializador
       

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




def estudiantes_programa(request):
    with connection.cursor() as cursor:  # Activamos un cursor para las consultas a la BD

        # Ejecutar una linea SQL En este caso llamamos un procedimiento almacenado
        cursor.execute('select * from estudiantes_programa')

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

        return JsonResponse(data,safe=False)
    



def descargar_canceladas(request,fecha_inicio,fecha_fin):
    # Crear un cursor y ejecutar una consulta
    from django.db import connection
    with connection.cursor() as cursor:
        cursor.execute(f'call reporte_ordenes_canceladas_fecha(\'{fecha_inicio}\',\'{fecha_fin}\')')
        datos = cursor.fetchall()

    # Generar el archivo de Excel
    wb = Workbook()
    ws = wb.active
    ws.title = f'C{fecha_inicio} a {fecha_fin}'
    ws.append(['Tecnico', 'Numero de orden', 'Numero de cuenta','Cliente','Telefono cliente','Documento Cliente','Correo Cliente','Estado de la orden','Estado Tecnico','Tipo de servicio','Fecha ingreso orden'])

    for fila in datos:
        ws.append(list(fila))

    # Devolver el archivo de Excel como una respuesta
    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=reporte.xlsx'
    wb.save(response)
    return response
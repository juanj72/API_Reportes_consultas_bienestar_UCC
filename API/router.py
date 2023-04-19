from rest_framework.routers import DefaultRouter
from API.views import *
from django.urls import path


router_reportes = DefaultRouter()

router_reportes.register(prefix='eventos',basename='eventos',viewset=todos_los_eventos)
router_reportes.register(prefix='perfiles',basename='perfil',viewset=perfiles)

urlpatterns=[
    path('consulta_evento/',unico_evento.as_view()),
    path('programas/',programas_lista.as_view()),
    path('estudiantes/',ver_estudiantes.as_view()),
    path('estudiantes_programa/',estudiantes_programa),
    path('reporte_estudiantes_programa/',estudiantes_programa_report)


]

urlpatterns+=router_reportes.urls
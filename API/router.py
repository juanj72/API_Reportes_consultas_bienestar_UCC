from rest_framework.routers import DefaultRouter
from API.views import *
from django.urls import path
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)


router_reportes = DefaultRouter()

router_reportes.register(prefix='eventos',basename='evento',viewset=eventosClaseVista)



urlpatterns=[
    path('mostrarEventos/',mostrarEventos.as_view()),
    path('estudiantes/',verEstudiantes.as_view()),
    path('consultaEstudiante/<int:id>',consultaEstudiante.as_view()),
    path('EstudiantesPrograma/',EstudiantesPrograma.as_view()),
    path('auth/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('auth/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('asistenciaActividades',asistenciaActividades.as_view()),
    path('asistenciaEventos',asistenciaEventos.as_view()),
    path('actividades/',Actividades.as_view()),
    path('horasEstudiante/',HorasEstudiante.as_view()),
    path('totalAsistenciaEv/',estAsistenciaEv.as_view()),
    path('totalAsistenciaAct',estAsistenciaAct.as_view())



   



]

urlpatterns+=router_reportes.urls
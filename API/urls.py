
from django.urls import path
from API.views import *
urlpatterns = [
    path('',inicio.as_view()),
    path('prueba_api/',ejemplo_request.as_view()),
    path('consulta_evento/',todos_los_eventos.as_view()),
    path('unico/',unico_evento.as_view()),
    path('programas/',programas_lista.as_view())
]

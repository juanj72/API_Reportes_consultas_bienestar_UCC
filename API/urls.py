
from django.urls import path
from API.views import *
urlpatterns = [
    path('',inicio.as_view()),
    path('prueba_api/',ejemplo_request.as_view()),
    path('consulta_evento/',evento_vi.as_view())
]

from rest_framework.routers import DefaultRouter
from API.views import *
from django.urls import path


router_reportes = DefaultRouter()

router_reportes.register(prefix='eventos',basename='evento',viewset=eventosClaseVista)



urlpatterns=[
    path('mostrarEventos/',mostrarEventos.as_view()),
   



]

urlpatterns+=router_reportes.urls
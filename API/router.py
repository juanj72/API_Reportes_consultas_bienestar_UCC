from rest_framework.routers import DefaultRouter
from API.views import *
from django.urls import path


router_reportes = DefaultRouter()

router_reportes.register(prefix='eventos',basename='eventos',viewset=todos_los_eventos)

urlpatterns=[
    path('consulta_evento/',unico_evento.as_view())

]

urlpatterns+=router_reportes.urls
from django.shortcuts import render
from API.models import django_migrations
from API.serializers import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics

# Create your views here.



class inicio(generics.ListAPIView):
    queryset = django_migrations.objects.all()
    serializer_class=migraciones_serializador
 
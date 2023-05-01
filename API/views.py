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

# Create your views here.


#mostrar datos de un modelo


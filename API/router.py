from rest_framework.routers import DefaultRouter
from API.views import *


router_reportes = DefaultRouter()

router_reportes.register(prefix='eventos',basename='eventos',viewset=todos_los_eventos)
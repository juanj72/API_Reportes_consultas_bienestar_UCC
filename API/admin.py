from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from API.models import *

# Register your models here.


@admin.register(Perfil)
class UserAdmin (BaseUserAdmin):
    fieldsets=(
        (None,{
        'fields':('username','password')
        }),
        
        ('información personal',{
        'fields':('first_name','last_name','email',)
        }),
        ('Permisos',{
        'fields':(
        'is_superuser',
        'is_staff',
        'is_active',
        'rol'
            ),
        }),
    )

admin.site.register(Rol)
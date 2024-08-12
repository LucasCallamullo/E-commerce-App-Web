from django.contrib import admin

# Register your models here.
# tengo que traer todos los models que pueda editar el admin
from servicios.models import Servicio


class ServiciosAdmin(admin.ModelAdmin):
    # esto es para que el admin vea mejor?
    list_display = ("titulo", "contenido", "imagen", "created", "updated")
    search_fields = ("titulo", "contenido", "imagen", "created", "updated")
    list_filter = ("titulo", "contenido",)

# Estos son los models que el admin puede editar
admin.site.register(Servicio, ServiciosAdmin)




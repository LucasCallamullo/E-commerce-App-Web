from django.shortcuts import render

# Create your views here.
from servicios.models import Servicio


def servicios(request):
    # Recuperar todos los servicios de la base de datos
    query_services = Servicio.objects.all()

    # Crear un diccionario para pasar a la plantilla
    context = {"servicios": query_services}

    # Renderizar la plantilla con el contexto

    return render(request, "servicios/servicios.html", context)



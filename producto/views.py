from django.shortcuts import render

from producto.models import Producto


# Create your views here.
def producto(request):

    qs_prod = Producto.objects.all()

    contexto = {"productos": qs_prod}

    # recorda que en realidad esto viene de producto/templates/producto
    return render(request, "producto/producto.html", contexto)

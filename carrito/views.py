from django.shortcuts import render


# Create your views here.
from carrito.carrito import Carrito
from producto.models import Producto

from django.shortcuts import get_object_or_404
from django.http import JsonResponse


def update_productos(request):

    if request.method == 'POST':

        try:
            # recupera valores del widget_carrito.js
            producto_id = int(request.POST.get('producto_id'))
            action = request.POST.get('action')

            # Recuperar carrito de la sesión del usuario
            carrito = Carrito(request)

            if action == 'add':
                # realiza la consulta en la SQL con get y devuelve el producto o un error segun corresponda
                producto = get_object_or_404(Producto, id=producto_id)
                # producto = Producto.objects.get(id=producto_id)
                carrito.add_producto(producto)
                mensaje = 'Producto agregado'

            elif action == 'less':
                carrito.less_producto(producto_id=producto_id)
                mensaje = 'Producto reducido'

            elif action == 'remove':
                carrito.remove_producto(producto_id=producto_id)
                mensaje = 'Producto eliminado'

            else:
                return JsonResponse({'error': 'Acción inválida'}, status=400)

            cart_items = [{'id': item['id'], 'nombre': item['nombre'], 'cantidad': item['cantidad'], 'precio': item['precio'], 'imagen': item['imagen']} for key, item in carrito.items]
            return JsonResponse({'mensaje': mensaje, 'total': carrito.total, 'items': cart_items})

        # cuando no exista el id en el carrito
        except ValueError:
            return JsonResponse({'error': 'ID de producto inválido'}, status=400)

    return JsonResponse({'error': 'Solicitud inválida'}, status=400)


""" 
from django.shortcuts import redirect
def clear_producto(request):

    # crear objeto carrito
    carrito = Carrito(request)

    # clear carrito de productos
    carrito.clear_producto()

    return redirect("producto/")
"""









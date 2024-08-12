

from .carrito import Carrito


def carrito_total(request):
    """
    :param request:
    :return: context

    Notes:
        Al pasar el total ya calculado, no necesita que el renderizado recalcule cada vez el valor cuando lo paso
        esto debería mejorar el rendimiento de la app
    """
    carrito = Carrito(request)
    total = carrito.total
    total_productos = len(carrito.items)

    context = {
        'carrito_total': total,
        'carrito': carrito,
        'total_productos': total_productos
    }

    return context

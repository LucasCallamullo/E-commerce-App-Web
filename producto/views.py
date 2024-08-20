
# Create your views here.
from django.shortcuts import render

from producto.models import Producto
from producto.models import Categoria, Subcategoria

from django.http import JsonResponse
from django.views.decorators.http import require_GET
from django.shortcuts import get_object_or_404


# ===========================================================================
#                       Vistas De Producto Individual
# ===========================================================================
def producto_item(request, producto_id):
    # Utiliza get_object_or_404 para obtener el producto o devolver un 404 si no existe
    # Este metodo get a ser directo por id, es mucho mas rapido que el metodo filter
    producto = get_object_or_404(Producto, id=producto_id)

    contexto = {"producto": producto}
    return render(request, "producto/producto_item.html", contexto)


# ===========================================================================
#                       Vistas Filtrado Productos
# ===========================================================================
def producto(request, category_id=None, sub_category_id=None):

    # Esta petición solo ingresa cuando ingresamos algo en el input de la top bar
    query = request.GET.get('top_q', '')
    if query:
        # Filtra los productos según la consulta del top_search_input
        productos = Producto.objects.filter(nombre__icontains=query)
        contexto = {"productos": productos,
                    "category": category_id,        # None
                    "sub_category": sub_category_id,  # None
                    'query': query}
        return render(request, "producto/producto.html", contexto)

    # Esta condición solo aplica cuando filtramos por categoría y no por subcategoría
    if category_id and sub_category_id is None:
        # Obtengo la Categoría a partir del ID pasado en la url
        category_actual = Categoria.objects.get(id=category_id)
        qs_products = Producto.objects.filter(categoria_principal=category_actual)
        contexto = {"productos": qs_products,
                    "category": category_actual,        # ID
                    "sub_category": sub_category_id}    # None
        return render(request, "producto/producto.html", contexto)

    # Esta condición solo aplica cuando filtramos por categoría y por subcategoría
    if category_id and sub_category_id:
        # Obtengo la Categoría a partir del ID pasado en la url
        category_actual = Categoria.objects.get(id=category_id)
        # Obtengo la subcategoría actual y filtro por la misma
        sub_category_actual = Subcategoria.objects.get(id=sub_category_id)
        # Lista Filtrada por Subcategoría
        qs_products = Producto.objects.filter(subcategorias=sub_category_actual)
        contexto = {"productos": qs_products,
                    "category": category_actual,            # ID
                    "sub_category": sub_category_actual}    # ID
        return render(request, "producto/producto.html", contexto)

    # Obtengo todos los productos de la DB Este es el return por defecto cuando accedemos al tab "Producto"
    qs_products = Producto.objects.all()
    contexto = {"productos": qs_products,
                "category": category_id,             # None  This is only for use it in page
                "sub_category": sub_category_id}     # None
    return render(request, "producto/producto.html", contexto)


# Ensures the view only handles GET requests as required by the test case
@require_GET
def search_view(request):

    # Las funciones GET recuperan valores como str, sin embargo yo en la logica de add_btn.js ya aplique
    # una logica para qeu siempre devuelva 0 o un ID valido
    query = request.GET.get('q', '')
    category_id = request.GET.get('category_id', '0')
    subcategory_id = request.GET.get('subcategory_id', '0')
    q_name_search_top = request.GET.get('q_top_search', '0')

    # Filtra todos los productos en caso de que el input quede con menos de 3 caracteres
    productos = Producto.objects.all()

    # En caso de haber filtrado previamente por el top_search del header generamos un query set menor
    if q_name_search_top != '0':
        productos = productos.filter(nombre__icontains=q_name_search_top)

    # Filtra productos por nombre solo si la longitud de la consulta es 3 o más
    if len(query) >= 3:
        productos = productos.filter(nombre__icontains=query)

    # Filtra por categoría si `category_id` no es '0', recordar la comparativa se hace con un str
    if category_id != '0':
        # realmente funciona aun sin transformar a una INT pero por lo averiguado conviene pasarlo a INT,
        # de todas formas averiguar mas al respecto
        category_id = int(category_id)
        productos = productos.filter(categoria_principal=category_id)

    # Filtra por subcategoría si `subcategory_id` no es '0'
    if subcategory_id != '0':
        subcategory_id = int(subcategory_id)
        productos = productos.filter(subcategorias=subcategory_id)

    # Generamos una lista para agregar a un diccionario que eventualmente usamos para recrear las tarjetas
    results = []
    for product in productos:
        # Obtener la primera imagen asociada al producto
        primera_imagen = product.imagenes.first()
        imagen_url = primera_imagen.imagen.url if primera_imagen else None

        # Agregar el producto con la primera imagen a los resultados
        results.append({
            'id': product.id,
            'nombre': product.nombre,
            'precio_contado': product.precio_contado,
            'imagen': imagen_url
        })

    return JsonResponse({'results': results})

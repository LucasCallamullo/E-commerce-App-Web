

from .models import Categoria, Subcategoria
from django.core.cache import cache
# ver configuracion de caches en settings


def get_categories_dropmenmu(request):
    """
    :param request:
    :return: context

    Notes:
        Nos devuelve un diccionario comppleto de cateogiras y subcategorias, para la barra dropdown en el head de
        la app

        PD: se puede mejorar la performance ya que si esto es un context procesors podria revisar porque
        uso exactamente el mismo diccionario en las vistas del producto por filtrado de categoria
    """
    categories_dropmenu = cache.get('categories_dropmenu')

    if not categories_dropmenu:
        # Obtener todas las categorías y subcategorías para la side-bar
        categories_all = Categoria.objects.all()

        # Crear el diccionario de categorías y subcategorías
        categories_dropmenu = {}

        # Rellenar el diccionario para pasarlo como contexto
        for category in categories_all:
            """
            Este es un método de Django que obtiene todas las instancias relacionadas del modelo 
            Subcategoria que están asociadas con la instancia actual de Categoria. Específicamente, 
            utiliza la relación ForeignKey que se define en el modelo Subcategoria para establecer 
            la relación con el modelo Categoria. (ver su name_related o su association en tabla
            """
            subcategories = list(category.subcategorias.all())
            categories_dropmenu[category] = list(subcategories)

        # Almacenamos en cache este context processors para evitar llamadas repetitivas
        # Cache for 1 hour
        cache.set('categories_dropmenu', categories_dropmenu, timeout=60 * 60)

    # Retornar el diccionario dentro de otro diccionario con listas/arrays para el contexto
    return {'categories_dropmenu': categories_dropmenu}

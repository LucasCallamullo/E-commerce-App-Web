

from django.core.management.base import BaseCommand
from producto.models import Categoria, Subcategoria, Marca

# Paso 1 - Llamar a la consola
# python manage.py shell

# Paso 2 - Importar nuestro script desde la app que lo creamos
# from producto.load_data import *


class Command(BaseCommand):
    help = 'Cargar categorías, subcategorías y marcas desde un diccionario'

    def handle(self, *args, **options):
        # Datos para cargar

        # Diccionario con categorías y subcategorías
        listas_categorias = {
            "Periféricos": {"Mouses", "Teclados", "Auriculares", "Monitores"},
            "Componentes de PC": {"Discos SSD", "Motherboards", "Procesadores"},

            # Dict vacío si no hay subcategorías aún
            "Cables y Adaptadores": set(),
            "Outro": set()
        }

        # Lista de marcas
        list_marcas = [
            # Periféricos
            "Logitech", "Redragon", "Samsung",

            # Discos SSD
            "Corsair", "Kingston",

            # Motherboards
            "MSI", "Gigabyte",

            # Procesadores
            "Ryzen", "Intel"
        ]

        # Cargar categorías
        for categoria_nombre, subcategorias in listas_categorias.items():

            # get_or_create; recupera el objeto y devuelve true o false si fue creado o no
            categoria, created = Categoria.objects.get_or_create(nombre=categoria_nombre)
            if created:
                self.stdout.write(self.style.SUCCESS(f'Categoría "{categoria_nombre}" creada.'))

            # Cargar subcategorías
            for subcategoria_nombre in subcategorias:
                # Ignorar subcategorías vacías
                if subcategoria_nombre:
                    Subcategoria.objects.get_or_create(nombre=subcategoria_nombre, categoria=categoria)
                    self.stdout.write(self.style.SUCCESS(f'Subcategoría "{subcategoria_nombre}" '
                                                         f'creada para la categoría "{categoria_nombre}".'))

        # Cargar marcas
        for marca_nombre in list_marcas:
            Marca.objects.get_or_create(nombre=marca_nombre)
            self.stdout.write(self.style.SUCCESS(f'Marca "{marca_nombre}" creada.'))


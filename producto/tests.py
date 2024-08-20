from django.test import TestCase

# Create your tests here.
from django.test import TestCase
from django.urls import reverse
from django.contrib.auth import get_user_model
from producto.models import Producto, Categoria, Subcategoria


# Note: The following tests encountered issues with the direct assignment of ManyToMany fields.
# Solution: Use the `set()` method for ManyToMany relationships instead of direct assignment.

# Nota: Se ha establecido un valor por defecto de 0 para el campo `stock` en el modelo Producto.

# Nota: A partir de la busqueda del como y porque realizar tests se agrego la siguiente etiqueta en su respectiva
# vista/views.py "Add @require_GET decorator to search_view to restrict to GET requests"

# Nota los test para este modelo de Producto fueron exitosos (seguir probando )

class CategoriaProductoTests(TestCase):
    def setUp(self):
        # Crear categorías y subcategorías
        self.categoria = Categoria.objects.create(nombre='Electronics')
        self.subcategoria = Subcategoria.objects.create(nombre='Smartphones', categoria=self.categoria)

        # Crear un producto
        self.producto = Producto.objects.create(
            nombre='iPhone 12',
            precio_contado=999.99,
            stock=10,
            categoria_principal=self.categoria
        )

        # Asignar subcategorías al producto usando el método `set()`
        self.producto.subcategorias.set([self.subcategoria])

    # Aquí puedes agregar los tests que necesites
    def test_categoria_producto(self):
        # Ejemplo de prueba
        response = self.client.get('/producto/categoria/1/1/')
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'iPhone 12')


class SearchViewTests(TestCase):
    def setUp(self):
        # Crear una categoría y una subcategoría para las pruebas
        self.categoria = Categoria.objects.create(nombre="Electronics")
        self.subcategoria = Subcategoria.objects.create(nombre="Phones", categoria=self.categoria)

        # Asegúrate de proporcionar todos los campos requeridos, incluyendo `stock`.
        # Nota: Se ha establecido un valor por defecto de 0 para el campo `stock` en el modelo Producto.

        self.producto = Producto.objects.create(
            nombre="Smartphone",
            precio_contado=299.99,
            stock=10,
            categoria_principal=self.categoria
        )

        # Crear un producto y asignar subcategorías usando el método `set()`
        self.producto.subcategorias.set([self.subcategoria])

    def test_search_view(self):
        """
        Test the search view to ensure it returns correct JSON data
        and displays the expected product when searched by name.
        """

        # URL de la vista de búsqueda
        url = reverse('Search_view')

        # Realizar una solicitud GET a la vista de búsqueda con el término de búsqueda 'Smartphone'
        response = self.client.get(url, {'q': 'Smartphone'})

        # Verificar que la respuesta tenga un código de estado 200 (OK)
        self.assertEqual(response.status_code, 200)

        # Verificar que la respuesta contenga el nombre del producto
        self.assertContains(response, 'Smartphone')

        # Verificar el contenido del JSON de la respuesta
        self.assertJSONEqual(
            response.content,
            {
                'results': [{
                    'id': self.producto.id,
                    'nombre': 'Smartphone',
                    'precio_contado': 299.99,
                    'imagen': None
                }]
            }
        )

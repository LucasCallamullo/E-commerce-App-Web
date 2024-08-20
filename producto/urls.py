

from django.urls import path
from producto import views

# Esto es para supportear las imagenes de esta app
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    # If you want dont pass any parameters in the url you can use this "name"
    path('producto/', views.producto, name="Producto"),

    # If you want pass 1 parameters in the url you can use this "name"
    path('producto/categoria/<int:category_id>/', views.producto, name="Producto_Categoria"),

    # If you want pass 2 parameters in the url you can use this "name"
    path('producto/categoria/<int:category_id>/<int:sub_category_id>/', views.producto, name="Producto_Subcategoria"),

    # Vista para la barra de busqueda del TOP method GET
    path('producto/search/', views.producto, name="Producto_Top_Search"),

    # Esto es para pasar el producto individual a una pantalla
    path('producto/item/<int:producto_id>/', views.producto_item, name="Producto_Item"),

    # este trabaja para las solicitudes JSON con js AJAX. para la busqueda en el input lateral del sidebar
    path('search_producto/', views.search_view, name='Search_view'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


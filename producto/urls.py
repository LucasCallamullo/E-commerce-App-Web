

from django.urls import path
from producto import views

# Esto es para supportear las imagenes de este servicio ?
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('producto/', views.producto, name="Producto"),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


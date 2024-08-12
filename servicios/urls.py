from django.urls import path

from servicios import views

# Esto es para supportear las imagenes de este servicio ?
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('servicios/', views.servicios, name="Servicio"),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

"""
URL configuration for ecommerce project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.urls import include

urlpatterns = [
    path('admin/', admin.site.urls),

    # dato aca no van las urls directas como tal, van en su propia biblioteca, o modificar probando segun eso xd

    # Esto es de la tienda/
    path('', include("tienda.urls")),

    # Esto es de servicios
    path('', include("servicios.urls")),

    # Esto es de blog
    path('', include("blog.urls")),

    # Esto es de contacto
    path('', include("contacto.urls")),

    # Esto es de producto
    path('', include("producto.urls")),

    # Esto es de carrito
    path('', include("carrito.urls")),

    # Esto es de registros
    path('', include("registros.urls")),

    # path('', include("django.contrib.auth.urls")),

]

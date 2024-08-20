

from django.db import models
import os
import uuid


# Create your models here.
class Categoria(models.Model):
    nombre = models.CharField(max_length=50)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Categoría de Producto"
        verbose_name_plural = "Categorías de Productos"

    def __str__(self):
        return self.nombre


class Subcategoria(models.Model):
    nombre = models.CharField(max_length=50)
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, related_name='subcategorias')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Subcategoría de Producto"
        verbose_name_plural = "Subcategorías de Productos"

    def __str__(self):
        return self.nombre


class Marca(models.Model):
    nombre = models.CharField(max_length=50)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Marca"
        verbose_name_plural = "Marcas"

    def __str__(self):
        return self.nombre


def custom_upload_to_producto(instance, filename):
    """Genera un nombre de archivo único basado en un UUID."""
    nombre_base, extension = os.path.splitext(filename)
    unique_id = uuid.uuid4().hex
    return f"producto/{unique_id}{extension.lower()}"


class Producto(models.Model):
    nombre = models.CharField(max_length=200)

    # Si se eliminase la categoría setea por defecto el valor de categoria 1
    categoria_principal = models.ForeignKey(Categoria, on_delete=models.SET_DEFAULT, default=1, related_name='productos')

    subcategorias = models.ManyToManyField(Subcategoria, blank=True, related_name='productos')
    imagenes = models.ManyToManyField('ProductoImagen', blank=True, related_name='productos_m2m')
    descripcion = models.TextField(null=True, blank=True)

    # Si se elimina la marca setea Null en su lugar
    marca = models.ForeignKey(Marca, on_delete=models.SET_NULL, null=True, blank=True)
    precio_contado = models.FloatField()
    precio_tarjeta = models.FloatField(null=True, blank=True, default=0)
    precio_otro = models.FloatField(null=True, blank=True, default=0, help_text="Precio para otro tipo de pago")
    disponibilidad = models.BooleanField(default=True)
    stock = models.IntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Producto"
        verbose_name_plural = "Productos"

    def __str__(self):
        return self.nombre


class ProductoImagen(models.Model):
    """
    {% for imagen in producto.imagenes.all %}
        <img src="{{ imagen.imagen.url }}" alt="{{ imagen.descripcion }}">
    {% endfor %}
    """
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE, related_name='imagenes_fk')
    imagen = models.ImageField(upload_to=custom_upload_to_producto)
    descripcion = models.CharField(max_length=255, null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Imagen de {self.producto.nombre}"












""" 
def custom_upload_to_producto(instance, filename):
    # Genera un nombre de archivo único basado en un UUID.
    nombre_base, extension = os.path.splitext(filename)
    unique_id = uuid.uuid4().hex
    return f"producto/{unique_id}{extension.lower()}"


class Producto(models.Model):
    nombre = models.CharField(max_length=50)
    categorias = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    imagen = models.ImageField(upload_to=custom_upload_to_producto, null=True, blank=True)
    precio = models.FloatField()
    disponibilidad = models.BooleanField()
    stock = models.IntegerField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Producto"
        verbose_name_plural = "Productos"

    def __str__(self):
        return self.nombre
"""



from django.contrib import admin

# Register your models here.

from .models import Categoria, Producto
from .models import Marca, ProductoImagen, Subcategoria


class CategoriaProdAdmin(admin.ModelAdmin):
    # establece estos campos solo como lectura
    readonly_fields = ('created', 'updated')


class SubCategoriaProdAdmin(admin.ModelAdmin):
    # establece estos campos solo como lectura
    readonly_fields = ('created', 'updated')


class MarcaAdmin(admin.ModelAdmin):
    # establece estos campos solo como lectura
    readonly_fields = ('created', 'updated')


class ProductoImagenAdmin(admin.ModelAdmin):
    # Define las columnas que se mostrarán en la lista de administración
    list_display = ('producto', 'descripcion', 'created', 'updated')
    # Establece estos campos como solo lectura; no se pueden editar desde la interfaz de administración
    readonly_fields = ('created', 'updated')
    # Agrega un filtro en la barra lateral para filtrar por el producto asociado
    list_filter = ('producto',)
    # Permite buscar imágenes por la descripción y el nombre del producto asociado
    search_fields = ('descripcion', 'producto__nombre')


class ProductoAdmin(admin.ModelAdmin):
    # Define las columnas que se mostrarán en la lista de administración
    list_display = ('nombre', 'categoria_principal', 'marca', 'precio_contado', 'disponibilidad', 'stock', 'created', 'updated')
    # Establece estos campos como solo lectura; no se pueden editar desde la interfaz de administración
    readonly_fields = ('created', 'updated')
    # Agrega filtros en la barra lateral para filtrar por categoría principal, marca y disponibilidad
    list_filter = ('categoria_principal', 'marca', 'disponibilidad')
    # Permite buscar productos por nombre, descripción y nombre de la marca asociada
    search_fields = ('nombre', 'descripcion', 'marca__nombre')
    # Agrega un widget de selección horizontal para los campos de relación ManyToManyField
    # para una selección más cómoda de subcategorías e imágenes
    filter_horizontal = ('subcategorias', 'imagenes')


admin.site.register(Categoria, CategoriaProdAdmin)
admin.site.register(Producto, ProductoAdmin)

admin.site.register(Subcategoria, SubCategoriaProdAdmin)
admin.site.register(Marca, MarcaAdmin)
admin.site.register(ProductoImagen, ProductoImagenAdmin)


from django.contrib import admin

# Register your models here.

from .models import Categoria, Producto


class CategoriaProdAdmin(admin.ModelAdmin):
    # establece estos campos solo como lectura
    readonly_fields = ('created', 'updated')


class PostAdmin(admin.ModelAdmin):
    readonly_fields = ('created', 'updated')


admin.site.register(Categoria, CategoriaProdAdmin)
admin.site.register(Producto, PostAdmin)

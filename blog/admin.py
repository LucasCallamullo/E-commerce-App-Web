from django.contrib import admin

# Register your models here.

from .models import Categoria, Post


class CategoriaAdmin(admin.ModelAdmin):
    # establece estos campos solo como lectura
    readonly_fields = ('created', 'updated')


class PostAdmin(admin.ModelAdmin):
    readonly_fields = ('created', 'updated')


admin.site.register(Categoria, CategoriaAdmin)
admin.site.register(Post, PostAdmin)


from django.db import models
from django.conf import settings

from django.contrib.auth.models import User


# Create your models here.
class Categoria(models.Model):
    """
    updated:
    created: ambos se crean asi para actualizarse automatico con la fecha
    """

    nombre = models.CharField(max_length=50)

    # guarda automatico la fecha
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now_add=True)

    # lo que se muestra en copnsola del admin
    class Meta:
        verbose_name = "categoria"
        verbose_name_plural = "categorias"

    def __str__(self):
        return self.nombre


class Post(models.Model):
    """
    updated:
    created: ambos se crean asi para actualizarse automatico con la fecha
    """

    titulo = models.CharField(max_length=200)
    contenido = models.TextField()  # Cambiado de CharField a TextField

    # para cambiar la ruta de guardado de imagenes, ademas pueda quedar vacio o en blanco
    imagen = models.ImageField(upload_to='blog', null=True, blank=True)

    # guarda automatico la fecha
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now_add=True)

    # autor, un autore puede hacer muchos posts
    # autor = models.ForeignKey(User, on_delete=models.CASCADE)
    autor = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    autor_name = models.CharField(max_length=100, default='Nombre por defecto')

    # relacion varios a varios, un post puede tener muchas categorias, y una categoria puede tener muchos posts
    categorias = models.ManyToManyField(Categoria)

    # lo que se muestra en copnsola del admin
    class Meta:
        verbose_name = "post"
        verbose_name_plural = "posts "

    def __str__(self):
        return self.titulo


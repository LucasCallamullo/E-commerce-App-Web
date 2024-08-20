
from django.db import models

# Create your models here.
import uuid
import os
from django.conf import settings


def custom_upload_to_servicio(instance, filename):
    """Genera un nombre de archivo único basado en un UUID."""
    nombre_base, extension = os.path.splitext(filename)
    unique_id = uuid.uuid4().hex
    return f"servicios/{unique_id}{extension.lower()}"


class Servicio(models.Model):
    """
    updated:
    created: ambos se crean asi para actualizarse automatico con la fecha
    """

    titulo = models.CharField(max_length=50)
    contenido = models.TextField()  # Ideal para texto largo

    # Para cambiar la ruta de guardado de imágenes
    imagen = models.ImageField(upload_to=custom_upload_to_servicio, null=True, blank=True)

    # Guarda automáticamente la fecha
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    # lo que se muestra en consola del admin
    class Meta:
        verbose_name = "servicio"
        verbose_name_plural = "servicios"

    def __str__(self):
        return self.titulo

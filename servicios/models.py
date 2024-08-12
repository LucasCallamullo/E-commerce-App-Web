from django.db import models

# Create your models here.


class Servicio(models.Model):
    """
    updated:
    created: ambos se crean asi para actualizarse automatico con la fecha
    """

    titulo = models.CharField(max_length=50)
    contenido = models.CharField(max_length=50)

    # para cambiar la ruta de guardado de imagenes
    imagen = models.ImageField(upload_to='servicios')

    # guarda automatico la fecha
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now_add=True)

    # lo que se muestra en copnsola del admin
    class Meta:
        verbose_name = "servicio"
        verbose_name_plural = "servicios"

    def __str__(self):
        return self.titulo

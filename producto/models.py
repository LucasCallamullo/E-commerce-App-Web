

import os
from django.db import models


# Create your models here.
class Categoria(models.Model):
    nombre = models.CharField(max_length=50)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Categoria Producto"
        verbose_name_plural = "Categorias Productos"

    def __str__(self):
        return self.nombre


# Para generar nombres de archivos por defecto
def custom_upload_to(instance, filename):
    """Genera un nombre de archivo único basado en el modelo y la fecha."""
    nombre_base, extension = os.path.splitext(filename)
    return f"producto/{instance.id}_{instance.nombre.replace(' ', '_')}{extension.lower()}"


class Producto(models.Model):
    nombre = models.CharField(max_length=50)
    categorias = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    imagen = models.ImageField(upload_to=custom_upload_to, null=True, blank=True)
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

    def save(self, *args, **kwargs):
        # Primero guarda la instancia para obtener un ID
        super().save(*args, **kwargs)

        if self.imagen:
            # Ahora que el ID está disponible, genera el nuevo nombre de archivo
            nombre_base, extension = os.path.splitext(self.imagen.name)
            nuevo_nombre = f"producto/{self.id}_{self.nombre.replace(' ', '_')}{extension.lower()}"

            # Renombra el archivo
            if not os.path.exists(os.path.join('media', nuevo_nombre)):  # Evita sobrescribir archivos existentes
                os.rename(os.path.join('media', self.imagen.name), os.path.join('media', nuevo_nombre))
                self.imagen.name = nuevo_nombre

            # Guarda nuevamente la instancia para actualizar el campo 'imagen'
            super().save(*args, **kwargs)




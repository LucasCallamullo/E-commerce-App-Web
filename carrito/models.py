from django.db import models

from producto.models import Producto


# Create your models here.
class Venta(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE, related_name='ventas')
    cantidad_vendida = models.IntegerField()
    fecha_venta = models.DateTimeField(auto_now_add=True)
    metodo_pago = models.CharField(max_length=50, null=True, blank=True)
    numero_factura = models.CharField(max_length=20, unique=True, null=True, blank=True)  # Campo para el número de factura

    class Meta:
        verbose_name = "Venta"
        verbose_name_plural = "Ventas"

    def __str__(self):
        return f"Venta de {self.cantidad_vendida} unidades de {self.producto.nombre} el {self.fecha_venta}"
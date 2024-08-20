

# load_producto_data.py
import pandas as pd
from django.core.management.base import BaseCommand
from producto.models import Producto, Categoria, Subcategoria, Marca


"""
    Only you can use this with 
    pandas      - pip install pandas
    openpyxl    - pip install openpyxl
"""


class Command(BaseCommand):
    help = 'Carga productos desde un archivo Excel'

    def handle(self, *args, **kwargs):
        # Cargar el archivo Excel
        file_path = 'producto/data/info_productos.xlsx'
        df = pd.read_excel(file_path)

        # itera por las filas a razon de una linea por vuelta de ciclo
        for index, row in df.iterrows():
            # Obtener o crear la categoría
            categoria, _ = Categoria.objects.get_or_create(nombre=row['categoria'])

            # Obtener o crear la subcategoría
            subcategoria = None
            # notna = bool para saber si esta en None
            if pd.notna(row['subcategoria']):
                subcategoria, _ = Subcategoria.objects.get_or_create(
                    nombre=row['subcategoria'], categoria=categoria
                )

            # Obtener o crear la marca
            marca, _ = Marca.objects.get_or_create(nombre=row['marca'])

            # Verificar si el producto ya existe
            producto_existente = Producto.objects.filter(nombre=row['nombre']).first()

            if producto_existente:
                # Actualizar el precio
                producto_existente.precio_contado = row['precio'] if pd.notna(
                    row['precio']) else producto_existente.precio_contado
                # Actualizar el stock si hiciera falta
                # producto_existente.stock = row['stock'] if pd.notna(row['stock']) else producto_existente.stock

                # Guardar los cambios en la base de datos
                producto_existente.save()

                self.stdout.write(self.style.SUCCESS(f'Producto "{producto_existente.nombre}" actualizado.'))

            else:
                # Crear el nuevo producto
                producto = Producto.objects.create(
                    nombre=row['nombre'],
                    categoria_principal=categoria,
                    # subcategorias=subcategoria,
                    # descripcion=row['descripcion'] if pd.notna(row['descripcion']) else '',
                    marca=marca,
                    precio_contado=row['precio'] if pd.notna(row['precio']) else None,
                    # precio_tarjeta=row['precio_lista'] if pd.notna(row['precio_lista']) else None,
                    # precio_otro=row['precio_otro'] if pd.notna(row['precio_otro']) else None,
                    # disponibilidad=row['disponibilidad'] if pd.notna(row['disponibilidad']) else True,
                    stock=row['stock'] if pd.notna(row['stock']) else 0,
                )

                # Asignar la subcategoría si existe
                if subcategoria:
                    producto.subcategorias.add(subcategoria)

                # mensaje para saber si se creo por consola
                self.stdout.write(self.style.SUCCESS(f'Producto "{producto.nombre}" creado.'))
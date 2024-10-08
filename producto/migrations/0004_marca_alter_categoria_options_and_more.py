# Generated by Django 5.0.7 on 2024-08-13 13:29

import django.db.models.deletion
import producto.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('producto', '0003_alter_producto_imagen'),
    ]

    operations = [
        migrations.CreateModel(
            name='Marca',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'Marca',
                'verbose_name_plural': 'Marcas',
            },
        ),
        migrations.AlterModelOptions(
            name='categoria',
            options={'verbose_name': 'Categoría de Producto', 'verbose_name_plural': 'Categorías de Productos'},
        ),
        migrations.RenameField(
            model_name='producto',
            old_name='precio',
            new_name='precio_contado',
        ),
        migrations.RemoveField(
            model_name='producto',
            name='categorias',
        ),
        migrations.RemoveField(
            model_name='producto',
            name='imagen',
        ),
        migrations.AddField(
            model_name='producto',
            name='categoria_principal',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='productos', to='producto.categoria'),
        ),
        migrations.AddField(
            model_name='producto',
            name='descripcion',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='producto',
            name='precio_otro',
            field=models.FloatField(blank=True, help_text='Precio para otro tipo de pago', null=True),
        ),
        migrations.AddField(
            model_name='producto',
            name='precio_tarjeta',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='categoria',
            name='updated',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='producto',
            name='disponibilidad',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='producto',
            name='updated',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='producto',
            name='marca',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='producto.marca'),
        ),
        migrations.CreateModel(
            name='ProductoImagen',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('imagen', models.ImageField(upload_to=producto.models.custom_upload_to_producto)),
                ('descripcion', models.CharField(blank=True, max_length=255, null=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='imagenes_fk', to='producto.producto')),
            ],
        ),
        migrations.AddField(
            model_name='producto',
            name='imagenes',
            field=models.ManyToManyField(blank=True, related_name='productos_m2m', to='producto.productoimagen'),
        ),
        migrations.CreateModel(
            name='Subcategoria',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='subcategorias', to='producto.categoria')),
            ],
            options={
                'verbose_name': 'Subcategoría de Producto',
                'verbose_name_plural': 'Subcategorías de Productos',
            },
        ),
        migrations.AddField(
            model_name='producto',
            name='subcategorias',
            field=models.ManyToManyField(blank=True, related_name='productos', to='producto.subcategoria'),
        ),
    ]

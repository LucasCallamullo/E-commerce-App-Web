# Generated by Django 5.0.7 on 2024-08-09 03:14

import producto.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('producto', '0002_alter_producto_options_producto_created_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='producto',
            name='imagen',
            field=models.ImageField(blank=True, null=True, upload_to=producto.models.custom_upload_to_producto),
        ),
    ]

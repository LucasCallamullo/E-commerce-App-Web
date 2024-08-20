# Generated by Django 5.0.7 on 2024-08-13 05:13

import servicios.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('servicios', '0003_alter_servicio_imagen'),
    ]

    operations = [
        migrations.AlterField(
            model_name='servicio',
            name='imagen',
            field=models.ImageField(blank=True, null=True, upload_to=servicios.models.custom_upload_to_servicio),
        ),
        migrations.AlterField(
            model_name='servicio',
            name='updated',
            field=models.DateTimeField(auto_now=True),
        ),
    ]

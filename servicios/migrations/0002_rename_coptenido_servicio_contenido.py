# Generated by Django 5.0.7 on 2024-08-05 23:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('servicios', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='servicio',
            old_name='coptenido',
            new_name='contenido',
        ),
    ]

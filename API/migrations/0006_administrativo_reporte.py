# Generated by Django 4.1.7 on 2023-05-24 16:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('API', '0005_asistenciaactividad'),
    ]

    operations = [
        migrations.AddField(
            model_name='administrativo',
            name='reporte',
            field=models.BooleanField(default=False),
        ),
    ]
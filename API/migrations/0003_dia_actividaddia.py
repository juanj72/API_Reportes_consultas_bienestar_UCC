# Generated by Django 4.1.7 on 2023-05-01 23:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('API', '0002_estudiante_programa'),
    ]

    operations = [
        migrations.CreateModel(
            name='Dia',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='ActividadDia',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('hora_inicio', models.TimeField()),
                ('hora_fin', models.TimeField()),
                ('actividad', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='API.actividad')),
                ('dia', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='API.dia')),
            ],
        ),
    ]
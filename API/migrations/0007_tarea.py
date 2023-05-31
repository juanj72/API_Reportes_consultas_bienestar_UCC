# Generated by Django 4.1.7 on 2023-05-24 16:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('API', '0006_administrativo_reporte'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tarea',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dia', models.CharField(max_length=12, null=True)),
                ('hora', models.IntegerField(null=True)),
                ('task_id', models.IntegerField(null=True)),
                ('administrador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='API.administrativo')),
            ],
        ),
    ]
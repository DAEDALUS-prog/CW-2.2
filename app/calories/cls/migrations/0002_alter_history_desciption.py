# Generated by Django 4.2.1 on 2023-05-10 07:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cls', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='history',
            name='desciption',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cls.product'),
        ),
    ]

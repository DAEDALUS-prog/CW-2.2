# Generated by Django 4.2.1 on 2023-05-03 23:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Person',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.EmailField(max_length=30)),
                ('name', models.CharField(max_length=20)),
                ('password', models.CharField(max_length=100)),
                ('status', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('ccal', models.FloatField()),
                ('fat', models.FloatField()),
                ('proteins', models.FloatField()),
                ('carbohydrates', models.FloatField()),
                ('image', models.ImageField(upload_to='')),
            ],
        ),
        migrations.CreateModel(
            name='History',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('desciption', models.TextField(max_length=150)),
                ('person', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cls.person')),
            ],
        ),
    ]

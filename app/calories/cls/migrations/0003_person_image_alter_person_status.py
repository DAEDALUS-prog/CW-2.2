# Generated by Django 4.2.1 on 2023-05-15 19:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cls', '0002_alter_history_desciption'),
    ]

    operations = [
        migrations.AddField(
            model_name='person',
            name='image',
            field=models.ImageField(default='cls/image/none-profile.png', upload_to=''),
        ),
        migrations.AlterField(
            model_name='person',
            name='status',
            field=models.IntegerField(default=1),
        ),
    ]
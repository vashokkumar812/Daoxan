# Generated by Django 3.1.3 on 2021-01-02 10:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0007_auto_20210102_1539'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='price',
            field=models.CharField(default='{}', max_length=100),
        ),
    ]

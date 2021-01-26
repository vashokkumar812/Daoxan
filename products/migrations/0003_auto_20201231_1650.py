# Generated by Django 3.1.3 on 2020-12-31 11:20

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0002_auto_20201231_1558'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='packaging_size',
            field=models.CharField(blank=True, default=0, max_length=7),
        ),
        migrations.AddField(
            model_name='product',
            name='variety',
            field=models.CharField(blank=True, default=0, max_length=30),
        ),
        migrations.AlterField(
            model_name='product',
            name='product_type',
            field=models.IntegerField(default=1, validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(2)], verbose_name='Type'),
        ),
    ]

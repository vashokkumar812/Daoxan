# Generated by Django 3.1.4 on 2021-01-08 17:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0009_auto_20210108_2215'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='quantity',
            field=models.CharField(max_length=10, null=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='variant_of',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='products.product'),
        ),
    ]

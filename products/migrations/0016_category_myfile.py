# Generated by Django 3.1.4 on 2021-01-12 10:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0015_auto_20210109_1728'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='myfile',
            field=models.FileField(blank=True, null=True, upload_to='media/'),
        ),
    ]

# Generated by Django 4.2 on 2023-09-07 08:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0009_goodsskus'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goodsspecs',
            name='spec_type',
            field=models.IntegerField(choices=[(1, '颜色'), (2, '尺码'), (3, '规格')], null=True, verbose_name='规格类型'),
        ),
    ]
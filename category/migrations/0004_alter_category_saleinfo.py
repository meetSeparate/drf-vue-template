# Generated by Django 4.2 on 2023-09-01 08:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('category', '0003_category_saleinfo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='saleInfo',
            field=models.CharField(blank=True, max_length=256, null=True, verbose_name='分类描述'),
        ),
    ]
# Generated by Django 4.2 on 2023-09-04 05:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0006_goodsspecs'),
    ]

    operations = [
        migrations.AddField(
            model_name='goodsspecs',
            name='shop',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='goods.goods', verbose_name='对应商品'),
        ),
    ]

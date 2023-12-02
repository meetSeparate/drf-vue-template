# Generated by Django 4.2.7 on 2023-11-24 05:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0013_alter_goodsskus_price'),
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsProperty',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=256, verbose_name='商品属性名称')),
                ('value', models.TextField(verbose_name='商品属性描述')),
                ('shop', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='goods.goods', verbose_name='对应商品')),
            ],
            options={
                'verbose_name_plural': '商品详情属性',
            },
        ),
    ]
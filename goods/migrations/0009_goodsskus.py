# Generated by Django 4.2 on 2023-09-07 08:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0008_goodsspecs_spec_type_shopdetailimage'),
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsSkus',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('old_price', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='组合原价')),
                ('price', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='组合原价')),
                ('inventory', models.IntegerField(default=0, verbose_name='库存')),
                ('specs', models.ManyToManyField(to='goods.goodsspecs', verbose_name='商品规格')),
            ],
            options={
                'verbose_name_plural': '商品规格组合',
            },
        ),
    ]

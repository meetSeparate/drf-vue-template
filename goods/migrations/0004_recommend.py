# Generated by Django 4.2 on 2023-09-01 03:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0003_goods_create_date'),
    ]

    operations = [
        migrations.CreateModel(
            name='Recommend',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=128, verbose_name='标题')),
                ('alt', models.CharField(max_length=128, verbose_name='描述')),
                ('picture', models.FileField(upload_to='recommend/', verbose_name='人气推荐封面')),
            ],
            options={
                'verbose_name_plural': '人气推荐',
            },
        ),
    ]

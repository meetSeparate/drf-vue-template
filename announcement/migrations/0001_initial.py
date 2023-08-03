# Generated by Django 4.2 on 2023-08-03 01:14

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Announcement',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.TextField(verbose_name='公告内容')),
                ('timestamp', models.DateTimeField(auto_now_add=True, verbose_name='发布日期')),
                ('color', models.CharField(max_length=64, verbose_name='标志颜色')),
                ('size', models.CharField(max_length=64, verbose_name='标志大小')),
            ],
            options={
                'verbose_name_plural': '系统公告',
            },
        ),
    ]

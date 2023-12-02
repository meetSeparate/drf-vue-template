# Generated by Django 4.2 on 2023-10-31 02:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('notice', '0004_alter_notice_user'),
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('url', models.FileField(upload_to='recognize', verbose_name='保存图片')),
                ('create_date', models.DateTimeField(auto_now_add=True, verbose_name='识别时间')),
            ],
            options={
                'verbose_name_plural': '图片识别',
            },
        ),
    ]

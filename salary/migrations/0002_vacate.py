# Generated by Django 4.2 on 2023-11-20 02:22

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('salary', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Vacate',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start_time', models.DateTimeField(verbose_name='请假开始时间')),
                ('end_time', models.DateTimeField(verbose_name='请假结束时间')),
                ('purpose', models.TextField(null=True, verbose_name='请假原因')),
                ('status', models.CharField(default='待审批', max_length=128, verbose_name='状态')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL, verbose_name='用户')),
            ],
            options={
                'verbose_name_plural': '请假表',
            },
        ),
    ]

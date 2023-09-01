from django.db import models
from category.models import Category

# Create your models here.

class Banner(models.Model):
    banner_url = models.FileField(upload_to='banner/', verbose_name='轮播图')
    type_choice = (
        (1, '首页轮播图'),
        (2, '分类详情轮播图')
    )
    type = models.IntegerField(verbose_name='轮播图种类', choices=type_choice)
    category = models.OneToOneField(to=Category, on_delete=models.SET_NULL,verbose_name='对应分类', null=True, blank=True)

    def __str__(self):
        return '轮播图' + '------' + self.category.name

    class Meta:
        verbose_name_plural = '轮播图'
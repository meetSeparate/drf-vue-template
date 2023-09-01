from django.db import models
from goods.models import Goods

# Create your models here.

class Category(models.Model):
    name = models.CharField(verbose_name='分类名称', max_length=128)
    picture = models.FileField(upload_to='category/', verbose_name='分类图片')
    parent_category = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE,
                                    verbose_name='父分类')
    goods = models.ManyToManyField(to=Goods, verbose_name='分类商品', null=True, blank=True)
    saleInfo = models.CharField(verbose_name='分类描述', max_length=256, null=True)


    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '分类管理'

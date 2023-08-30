from django.db import models

# Create your models here.

class Goods(models.Model):
    name = models.CharField(verbose_name='商品名称', max_length=128)
    desc = models.TextField(verbose_name='商品简介', null=True)
    picture = models.FileField(upload_to='goods/', verbose_name='商品封面')
    orderNum = models.IntegerField(verbose_name='数量', null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='商品价格')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '商品管理'

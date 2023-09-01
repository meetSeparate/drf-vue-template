from django.db import models

# Create your models here.

class Goods(models.Model):
    name = models.CharField(verbose_name='商品名称', max_length=128)
    desc = models.TextField(verbose_name='商品简介', null=True)
    picture = models.FileField(upload_to='goods/', verbose_name='商品封面')
    orderNum = models.IntegerField(verbose_name='数量', null=True, blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='商品价格')
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='发布时间', null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '商品管理'


class Recommend(models.Model):
    title = models.CharField(verbose_name='标题', max_length=128)
    alt = models.CharField(verbose_name='描述', max_length=128)
    picture = models.FileField(verbose_name='人气推荐封面', upload_to='recommend/')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = '人气推荐'

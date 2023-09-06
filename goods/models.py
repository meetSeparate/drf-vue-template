from django.db import models

# Create your models here.

class Goods(models.Model):
    name = models.CharField(verbose_name='商品名称', max_length=128)
    desc = models.TextField(verbose_name='商品简介', null=True)
    picture = models.FileField(upload_to='goods/', verbose_name='商品封面')
    orderNum = models.IntegerField(verbose_name='数量', null=True, blank=True)
    old_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='原商品价格', null=True, blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='商品价格')
    salesCount = models.IntegerField(verbose_name='销量人气', default=0)
    commentCount = models.IntegerField(verbose_name='商品评价', default=0)
    collectionCount = models.IntegerField(verbose_name='收藏人气', default=0)
    brand = models.CharField(verbose_name='品牌信息', max_length=128, null=True, blank=True)
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='发布时间', null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '商品管理'

class ShopDetailImage(models.Model):
    image = models.FileField(verbose_name='商品详情图片', upload_to='shop_detail/')
    shop = models.ForeignKey(to='Goods', on_delete=models.CASCADE, verbose_name='对应商品', null=True)

    def __str__(self):
        return self.shop.name

    class Meta:
        verbose_name_plural = '商品详情图片'

class GoodsSpecs(models.Model):
    name = models.CharField(verbose_name='商品规格名称', max_length=128)
    spec_type_choices = (
        (1, '颜色'),
        (2, '尺码')
    )
    spec_type = models.IntegerField(choices=spec_type_choices, verbose_name='规格类型', null=True)
    desc = models.CharField(verbose_name='商品规格介绍', max_length=256)
    picture = models.FileField(verbose_name='商品规格图片', upload_to='good_color/', null=True, blank=True)
    disabled = models.BooleanField(verbose_name='是否可选', default=False)
    selected = models.BooleanField(verbose_name='是否选中', default=False)
    shop = models.ForeignKey(to='Goods', on_delete=models.CASCADE, verbose_name='对应商品', null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '商品规格'

class Recommend(models.Model):
    title = models.CharField(verbose_name='标题', max_length=128)
    alt = models.CharField(verbose_name='描述', max_length=128)
    picture = models.FileField(verbose_name='人气推荐封面', upload_to='recommend/')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = '人气推荐'

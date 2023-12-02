from django.db import models
from user.models import UserInfo


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


class GoodsProperty(models.Model):
    name = models.CharField(verbose_name='商品属性名称', max_length=256)
    value = models.TextField(verbose_name='商品属性描述')
    shop = models.ForeignKey(to='Goods', on_delete=models.CASCADE, verbose_name='对应商品', null=True)

    def __str__(self):
        return self.shop.name

    class Meta:
        verbose_name_plural = '商品详情属性'


class GoodsSpecs(models.Model):
    name = models.CharField(verbose_name='商品规格名称', max_length=128)
    spec_type_choices = (
        (1, '颜色'),
        (2, '尺码'),
        (3, '规格')
    )
    spec_type = models.IntegerField(choices=spec_type_choices, verbose_name='规格类型', null=True)
    desc = models.CharField(verbose_name='商品规格介绍', max_length=256)
    picture = models.FileField(verbose_name='商品规格图片', upload_to='good_color/', null=True, blank=True)
    disabled = models.BooleanField(verbose_name='是否可选', default=False)
    shop = models.ForeignKey(to='Goods', on_delete=models.CASCADE, verbose_name='对应商品', null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '商品规格'


class GoodsSkus(models.Model):
    specs = models.ManyToManyField(to=GoodsSpecs, verbose_name='商品规格')
    old_price = models.DecimalField(verbose_name='组合原价', max_digits=10, decimal_places=2)
    price = models.DecimalField(verbose_name='组合现价', max_digits=10, decimal_places=2)
    inventory = models.IntegerField(verbose_name='库存', default=0)
    shop = models.ForeignKey(to='Goods', on_delete=models.CASCADE, verbose_name='对应商品', null=True)

    class Meta:
        verbose_name_plural = '商品规格组合'


class UserCart(models.Model):
    sku = models.ForeignKey(to='GoodsSkus', on_delete=models.CASCADE, verbose_name='商品sku规格', null=True)
    user = models.ForeignKey(to=UserInfo, on_delete=models.CASCADE, verbose_name='用户', null=True)
    buy_num = models.IntegerField(verbose_name='商品数量', default=1)
    selected = models.BooleanField(verbose_name='是否选中', default=False)

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name_plural = '用户购物车'


class OrderPre(models.Model):
    user = models.ForeignKey(to=UserInfo, on_delete=models.CASCADE, verbose_name='用户', null=True)
    cart = models.ForeignKey(to='UserCart', on_delete=models.CASCADE, verbose_name='购物车数据', null=True)
    create_date = models.DateTimeField(verbose_name='创建日期', auto_now_add=True, null=True)

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name_plural = '用户预购买'


class Address(models.Model):
    receiver = models.CharField(verbose_name='收件人姓名', max_length=256)
    concat = models.CharField(verbose_name='联系方式', max_length=256)
    provinceCode = models.CharField(verbose_name='省份编码', max_length=256)
    cityCode = models.CharField(verbose_name='城市编码', max_length=256)
    countyCode = models.CharField(verbose_name='区/县编码', max_length=256)
    address = models.CharField(verbose_name='详细地址', max_length=256)
    isDefault = models.IntegerField(verbose_name='是否为默认地址')
    fullLocation = models.CharField(verbose_name='地址', max_length=256)
    user = models.ForeignKey(to=UserInfo, on_delete=models.CASCADE, verbose_name='用户', null=True)

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name_plural = '收货地址'


class OrderMiddle(models.Model):
    skus = models.ForeignKey(to='GoodsSkus', on_delete=models.CASCADE, verbose_name='skus', null=True)
    buy_num = models.IntegerField(verbose_name='购买数量')

    def __str__(self):
        return '订单中间模型'

    class Meta:
        verbose_name_plural = '订单中间模型'


class Order(models.Model):
    user = models.ForeignKey(to=UserInfo, on_delete=models.CASCADE, verbose_name='用户', null=True)
    address = models.ForeignKey(to='Address', on_delete=models.CASCADE, verbose_name='收货地址', null=True)
    state = models.IntegerField(verbose_name='订单状态')
    countdown = models.IntegerField(verbose_name='倒计时')
    create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
    totalMoney = models.IntegerField(verbose_name='商品总价', null=True)
    postFee = models.IntegerField(verbose_name='运费')
    payMoney = models.IntegerField(verbose_name='应付金额', null=True)
    order_middle = models.ManyToManyField(to=OrderMiddle, verbose_name='订单商品参数', null=True)
    payChannel = models.CharField(verbose_name='支付方式', max_length=256)
    buyerMessage = models.CharField(verbose_name='买家留言', max_length=256, null=True)
    deliverTime = models.CharField(verbose_name='配送时间', max_length=256)

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name_plural = '订单'


class Recommend(models.Model):
    title = models.CharField(verbose_name='标题', max_length=128)
    alt = models.CharField(verbose_name='描述', max_length=128)
    picture = models.FileField(verbose_name='人气推荐封面', upload_to='recommend/')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = '人气推荐'

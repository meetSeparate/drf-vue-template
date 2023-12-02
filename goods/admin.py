from django.contrib import admin
from goods.models import GoodsSpecs, ShopDetailImage, Goods, GoodsProperty, GoodsSkus, UserCart
from category.models import Category

# Register your models here.

admin.site.register(GoodsSpecs)
admin.site.register(ShopDetailImage)
admin.site.register(Goods)
admin.site.register(Category)
admin.site.register(GoodsProperty)
admin.site.register(GoodsSkus)
admin.site.register(UserCart)
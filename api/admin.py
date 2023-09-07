from django.contrib import admin
from category.models import Category
from goods.models import Goods, Recommend, GoodsSkus
from banner.models import Banner

# Register your models here.

admin.site.register(Category)
admin.site.register(Goods)
admin.site.register(Banner)
admin.site.register(Recommend)
admin.site.register(GoodsSkus)
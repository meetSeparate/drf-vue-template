from django.contrib import admin
from category.models import Category
from goods.models import Goods

# Register your models here.

admin.site.register(Category)
admin.site.register(Goods)
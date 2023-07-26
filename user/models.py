from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.

class UserInfo(AbstractUser):
    name = models.CharField(verbose_name='姓名', max_length=32, null=True)
    gender = models.CharField(verbose_name='性别', max_length=32, null=True)
    age = models.IntegerField(verbose_name='年龄', null=True)
    phone = models.CharField(verbose_name='手机号', max_length=32, null=True)
    role = models.CharField(verbose_name='角色', max_length=32, null=True)

    user = models.ForeignKey(
        to='Characters',
        to_field='id',
        on_delete=models.SET_NULL,
        verbose_name='发布人', null=True, blank=True
    )

    def __str__(self):
        return self.username

    class Meta:
        # 联合索引,联合同步查询，提高效率
        index_together = ["username", "phone"]
        verbose_name_plural = '用户表'


class Characters(models.Model):
    title = models.CharField(verbose_name='角色名称', max_length=64)
    note = models.TextField(verbose_name='备注', null=True)
    create_date = models.DateTimeField(verbose_name='创建时间', auto_now_add=True, null=True)
    change_date = models.DateTimeField(verbose_name='创建时间', auto_now=True, null=True)

    menu = models.ManyToManyField(
        to='Menu',
        verbose_name='角色权限',
        null=True
    )

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = '角色表'


class Menu(models.Model):
    label = models.CharField(verbose_name='菜单名称', max_length=64)
    another_name = models.CharField(verbose_name='菜单别名', max_length=64, null=True)
    type = models.CharField(verbose_name='菜单类型', max_length=64)
    reveal = models.CharField(verbose_name='是否显示', null=True, max_length=64)
    path = models.CharField(verbose_name='菜单URL', max_length=128, null=True)
    menu_name = models.CharField(verbose_name='菜单Name', max_length=128, null=True)
    component_address = models.CharField(verbose_name='组件地址', max_length=128, null=True)
    redirect = models.CharField(verbose_name='重定向', max_length=128, null=True)
    menu_icon = models.CharField(verbose_name='菜单Icon', max_length=64, null=True)
    status = models.CharField(verbose_name='菜单状态', default='正常', max_length=64)
    parent_menu = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE,
                                    verbose_name='父菜单')

    def __str__(self):
        return self.label

    class Meta:
        verbose_name_plural = '菜单表'


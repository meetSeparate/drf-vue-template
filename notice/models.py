from django.db import models
from user.models import UserInfo

# Create your models here.
class Notice(models.Model):
    avatar = models.CharField(verbose_name='消息标识', max_length=256, null=True)
    title = models.CharField(verbose_name='消息标题', max_length=64)
    datetime = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
    description = models.TextField(verbose_name='详细描述')
    type = models.IntegerField(verbose_name='消息类型')

    user = models.ManyToManyField(
        to=UserInfo,
        verbose_name='对应用户',
    )

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = '消息'


class Image(models.Model):
    url = models.FileField(verbose_name='保存图片', upload_to='recognize')
    create_date = models.DateTimeField(verbose_name='识别时间', auto_now_add=True)

    def __str__(self):
        return str(self.create_date)[:10]

    class Meta:
        verbose_name_plural = '图片识别'

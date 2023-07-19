from django.db import models
from user.models import UserInfo


# Create your models here.
class Announcement(models.Model):
    content = models.TextField(verbose_name='公告内容')
    timestamp = models.DateTimeField(auto_now_add=True, verbose_name='发布日期')
    color = models.CharField(max_length=64, verbose_name='标志颜色')
    size = models.CharField(max_length=64, verbose_name='标志大小')

    user = models.ForeignKey(
        to=UserInfo,
        to_field='id',
        on_delete=models.SET_NULL,
        verbose_name='发布人', null=True, blank=True
    )

    def __str__(self):
        return self.timestamp

    class Meta:
        verbose_name_plural = '系统公告'

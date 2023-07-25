from django.db import models


# Create your models here.

class School(models.Model):
    name = models.CharField(verbose_name='学校名称', max_length=64)
    province = models.CharField(verbose_name='省份', max_length=64)
    city = models.CharField(verbose_name='城市', max_length=64)
    choose = models.CharField(verbose_name='选科', max_length=64)
    profession = models.CharField(verbose_name='专业', max_length=64)
    score = models.CharField(verbose_name='录取分数', max_length=64)
    ranking = models.CharField(verbose_name='录取排名', max_length=64)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '大学志愿'


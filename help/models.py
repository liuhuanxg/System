from django.db import models
from ckeditor.fields import RichTextField


class News(models.Model):
    class Meta:
        verbose_name = "在线留言"
        verbose_name_plural = "在线留言"

    user_name = models.CharField(verbose_name="姓名", max_length=30, unique=True)
    email = models.CharField(verbose_name="邮箱", max_length=30)
    phone = models.CharField(verbose_name="联系电话", max_length=30)
    des = RichTextField(verbose_name="详情", blank=True, null=True)
    add_time = models.DateTimeField(verbose_name="留言时间", auto_now_add=True)
    modify_time = models.DateTimeField(verbose_name="修改时间", auto_now=True)

    def __str__(self):
        return self.user_name

class HelpUrl(models.Model):
    class Meta:
        verbose_name = "友情链接"
        verbose_name_plural = "友情链接"

    web_name = models.CharField(verbose_name="网站名称", max_length=100, unique=True)
    href = models.TextField(verbose_name="友情链接")
    add_time = models.DateTimeField(verbose_name="添加时间", auto_now_add=True)
    modify_time = models.DateTimeField(verbose_name="修改时间", auto_now=True)

    def __str__(self):
        return self.web_name
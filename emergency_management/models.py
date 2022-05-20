from django.db import models
from ckeditor.fields import RichTextField
from django.utils.safestring import mark_safe
import datetime
import django.utils.timezone as timezone
# 事件类型
class EventType(models.Model):
    class Meta:
        verbose_name = "事件类型"
        verbose_name_plural = "事件类型"

    type_name = models.CharField(verbose_name="类型名称", max_length=30, unique=True)
    # type_status = models.BooleanField(verbose_name="类型状态", default=1)
    add_time = models.DateTimeField(verbose_name="创建时间", default=timezone.now)
    modify_time = models.DateTimeField(verbose_name="修改时间", auto_now=True)

    def __str__(self):
        return self.type_name

class Message(models.Model):
    class Meta:
        verbose_name = "信息接收"
        verbose_name_plural = "信息接收"

    status_choices = [
        ("1", "未读"),
        ("2", "代办"),
        ("3", "办理中"),
        ("4", "已办理"),
    ]
    title_name = models.CharField(verbose_name="信息名称", max_length=30, unique=True)
    create_user = models.CharField(verbose_name="发布部门", max_length=30)
    status = models.CharField(verbose_name="类型状态", choices=status_choices, max_length=1, default="1")
    des = RichTextField(verbose_name="信息详情", blank=True, null=True)
    add_time = models.DateTimeField(verbose_name="发布时间", default=timezone.now)
    happend_time = models.DateTimeField(verbose_name="发生时间", default=timezone.now)
    modify_time = models.DateTimeField(verbose_name="处理时间", auto_now=True)

    def __str__(self):
        return self.title_name

    def des_html(self):
        return mark_safe(self.des)
    des_html.short_description = "详情"

# 突发事件
class Events(models.Model):
    class Meta:
        verbose_name = "信息提取"
        verbose_name_plural = "信息提取"

    event_name = models.CharField(verbose_name="事件名称", max_length=30, unique=True)
    befor_event_name = models.CharField(verbose_name="事件前件", max_length=30, null=True, blank=True)
    keyword = models.CharField(verbose_name="关键词", max_length=30, null=True)
    people_number = models.IntegerField(verbose_name="受灾人数", default=0)
    die_number = models.IntegerField(verbose_name="死亡人数", default=0)
    hurt_number = models.IntegerField(verbose_name="受伤人数", default=0)
    level = models.IntegerField(verbose_name="事故级别", default=1)
    event_desc = models.TextField(verbose_name="事件描述", null=True)
    processing_results= models.TextField(verbose_name="处理结果", null=True)
    event_type = models.ManyToManyField("EventType", verbose_name="事件类型")
    create_time = models.DateTimeField(verbose_name="发生时间", default=timezone.now)
    open_time = models.DateTimeField(verbose_name="发布时间", default=timezone.now)
    add_time = models.DateTimeField(verbose_name="创建时间", default=timezone.now)
    modify_time = models.DateTimeField(verbose_name="处理时间", auto_now=True)

    def __str__(self):
        return self.event_name


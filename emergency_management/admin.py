import os
import json
from django.contrib import admin
from emergency_management.models import *
from django.utils.html import format_html
from System.settings import base_url

admin.site.site_header = '预案管理系统'
admin.site.site_title = '预案管理系统'


# 事件类型
@admin.register(EventType)
class EventTypeAdmin(admin.ModelAdmin):
    list_display = ["type_name", "add_time", "modify_time"]
    date_hierarchy = 'add_time'
    # search_fields = ["type_name"]
    list_filter = ['type_name', 'add_time']
    list_per_page = 30


# 信息提取
@admin.register(Events)
class EventsAdmin(admin.ModelAdmin):
    list_display = ["event_name", "event_name", "keyword", "people_number", "level", "create_time", "open_time"]
    search_fields = ["event_name", "event_type"]
    list_per_page = 50


# 信息接收
@admin.register(Message)
class MessageAdmin(admin.ModelAdmin):
    list_display = ["title_name", "create_user", "add_time", "show_firm_url", "des_html"]
    search_fields = ["title_name", "status"]
    list_per_page = 50
    list_filter = ["status"]

    def change_view(self, request, object_id, form_url='', extra_context=None):
        print(request.user)
        print(dir(request.user))
        print(request.user.get_all_permissions())
        permissions = request.user.get_all_permissions()
        if 'emergency_management.change_message' not in permissions or 'emergency_management.add_message' not in permissions:
            MessageAdmin.fieldsets = (
                ("基本信息", {'fields': ['title_name', 'create_user', "status"]}),
                ("介绍", {'fields': ['des_html']})
            )
        return super().change_view(
            request, object_id, form_url, extra_context=extra_context,
        )

    def show_firm_url(self, obj):
        message = obj.status
        color = "blue"
        flag = True
        if obj.status == "1":
            message = "【未读】"
            color = "blue"
        elif obj.status == "2":
            message = "【代办】"
            color = "green"
        elif obj.status == "3":
            message = "【办理中】"
            color = "yellow"
        elif obj.status == "4":
            message = "【已处理】"
            flag = False
        if flag:
            return format_html(
                "<a href='{}emergency_management/update_status/{}?action={}' style='color:{};'>{}</a>".format(
                    base_url, obj.id, obj.status, color, message)
            )
        return message

    show_firm_url.short_description = "操作"
    formfield_overrides = {
        models.TextField: {'widget': Message.des},
    }
    readonly_fields = ["des_html"]


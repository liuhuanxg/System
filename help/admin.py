import os
import json
from django.contrib import admin
from help.models import *
from django.utils.html import format_html


# 事件类型
@admin.register(News)
class HelpAdmin(admin.ModelAdmin):
    list_display = ["user_name", "email", "phone", "add_time"]
    date_hierarchy = 'add_time'
    search_fields = ["des"]
    list_filter = ['user_name']
    list_per_page = 30


# 事件类型
@admin.register(HelpUrl)
class HelpAdmin(admin.ModelAdmin):
    list_display = ["web_name", "show_firm_url", "add_time"]
    date_hierarchy = 'add_time'
    # search_fields = ["web_name"]
    list_filter = ['web_name']
    list_per_page = 30

    def show_firm_url(self, obj):
        return format_html(
            "<a href='{0}' target='_blank'>{0}</a>".format(obj.href))

    show_firm_url.short_description = "网站网址"

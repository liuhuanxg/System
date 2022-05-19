#-*-coding:utf-8 -*-

from django.urls import path, include, re_path
from .views import *
from django.contrib import admin


urlpatterns = [
    path("update_status/<int:id>", update_status)
]

app_name = "emergency_management"
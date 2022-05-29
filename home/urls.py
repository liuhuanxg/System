#-*-coding:utf-8 -*-

from django.urls import path, include, re_path
from .views import *
from django.contrib import admin


urlpatterns = [
    path("query_user/", query_user)
]

app_name = "home"
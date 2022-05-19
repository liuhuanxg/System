from django.contrib import admin
from home.models import *

admin.site.site_header = '应急预案管理系统'
admin.site.site_title = '应急预案管理系统'

from django.contrib import admin
from django.utils.text import capfirst


# from django.utils.datastructures import SortedDict


def find_model_index(name):
    count = 0
    for model, model_admin in admin.site._registry.items():
        print("model:{},model_admin:{}".format(model, model_admin))
        if capfirst(model._meta.verbose_name_plural) == name:
            return count
        else:
            count += 1
    return count


def index_decorator(func):
    def inner(*args, **kwargs):
        templateresponse = func(*args, **kwargs)
        for app in templateresponse.context_data['app_list']:
            app['models'].sort(key=lambda x: find_model_index(x['name']))
        return templateresponse

    return inner


# print("print(admin.site):{}".format(admin.site.index))
# registry = dict()
# registry.update(admin.site._registry)
# admin.site._registry = registry
# admin.site.index = index_decorator(admin.site.index)
# admin.site.app_index = index_decorator(admin.site.app_index)
# print("print(admin.site):{}".format(admin.site))

class EventAdminSite(admin.AdminSite):
    def get_app_list(self, request):
        """
        Return emergency_management sorted list of all the installed apps that have been
        registered in this site.
        """
        ordering = {
            "预案编制": 1,
            "预案模板": 2,
            "预案生成": 3,
            "城市录入": 4,
            "Assessment": 5,
        }
        app_dict = self._build_app_dict(request)
        # emergency_management.sort(key=lambda x: home.index(x[0]))
        # Sort the apps alphabetically.
        app_list = sorted(app_dict.values(), key=lambda x: x['name'].lower())
        # Sort the models alphabetically within each app.
        for app in app_list:
            app['models'].sort(key=lambda x: ordering[x['name']])
        return app_list


# 预案编制
@admin.register(PlanyType)
class PlanyTypeAdmin(admin.ModelAdmin):
    list_display = ["type_name", "type_desc_str", "type_status", "add_time", "modify_time"]
    search_fields = ["type_name"]
    list_per_page = 50
    list_filter = ["type_name"]

    def type_desc_str(self, obj):
        if len(obj.type_desc) >= 10:
            return obj.type_desc[0:10] + "..."
        return obj.type_desc

    type_desc_str.short_description = "编制描述"


# 方案模板管理
@admin.register(PlanyTemplate)
class PlanyTemplateAdmin(admin.ModelAdmin):
    list_display = ["template_name", "ersion_num", "company_name", "create_user", "create_time"]
    search_fields = ["template_name", "ersion_num"]
    list_per_page = 50
    list_filter = ["template_name"]


# 方案模板管理
@admin.register(Plans)
class PlansAdmin(admin.ModelAdmin):
    list_display = ["plan_name", "template", "plantype", "plan_implementer", "add_time"]
    search_fields = ["plan_name", "template", "plantype", "plan_implementer"]
    list_per_page = 50
    list_filter = [
        "plan_name",
        "plantype",
        "implementation_objectives",
        "plan_implementer"
    ]


class AssessmentInline(admin.TabularInline):
    model = Assessment
    extra = 1


# 城市管理
@admin.register(City)
class CityAdmin(admin.ModelAdmin):
    list_display = ["city_name", "add_time", "modify_time"]
    search_fields = ["city_name"]
    list_per_page = 50
    list_filter = ["city_name"]
    inlines = [AssessmentInline]


# 方案评估
@admin.register(Assessment)
class AssessmentAdmin(admin.ModelAdmin):
    list_display = ["assessment_name", "assessment_user", "plan", "city", "add_time", "file"]
    # search_fields = ["assessment_name", "assessment_user"]
    list_per_page = 50
    list_filter = ["city__city_name", "assessment_name"]


# 指定导航顺序
apps_index = ["PlanyType", "PlanyTemplate", "Plans", "City", "Assessment"]

from django.apps import apps


def find_app_index(app_label):
    app = apps.get_app_config(app_label)
    main_menu_index = getattr(app, 'main_menu_index', 9999)
    return main_menu_index


def index_decorator(func):
    def inner(*args, **kwargs):
        templateresponse = func(*args, **kwargs)
        app_list = templateresponse.context_data['app_list']
        app_list.sort(key=lambda r: find_app_index(r['app_label']))
        # print("app_list:", app_list)
        for app in app_list:
            print("app:{}".format(app))
            if app["app_label"] == "home":
                # 按照指定顺序排序
                models = app["models"]
                new_models = []
                for i in models:
                    model_name = i["object_name"]
                    print("model_name:{}".format(model_name))
                    pos = apps_index.index(model_name)
                    new_models.append({"pos": pos, "model": i})
                new_models.sort(key=lambda s: s["pos"])
                # app['models'].sort(key=lambda x: find_model_index(x['name']))
                models = [x["model"] for x in new_models]
                app["models"] = models
                # print("models:", models)
        return templateresponse

    return inner


admin.site.index = index_decorator(admin.site.index)
admin.site.app_index = index_decorator(admin.site.app_index)

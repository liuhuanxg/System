from django.db import models
import django.utils.timezone as timezone

# 预案编制
class PlanyType(models.Model):
    class Meta:
        verbose_name = "预案编制"
        verbose_name_plural = "预案编制"

    type_name = models.CharField(verbose_name="编制名称", max_length=30, unique=True)
    type_desc = models.TextField(verbose_name="编制描述")
    type_status = models.BooleanField(verbose_name="编制状态", default=1)
    add_time = models.DateTimeField(verbose_name="创建时间", default=timezone.now)
    modify_time = models.DateTimeField(verbose_name="修改时间", auto_now=True)

    def __str__(self):
        return self.type_name


# 预案模板
class PlanyTemplate(models.Model):
    class Meta:
        verbose_name = "预案模板"
        verbose_name_plural = "预案模板"

    template_name = models.CharField(verbose_name="模板名称", max_length=30, unique=True)
    ersion_num = models.CharField(verbose_name="版本号", max_length=30)
    company_name = models.CharField(verbose_name="编制单位", max_length=30)
    create_user = models.CharField(verbose_name="编制人", max_length=30)
    create_time = models.DateTimeField(verbose_name="编制时间", auto_now=True)
    use_info = models.TextField(verbose_name="使用说明", null=True, blank=True)
    description = models.TextField(verbose_name="模板描述", null=True, blank=True)
    add_time = models.DateTimeField(verbose_name="描述信息", default=timezone.now)
    modify_time = models.DateTimeField(verbose_name="修改时间", auto_now=True)

    def __str__(self):
        return self.template_name


# 预案管理
class Plans(models.Model):
    class Meta:
        verbose_name = "预案生成"
        verbose_name_plural = "预案生成"

    plan_name = models.CharField(verbose_name="预案名称", max_length=100)
    template = models.ForeignKey("PlanyTemplate", on_delete=models.DO_NOTHING, verbose_name="处理模板", null=True)
    plantype = models.ForeignKey("PlanyType", on_delete=models.DO_NOTHING, verbose_name="预案编制", null=True)
    implementation_objectives = models.CharField(verbose_name="实施目标", null=True, max_length=100, blank=True)
    plan_implementer = models.CharField(verbose_name="预案实施人", null=True, blank=True, max_length=100)
    plan_des = models.TextField(verbose_name="方案描述", null=True, blank=True)
    plan_detail = models.TextField(verbose_name="方案细节", null=True)
    add_time = models.DateTimeField(verbose_name="创建时间", default=timezone.now)
    modify_time = models.DateTimeField(verbose_name="修改时间", auto_now=True)

    def __str__(self):
        return self.plan_name


# 城市分类
class City(models.Model):
    class Meta:
        verbose_name = "城市录入"
        verbose_name_plural = "城市录入"

    city_name = models.CharField(verbose_name="城市名称", max_length=30, unique=True)
    # type_status = models.BooleanField(verbose_name="类型状态", default=1)
    add_time = models.DateTimeField(verbose_name="创建时间", default=timezone.now)
    modify_time = models.DateTimeField(verbose_name="修改时间", auto_now=True)

    def __str__(self):
        return self.city_name


# 方案评估
class Assessment(models.Model):
    class Meta:
        verbose_name = "方案评估"
        verbose_name_plural = "方案评估"

    assessment_name = models.CharField(verbose_name="评估名称", max_length=30, unique=True)
    assessment_description = models.TextField(verbose_name="评估描述")
    file = models.FileField(verbose_name="评估文件", upload_to='upload/user')
    plan = models.ForeignKey("Plans", verbose_name="方案名称", on_delete=models.DO_NOTHING)
    city = models.ForeignKey("City", verbose_name="评估城市", on_delete=models.DO_NOTHING)
    assessment_user = models.CharField(verbose_name="评估人", max_length=100)
    add_time = models.DateTimeField(verbose_name="评估时间", default=timezone.now)
    modify_time = models.DateTimeField(verbose_name="修改时间", auto_now=True)

    def __str__(self):
        return self.assessment_name

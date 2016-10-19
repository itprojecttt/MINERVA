from django.contrib import admin
from .models import FineMotorMilestone, FineMotorChecklist, GrossMotorMilestone, GrossMotorChecklist, ChildData, \
    WeightAndHeightData, TeethData, HeadData


# Register your models here.
class FineMotorMilestoneAdmin(admin.ModelAdmin):
    fields = ('fm_milestone', 'start', 'seven_five', 'finish')
    list_display = ('fm_milestone', 'start', 'seven_five', 'finish')


class FineMotorChecklistAdmin(admin.ModelAdmin):
    fields = ('uid_fm_milestone', 'uid_user', 'timestamp')
    list_display = ('uid_fm_milestone', 'uid_user', 'timestamp')


class GrossMotorMilestoneAdmin(admin.ModelAdmin):
    fields = ('g_milestone', 'start', 'seven_five', 'finish')
    list_display = ('g_milestone', 'start', 'seven_five', 'finish')


class GrossMotorChecklistAdmin(admin.ModelAdmin):
    fields = ('uid_g_milestone', 'uid_user', 'timestamp')
    list_display = ('uid_g_milestone', 'uid_user', 'timestamp')


class ChildDataAdmin(admin.ModelAdmin):
    fields = ('uid_user', 'fullname', 'nickname', 'gender', 'birthday')
    list_display = ('uid_user', 'fullname', 'nickname', 'gender', 'birthday')


class WeightAndHeightDataAdmin(admin.ModelAdmin):
    fields = ('uid_child', 'weight', 'height', 'date_w_and_h')
    list_display = ('uid_child', 'weight', 'height', 'date_w_and_h')


class TeethDataAdmin(admin.ModelAdmin):
    fields = ('uid_child', 'teeth', 'date_teeth')
    list_display = ('uid_child', 'teeth', 'date_teeth')


class HeadDataAdmin(admin.ModelAdmin):
    fields = ('uid_child', 'head_size', 'date_head')
    list_display = ('uid_child', 'head_size', 'date_head')


admin.site.register(FineMotorMilestone, FineMotorMilestoneAdmin)
admin.site.register(FineMotorChecklist, FineMotorChecklistAdmin)
admin.site.register(ChildData, ChildDataAdmin)
admin.site.register(WeightAndHeightData, WeightAndHeightDataAdmin)
admin.site.register(TeethData, TeethDataAdmin)
admin.site.register(HeadData, HeadDataAdmin)

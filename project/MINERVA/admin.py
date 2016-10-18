from django.contrib import admin
from .models import Milestone, UserChecklist, ChildData, WeightAndHeightData, TeethData, HeadData


# Register your models here.
class MilestoneAdmin(admin.ModelAdmin):
    fields = ('milestone', 'start', 'seven_five', 'finish')
    list_display = ('milestone', 'start', 'seven_five', 'finish')


class UserChecklistAdmin(admin.ModelAdmin):
    fields = ('uid_milestone', 'uid_user', 'timestamp')
    list_display = ('uid_milestone', 'uid_user', 'timestamp')


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


admin.site.register(Milestone, MilestoneAdmin)
admin.site.register(UserChecklist, UserChecklistAdmin)
admin.site.register(ChildData, ChildDataAdmin)
admin.site.register(WeightAndHeightData, WeightAndHeightDataAdmin)
admin.site.register(TeethData, TeethDataAdmin)
admin.site.register(HeadData, HeadDataAdmin)

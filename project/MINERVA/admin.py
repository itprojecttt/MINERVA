from django.contrib import admin
from .models import PersonalSocialMilestone, PersonalSocialChecklist, GrossMotorMilestone, GrossMotorChecklist, ChildData, \
    WeightAndHeightData, TeethData, HeadData


# Register your models here.
class PersonalSocialMilestoneAdmin(admin.ModelAdmin):
    fields = ('ps_milestone', 'start', 'seven_five', 'finish')
    list_display = ('ps_milestone', 'start', 'seven_five', 'finish')


class PersonalSocialChecklistAdmin(admin.ModelAdmin):
    fields = ('uid_ps_milestone', 'uid_user', 'uid_child', 'timestamp')
    list_display = ('uid_ps_milestone', 'uid_user', 'uid_child', 'timestamp')


class GrossMotorMilestoneAdmin(admin.ModelAdmin):
    fields = ('gm_milestone', 'start', 'seven_five', 'finish')
    list_display = ('gm_milestone', 'start', 'seven_five', 'finish')


class GrossMotorChecklistAdmin(admin.ModelAdmin):
    fields = ('uid_gm_milestone', 'uid_user', 'uid_child', 'timestamp')
    list_display = ('uid_gm_milestone', 'uid_user', 'uid_child', 'timestamp')


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


admin.site.register(GrossMotorMilestone, GrossMotorMilestoneAdmin)
admin.site.register(GrossMotorChecklist, GrossMotorChecklistAdmin)
admin.site.register(PersonalSocialMilestone, PersonalSocialMilestoneAdmin)
admin.site.register(PersonalSocialChecklist, PersonalSocialChecklistAdmin)
admin.site.register(ChildData, ChildDataAdmin)
admin.site.register(WeightAndHeightData, WeightAndHeightDataAdmin)
admin.site.register(TeethData, TeethDataAdmin)
admin.site.register(HeadData, HeadDataAdmin)

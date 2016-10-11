from django.contrib import admin
from .models import Milestone, UserChecklist


# Register your models here.
class MilestoneAdmin(admin.ModelAdmin):
    fields = ('milestone', 'start', 'seven_five', 'finish')
    list_display = ('milestone', 'start', 'seven_five', 'finish')


class UserChecklistAdmin(admin.ModelAdmin):
    fields = ('uid_milestone', 'uid_user', 'timestamp')
    list_display = ('uid_milestone', 'uid_user', 'timestamp')


admin.site.register(Milestone, MilestoneAdmin)
admin.site.register(UserChecklist, UserChecklistAdmin)

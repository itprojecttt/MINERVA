from django.contrib import admin
from .models import Milestone, UserChecklist


# Register your models here.
class MilestoneAdmin(admin.ModelAdmin):
    fields = ('milestone', 'start', 'seven_five', 'finish')
    list_display = ('milestone', 'start', 'seven_five', 'finish')


class ChoiceInline(admin.TabularInline):
    fieldsets = [
        ('Milestone', {'fields': ['uid_milestone']}),
        ('User', {'fields': ['uid_user']}),
        ('Timestamp', {'fields': ['timestamp']})
    ]

admin.site.register(Milestone)
admin.site.register(UserChecklist)

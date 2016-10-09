from django.contrib import admin
from .models import Milestone, UserChecklist


# Register your models here.
class MilestoneAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['milestone']})
    ]
    list_display = ('milestone')
    search_fields = ['milestone']


class ChoiceInline(admin.TabularInline):
    fieldsets = [
        (None, {'fields': ['choice_text']}),
        ('Date information', {'fields': ['votes']}),
    ]

admin.site.register(Milestone)
admin.site.register(UserChecklist)

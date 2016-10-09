from django.contrib import admin
from .models import Milestone, UserChecklist


# Register your models here.
class MilestoneAdmin(admin.ModelAdmin):
    fields = ('milestone', 'start', 'seven_five', 'finish')
    list_display = ('milestone', 'start', 'seven_five', 'finish')


<<<<<<< HEAD
admin.site.register(Milestone, MilestoneAdmin)
=======
class ChoiceInline(admin.TabularInline):
    fieldsets = [
        ('Milestone', {'fields': ['uid_milestone']}),
        ('User', {'fields': ['uid_user']}),
        ('Timestamp', {'fields': ['timestamp']})
    ]

admin.site.register(Milestone)
>>>>>>> 41e57f43589edd20bcc7bc14e2ee8efa6be550fe
admin.site.register(UserChecklist)

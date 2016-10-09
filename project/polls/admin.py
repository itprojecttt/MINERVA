from django.contrib import admin
from .models import Choice, Question


# Register your models here.
class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['question_text']}),
        ('Date information', {'fields': ['pub_date']}),
    ]
    list_display = ('question_text', 'pub_date', 'was_published_recently')
    list_filter = ['pub_date']
    search_fields = ['question_text']


class ChoiceInline(admin.TabularInline):
    fieldsets = [
        (None, {'fields': ['choice_text']}),
        ('Date information', {'fields': ['votes']}),
    ]


admin.site.register(Question, QuestionAdmin)
admin.site.register(Choice)

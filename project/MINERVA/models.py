from django.db import models
from django.contrib.auth.models import User


class Milestone(models.Model):
    milestone = models.CharField(max_length=50)
    # unit of start, final and 75th percentile in MONTHS
    start = models.DecimalField(max_digits=5, decimal_places=2)
    seven_five = models.DecimalField(max_digits=5, decimal_places=2)
    finish = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return self.milestone


class UserChecklist(models.Model):
    uid_milestone = models.ForeignKey(Milestone)
    uid_user = models.ForeignKey(User)
    timestamp = models.DateField()


class PhysicalInput(models.Model):
    fullname = models.CharField(max_length=50)
    nickname = models.CharField(max_length=15)
    gender_choices = (
        ('M', 'Male'),
        ('F', 'Female'),
    )
    gender = models.CharField(max_length=1, choices=gender_choices)
    # Set date for birthday, weight & height history, teeth history and head circumference history
    # date =
    weight = models.IntegerField()
    height = models.IntegerField()
    teeth = models.IntegerField()
    head_size = models.IntegerField()

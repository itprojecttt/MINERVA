from django.db import models
from django.contrib.auth.models import User


class Milestone(models.Model):
    milestone = models.CharField(max_length=50)
    # unit of start, final and 75th percentile in MONTHS
    start = models.DecimalField(max_digits=5, decimal_places=2)
    finish = models.DecimalField(max_digits=5, decimal_places=2)
    seven_five = models.DecimalField(max_digits=5, decimal_places=2)


class UserChecklist(models.Model):
    uid_milestone = models.ForeignKey(Milestone)
    uid_user = models.ForeignKey(User)
    timestamp = models.DateField()
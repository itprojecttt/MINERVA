from django.db import models
from django.contrib.auth.models import User
import django.utils.timezone


class FineMotorMilestone(models.Model):
    fm_milestone = models.CharField(max_length=50)
    # unit of start, final and 75th percentile in MONTHS
    start = models.DecimalField(max_digits=5, decimal_places=2)
    seven_five = models.DecimalField(max_digits=5, decimal_places=2)
    finish = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return self.fm_milestone


class GrossMotorMilestone(models.Model):
    gm_milestone = models.CharField(max_length=50)
    # unit of start, final and 75th percentile in MONTHS
    start = models.DecimalField(max_digits=5, decimal_places=2)
    seven_five = models.DecimalField(max_digits=5, decimal_places=2)
    finish = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return self.gm_milestone


class PersonalSocialMilestone(models.Model):
    ps_milestone = models.CharField(max_length=50)
    # unit of start, final and 75th percentile in MONTHS
    start = models.DecimalField(max_digits=5, decimal_places=2)
    seven_five = models.DecimalField(max_digits=5, decimal_places=2)
    finish = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return self.ps_milestone


class ChildData(models.Model):
    fullname = models.CharField(max_length=50)
    nickname = models.CharField(max_length=15)
    uid_user = models.ForeignKey(User)
    gender_choices = (
        ('M', 'Male'),
        ('F', 'Female'),
    )
    gender = models.CharField(max_length=1, choices=gender_choices)
    birthday = models.DateField(default=django.utils.timezone.now)

    def __str__(self):
        return self.fullname


class FineMotorChecklist(models.Model):
    uid_fm_milestone = models.ForeignKey(FineMotorMilestone)
    uid_user = models.ForeignKey(User)
    uid_child = models.ForeignKey(ChildData, null=True)
    timestamp = models.DateField()


class GrossMotorChecklist(models.Model):
    uid_gm_milestone = models.ForeignKey(GrossMotorMilestone)
    uid_user = models.ForeignKey(User)
    uid_child = models.ForeignKey(ChildData, null=True)
    timestamp = models.DateField()

    def __str__(self):
        return str(self.uid_gm_milestone)


class PersonalSocialChecklist(models.Model):
    uid_ps_milestone = models.ForeignKey(PersonalSocialMilestone)
    uid_user = models.ForeignKey(User)
    uid_child = models.ForeignKey(ChildData, null=True)
    timestamp = models.DateField()

    def __str__(self):
        return str(self.uid_ps_milestone)


class WeightAndHeightData(models.Model):
    uid_child = models.ForeignKey(ChildData, on_delete=models.CASCADE)
    weight = models.DecimalField(max_digits=5, decimal_places=2)
    height = models.DecimalField(max_digits=5, decimal_places=2)
    date_w_and_h = models.DateField()


class TeethData(models.Model):
    uid_child = models.ForeignKey(ChildData)
    teeth = models.IntegerField()
    date_teeth = models.DateField()


class HeadData(models.Model):
    uid_child = models.ForeignKey(ChildData)
    head_size = models.DecimalField(max_digits=5, decimal_places=2)
    date_head = models.DateField()

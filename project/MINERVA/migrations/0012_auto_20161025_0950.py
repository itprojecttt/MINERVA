# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-10-25 02:50
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('MINERVA', '0011_auto_20161021_1757'),
    ]

    operations = [
        migrations.AlterField(
            model_name='personalsocialchecklist',
            name='uid_ps_milestone',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MINERVA.PersonalSocialMilestone'),
        ),
    ]
# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-11-08 07:03
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('MINERVA', '0014_auto_20161107_0905'),
    ]

    operations = [
        migrations.RenameField(
            model_name='weightandheightdata',
            old_name='child',
            new_name='uid_child',
        ),
    ]

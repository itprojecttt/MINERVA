# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-10-18 05:24
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MINERVA', '0003_auto_20161018_1118'),
    ]

    operations = [
        migrations.AddField(
            model_name='childdata',
            name='birthday',
            field=models.DateField(default=datetime.datetime(2016, 10, 18, 12, 24, 17, 192807)),
        ),
    ]

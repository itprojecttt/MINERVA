# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-10-19 06:11
from __future__ import unicode_literals

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('MINERVA', '0009_auto_20161019_1258'),
    ]

    operations = [
        migrations.CreateModel(
            name='GrossMotorChecklist',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='GrossMotorMilestone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gm_milestone', models.CharField(max_length=50)),
                ('start', models.DecimalField(decimal_places=2, max_digits=5)),
                ('seven_five', models.DecimalField(decimal_places=2, max_digits=5)),
                ('finish', models.DecimalField(decimal_places=2, max_digits=5)),
            ],
        ),
        migrations.AlterField(
            model_name='childdata',
            name='birthday',
            field=models.DateField(default=datetime.datetime(2016, 10, 19, 13, 11, 54, 878641)),
        ),
        migrations.AddField(
            model_name='grossmotorchecklist',
            name='uid_gm_milestone',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MINERVA.GrossMotorMilestone'),
        ),
        migrations.AddField(
            model_name='grossmotorchecklist',
            name='uid_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]

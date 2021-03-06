# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-10-19 05:53
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('MINERVA', '0007_auto_20161018_1257'),
    ]

    operations = [
        migrations.CreateModel(
            name='FineMotorMilestone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fm_milestone', models.CharField(max_length=50)),
                ('start', models.DecimalField(decimal_places=2, max_digits=5)),
                ('seven_five', models.DecimalField(decimal_places=2, max_digits=5)),
                ('finish', models.DecimalField(decimal_places=2, max_digits=5)),
            ],
        ),
        migrations.RenameModel(
            old_name='UserChecklist',
            new_name='FineMotorChecklist',
        ),
        migrations.DeleteModel(
            name='Milestone',
        ),
        migrations.RemoveField(
            model_name='finemotorchecklist',
            name='uid_milestone',
        ),
        migrations.AlterField(
            model_name='childdata',
            name='birthday',
            field=models.DateField(default=datetime.datetime(2016, 10, 19, 12, 52, 6, 936678)),
        ),
        migrations.AddField(
            model_name='finemotorchecklist',
            name='uid_fm_milestone',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='MINERVA.FineMotorMilestone'),
            preserve_default=False,
        ),
    ]

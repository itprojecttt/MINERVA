# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-10-21 10:57
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('MINERVA', '0010_auto_20161019_1311'),
    ]

    operations = [
        migrations.CreateModel(
            name='PersonalSocialChecklist',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateField()),
                ('uid_ps_milestone', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MINERVA.GrossMotorMilestone')),
                ('uid_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='PersonalSocialMilestone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ps_milestone', models.CharField(max_length=50)),
                ('start', models.DecimalField(decimal_places=2, max_digits=5)),
                ('seven_five', models.DecimalField(decimal_places=2, max_digits=5)),
                ('finish', models.DecimalField(decimal_places=2, max_digits=5)),
            ],
        ),
        migrations.AlterField(
            model_name='childdata',
            name='birthday',
            field=models.DateField(default=django.utils.timezone.now),
        ),
    ]

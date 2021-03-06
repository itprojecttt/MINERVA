# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-10-18 04:18
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('MINERVA', '0002_physicalinput'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChildData',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fullname', models.CharField(max_length=50)),
                ('nickname', models.CharField(max_length=15)),
                ('gender', models.CharField(choices=[('M', 'Male'), ('F', 'Female')], max_length=1)),
                ('uid_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='HeadData',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('head_size', models.DecimalField(decimal_places=2, max_digits=5)),
                ('date_head', models.DateField()),
                ('uid_child', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MINERVA.ChildData')),
            ],
        ),
        migrations.CreateModel(
            name='TeethData',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('teeth', models.IntegerField()),
                ('date_teeth', models.DateField()),
                ('uid_child', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MINERVA.ChildData')),
            ],
        ),
        migrations.CreateModel(
            name='WeightAndHeightData',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('weight', models.DecimalField(decimal_places=2, max_digits=5)),
                ('height', models.DecimalField(decimal_places=2, max_digits=5)),
                ('date_w_and_h', models.DateField()),
                ('uid_child', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MINERVA.ChildData')),
            ],
        ),
        migrations.RemoveField(
            model_name='physicalinput',
            name='uid_user',
        ),
        migrations.DeleteModel(
            name='PhysicalInput',
        ),
    ]

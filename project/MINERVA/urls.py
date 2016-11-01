"""MINERVA URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from .views import login, auth_view, homepage, logout, redirect, register, gm_milestone_view, gm_milestone_auth, \
    ps_milestone_view, ps_milestone_auth, physical_input_view, physical_input_auth
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^polls/', include('polls.urls')),
    url(r'^login/$', login),
    url(r'^auth/$', auth_view),
    url(r'^homepage/$', homepage),
    url(r'^logout/$', logout),
    url(r'^redirect/$', redirect),
    url(r'^register/$', register),
    url(r'^milestones/physical/$', gm_milestone_view),
    url(r'^milestones-auth/physical/$', gm_milestone_auth),
    url(r'^milestones/personal-social/$', ps_milestone_view ),
    url(r'^milestones-auth/personal-social/$', ps_milestone_auth),
    url(r'^physical-input/$', physical_input_view),
    url(r'^physical-input-auth/$', physical_input_auth)
]

urlpatterns += staticfiles_urlpatterns()

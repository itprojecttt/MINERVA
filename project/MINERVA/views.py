from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect
from django.contrib import auth
from django.template.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from .models import Milestone, UserChecklist
import datetime


def login(request):
    c = {}
    c.update(csrf(request))
    return render_to_response('login.html', c)


def auth_view(request):
    username = request.POST.get('username', '')
    password = request.POST.get('password', '')
    user = auth.authenticate(username=username, password=password)

    if user is not None:
        auth.login(request, user)
        return HttpResponseRedirect('/loggedin')
    else:
        return render_to_response('redirect.html', {'tag': 'login'})


def loggedin(request):
    if request.user.is_authenticated():
        return render_to_response('loggedin.html', {'username': request.user.username})
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def redirect(request):
    return render_to_response('redirect.html')


def logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/login')


def register(request):
    firstname = request.POST.get('firstname', '')
    lastname = request.POST.get('lastname', '')
    username = request.POST.get('username_reg', '')
    email = request.POST.get('email', '')
    password = request.POST.get('password_reg', '')
    password2 = request.POST.get('password2_reg', '')

    checker = [firstname, lastname, username, email, password, password2]

    if '' in checker or password != password2:
        return render_to_response('redirect.html', {'tag': 'register'})

    User.objects.create_user(first_name=firstname, last_name=lastname, email=email, username=username, password=password)
    user = auth.authenticate(username=username, password=password)
    auth.login(request, user)
    return render_to_response('loggedin.html', {'username': username})


def milestone_view(request):
    c = {}
    c.update(csrf(request))
    milestone_list = Milestone.objects.raw('SELECT * FROM "MINERVA_milestone"')
    c.update({'milestone_list': milestone_list})
    print(c)
    if request.user.is_authenticated():
        return render_to_response('physical-milestones.html', c)
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def milestones_auth(request):
    checklist = request.POST.getlist('checklist')
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    if request.user.is_authenticated():
        for id in checklist:
            m = Milestone.objects.get(id=id)
            UserChecklist.objects.create(uid_milestone=m, uid_user=request.user, timestamp=date)
        return render_to_response('loggedin.html', {'username': request.user.username})
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def physical_input(request):
    # Get all data from FORM POST.

    # Save in database

    #
    return render_to_response('PhysicalDataInput.html')

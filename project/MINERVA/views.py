from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect
from django.contrib import auth
from django.template.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from .models import Milestone


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
        return HttpResponseRedirect('/redirect')


def loggedin(request):
    return render_to_response('loggedin.html', request.user.username)


def redirect(request):
    return render_to_response('redirect.html')


@csrf_exempt
def register(request):
    firstname = request.POST.get('firstname', '')
    lastname = request.POST.get('lastname', '')
    username = request.POST.get('username_reg', '')
    email = request.POST.get('email', '')
    password = request.POST.get('password_reg', '')
    password2 = request.POST.get('password2_reg', '')

    checker = [firstname, lastname, username, email, password, password2]

    if None in checker or password != password2:
        return render_to_response('redirect.html')

    User.objects.create_user(first_name=firstname, last_name=lastname, email=email, username=username, password=password)
    return render_to_response('loggedin.html')


def milestone_view(request):
    milestone_list = Milestone.objects.raw('SELECT * FROM "MINERVA_milestone"')
    age_range = ["0-3 Months"]
    return render_to_response('physical-milestones.html', {'milestone_list': milestone_list, 'age_range': age_range})
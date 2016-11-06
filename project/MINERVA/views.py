from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect
from django.contrib import auth
from django.template.context_processors import csrf
from django.contrib.auth.models import User
# from django.core.mail import send_mail, BadHeaderError
from .models import GrossMotorMilestone, GrossMotorChecklist, ChildData, WeightAndHeightData, TeethData, HeadData,\
    PersonalSocialChecklist, PersonalSocialMilestone
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
        return HttpResponseRedirect('/homepage')
    else:
        return render_to_response('redirect.html', {'tag': 'login'})


def homepage(request):
    if request.user.is_authenticated():
        return render_to_response('homepage.html', {'username': request.user.username})
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def redirect():
    return render_to_response('redirect.html')


def logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/login')


def register(request):
    first_name = request.POST.get('firstname', '')
    last_name = request.POST.get('lastname', '')
    username = request.POST.get('username_reg', '')
    email = request.POST.get('email', '')
    password = request.POST.get('password_reg', '')
    password2 = request.POST.get('password2_reg', '')

    '''
    try:
        send_mail("Welcome to MINERVA!",
                  "You are registered to MINERVA, your personal child development tracker service. "
                  "PLEASE DO NOT REPLY THIS E-MAIL", 'admin@minerva.com', [email])
    except BadHeaderError:
        # Wrong e-mail
        return render_to_response('redirect.html')
    '''

    checker = [first_name, last_name, username, email, password, password2]

    if '' in checker or password != password2:
        return render_to_response('redirect.html', {'tag': 'register'})

    User.objects.create_user(first_name=first_name, last_name=last_name, email=email, username=username, password=password)
    user = auth.authenticate(username=username, password=password)
    auth.login(request, user)
    print(user)
    return HttpResponseRedirect('/physical-input')


def gm_milestone_view(request):
    c = {}
    c.update(csrf(request))
    user_id = request.user
    milestone_list = GrossMotorMilestone.objects.raw('SELECT * FROM "MINERVA_grossmotormilestone"')
    mc = GrossMotorChecklist.objects.all()
    milestone_checklist = []
    for m in mc:
        if m.uid_user == user_id:
            milestone_checklist.append(str(m.uid_gm_milestone))

    c.update({'milestone_list': milestone_list, 'milestone_checklist': milestone_checklist})

    if request.user.is_authenticated():
        return render_to_response('physical-milestones.html', c)
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def gm_milestone_auth(request):
    checklist = request.POST.getlist('checklist')
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    if request.user.is_authenticated():
        for id in checklist:
            m = GrossMotorMilestone.objects.get(id=id)
            GrossMotorChecklist.objects.create(uid_gm_milestone=m, uid_user=request.user, timestamp=date)
        return HttpResponseRedirect('/milestones/personal-social')
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def ps_milestone_view(request):
    c = {}
    c.update(csrf(request))
    milestone_list = PersonalSocialMilestone.objects.raw('SELECT * FROM "MINERVA_personalsocialmilestone"')
    c.update({'milestone_list': milestone_list})
    if request.user.is_authenticated():
        return render_to_response('personal-social-milestones.html', c)
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def ps_milestone_auth(request):
    checklist = request.POST.getlist('checklist')
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    if request.user.is_authenticated():
        for id in checklist:
            m = PersonalSocialMilestone.objects.get(id=id)
            PersonalSocialChecklist.objects.create(uid_ps_milestone=m, uid_user=request.user, timestamp=date)
        return HttpResponseRedirect('/homepage')
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def physical_input_view(request):
    c = {}
    c.update(csrf(request))
    if request.user.is_authenticated():
        return render_to_response('physical-data-input.html', c)
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def physical_input_auth(request):
    if request.user.is_authenticated():
        fullname = request.POST.get('fullname')
        nickname = request.POST.get('nickname')
        gender = request.POST.get('gender')
        birthday = request.POST.get('birthday')
        # Method to get more historical input
        weight = height = date_w_and_h = teeth = date_teeth = head = date_head = []
        counter = 1

        weight_data = request.POST.get('inputWeight{}'.format(counter))
        height_data = request.POST.get('inputHeight{}'.format(counter))
        date_w_and_h_data = request.POST.get('inputWeightHeightDate{}'.format(counter))

        while weight_data != '':
            weight.append(weight_data)
            height.append(height_data)
            date_w_and_h.append(date_w_and_h_data)

            counter += 1

            weight_data = request.POST.get('inputWeight{}'.format(counter))
            height_data = request.POST.get('inputHeight{}'.format(counter))
            date_w_and_h_data = request.POST.get('inputWeightHeightDate{}'.format(counter))

        counter = 1

        teeth_data = request.POST.get('inputTeeth{}'. format(counter))
        date_teeth_data = request.POST.get('inputTeethDate{}'.format(counter))
        while teeth_data != '':
            teeth.append(teeth_data)
            date_teeth.append(date_teeth_data)

            counter += 1

            teeth_data = request.POST.get('inputTeeth{}'.format(counter))
            date_teeth_data = request.POST.get('inputTeethDate{}'.format(counter))

        counter = 1

        head_data = request.POST.get('inputHead{}'.format(counter))
        date_head_data = request.POST.get('inputHeadDate{}'.format(counter))

        while head_data != '':
            head.append(head_data)
            date_head.append(date_head_data)

            counter += 1

            head_data = request.POST.get('inputHead{}'.format(counter))
            date_head_data = request.POST.get('inputHeadDate{}'.format(counter))
        #################################################################################

        checker = [fullname, nickname, gender, birthday, weight, height, date_w_and_h, teeth, date_teeth, head,
                   date_head]
        
        if None or '' in checker:
            return render_to_response('redirect.html', {'tag': 'incomplete'})
        else:
            # Create multiple instances based on data
            child = ChildData.objects.create(uid_user=request.user, fullname=fullname, nickname=nickname, gender=gender,
                                             birthday=birthday)
            for i in range(len(weight)):
                WeightAndHeightData.objects.create(uid_child=child, weight=weight[i], height=height[i],
                                                   date_w_and_h=date_w_and_h[i])
            for i in range(len(teeth)):
                TeethData.objects.create(uid_child=child, teeth=teeth[i], date_teeth=date_teeth[i])
            for i in range(len(head)):
                HeadData.objects.create(uid_child=child, head_size=head[i], date_head=date_head[i])

            return HttpResponseRedirect('/milestones/physical')
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})

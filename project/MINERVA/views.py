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
        return HttpResponseRedirect('/')
    else:
        return render_to_response('redirect.html', {'tag': 'login'})


def homepage(request):
    if request.user.is_authenticated():
        return render_to_response('homepage.html', {'username': request.user.username})
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def redirect(request):
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
    c = ChildData.objects.get(uid_user=request.user)

    gross_motor_done = list(GrossMotorChecklist.objects.all().filter(uid_user=request.user.id))
    gm_done_id = [str(x.uid_gm_milestone) for x in gross_motor_done]

    if request.user.is_authenticated():
        for id in checklist:
            m = GrossMotorMilestone.objects.get(id=id)
            if str(m.gm_milestone) not in gm_done_id:
                GrossMotorChecklist.objects.create(uid_gm_milestone=m, uid_user=request.user, uid_child=c, timestamp=date)

        return HttpResponseRedirect('/milestones/personal-social')
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def index(request):
    c = {}
    # CSRF
    c.update(csrf(request))

    if not request.user.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    # Child info
    try:
        child = ChildData.objects.get(uid_user=request.user)
    except ChildData.DoesNotExist:
        return render_to_response('redirect.html', {'tag': 'no_child'})

    w_h_data = WeightAndHeightData.objects.get(uid_child=child)
    weight = int(w_h_data.weight)
    height = int(w_h_data.height)
    date = datetime.date.today()
    age = str((date - child.birthday)/30)[:3]

    # Checklist info
    personal_social_done = list(PersonalSocialChecklist.objects.all().filter(uid_user=request.user.id))
    personal_social_not_done = list(PersonalSocialMilestone.objects.all())

    str_personal_list = [str(x.uid_ps_milestone) for x in personal_social_done]
    temp = []

    for m in personal_social_not_done:
        if m.ps_milestone in str_personal_list:
            temp.append(m)
    for t in temp:
        personal_social_not_done.remove(t)
    personal_social_not_done = personal_social_not_done[0:3]

    c.update({'child': child, 'age': age, 'weight': weight, 'height': height,
              'personal_social_not_done': personal_social_not_done})
    return render_to_response('index.html', c)


def ps_milestone_view(request):
    c = {}
    c.update(csrf(request))
    user_id = request.user

    milestone_list = PersonalSocialMilestone.objects.raw('SELECT * FROM "MINERVA_personalsocialmilestone"')
    mc = PersonalSocialChecklist.objects.all()
    milestone_checklist = []
    for m in mc:
        if m.uid_user == user_id:
            milestone_checklist.append(str(m.uid_ps_milestone))

    c.update({'milestone_list': milestone_list, 'milestone_checklist': milestone_checklist})

    if request.user.is_authenticated():
        return render_to_response('personal-social-milestones.html', c)
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def ps_milestone_auth(request):
    checklist = request.POST.getlist('checklist')
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    c = ChildData.objects.get(uid_user=request.user)

    personal_social_done = list(PersonalSocialChecklist.objects.all().filter(uid_user=request.user.id))
    ps_done_id = [str(x.uid_ps_milestone) for x in personal_social_done]

    if request.user.is_authenticated():
        for id in checklist:
            m = PersonalSocialMilestone.objects.get(id=id)
            if str(m.ps_milestone) not in ps_done_id:
                PersonalSocialChecklist.objects.create(uid_ps_milestone=m, uid_user=request.user, uid_child=c, timestamp=date)
        return HttpResponseRedirect('/')
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def physical_input_view(request):
    c = {}
    c.update(csrf(request))
    user_id = request.user.id
    if not request.user.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    try:
        child_data = ChildData.objects.get(uid_user=user_id)
        birthday = str(child_data.birthday)
        head_data = HeadData.objects.get(uid_child=child_data)
        teeth_data = TeethData.objects.get(uid_child=child_data)
        weight_height_data = WeightAndHeightData.objects.get(uid_child=child_data)

        c.update({'child_data': child_data, 'birthday': birthday, 'head_data': head_data, 'teeth_data': teeth_data,
                  'weight_height_data': weight_height_data})
    except:
        pass

    if request.user.is_authenticated():
        return render_to_response('physical-data-input.html', c)
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def reset_password(request):
    return render_to_response('forget-password.html')


def physical_input_auth(request):
    if request.user.is_authenticated():
        fullname = request.POST.get('fullname')
        nickname = request.POST.get('nickname')
        gender = request.POST.get('gender')
        birthday = request.POST.get('birthday')
        weight = request.POST.get('weight')
        height = request.POST.get('height')
        date_w_and_h = request.POST.get('date_w_and_h')
        teeth = request.POST.get('teeth')
        date_teeth = request.POST.get('date_teeth')
        head = request.POST.get('head')
        date_head = request.POST.get('date_head')

        '''while weight_data != '':
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
            date_head_data = request.POST.get('inputHeadDate{}'.format(counter))'''

        checker = [fullname, nickname, gender, birthday, weight, height, date_w_and_h, teeth, date_teeth, head,
                   date_head]
        
        if None or '' in checker:
            return render_to_response('redirect.html', {'tag': 'incomplete'})
        else:
            # Create multiple instances based on data
            child = ChildData.objects.create(uid_user=request.user, fullname=fullname, nickname=nickname, gender=gender,
                                             birthday=birthday)
            WeightAndHeightData.objects.create(uid_child=child, weight=weight, height=height,
                                               date_w_and_h=date_w_and_h)
            TeethData.objects.create(uid_child=child, teeth=teeth, date_teeth=date_teeth)
            HeadData.objects.create(uid_child=child, head_size=head, date_head=date_head)

            return HttpResponseRedirect('/milestones/physical')
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})

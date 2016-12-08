from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect
from django.contrib import auth
from django.template.context_processors import csrf
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.conf import settings
from .models import GrossMotorMilestone, GrossMotorChecklist, ChildData, WeightAndHeightData, TeethData, HeadData,\
    PersonalSocialChecklist, PersonalSocialMilestone
import datetime
import re
from json import dumps


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


def gm_milestone_view_update(request):
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
        return render_to_response('physical-milestones-update.html', c)
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


def gm_milestone_auth_update(request):
    checklist = request.POST.getlist('checklist')
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    c = ChildData.objects.get(uid_user=request.user)

    gross_motor_done = list(GrossMotorChecklist.objects.all().filter(uid_user=request.user.id))
    gm_done_id = [str(x.uid_gm_milestone) for x in gross_motor_done]

    if request.user.is_authenticated():
        for id in checklist:
            m = GrossMotorMilestone.objects.get(id=id)
            if str(m.gm_milestone) not in gm_done_id:
                GrossMotorChecklist.objects.create(uid_gm_milestone=m, uid_user=request.user, uid_child=c,
                                                   timestamp=date)

        return HttpResponseRedirect('/')
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

    # Child info
    w_h_data = WeightAndHeightData.objects.filter(uid_child=child).order_by('-date_w_and_h')[0]
    weight = int(w_h_data.weight)
    height = int(w_h_data.height)
    date = datetime.date.today()
    age = re.match(r'([0-9])\w+', str((date - child.birthday)/30))

    if age is None:
        age = re.match(r'([0-9])', str((date - child.birthday)/30)).group()
    else:
        age = age.group()

    # Weight and height list for graph
    # Done
    w_h_list_query = WeightAndHeightData.objects.filter(uid_child=child,
                                                        date_w_and_h__lte=date,
                                                        date_w_and_h__gte=date - datetime.timedelta(6*365/12)).order_by('date_w_and_h')
    w_h_date_list = []
    w_list = []
    h_list = []
    for datapoint in w_h_list_query:
        w_h_date_list.append(datapoint.date_w_and_h.isoformat())
        w_list.append(int(datapoint.weight))
        h_list.append(int(datapoint.height))
    c.update({'w_h_data': w_h_data, 'w_h_date_list': w_h_date_list, 'w_list': w_list, 'h_list': h_list})

    # Checklist info (cognitive)
    personal_social_done = list(PersonalSocialChecklist.objects.all().filter(uid_user=request.user.id))
    personal_social_in_progress = list(PersonalSocialMilestone.objects.all().filter(seven_five__lte=float(age),
                                                                                    finish__lte=float(age)))
    personal_social_not_done = list(PersonalSocialMilestone.objects.all())

    c.update({'personal_social_not_done_len': len(personal_social_not_done),
              'personal_social_in_progress_len': len(personal_social_in_progress),
              'personal_social_done_len': len(personal_social_done),
              'percentage_personal_social': (len(personal_social_done)//len(personal_social_not_done))*100})

    str_personal_list = [str(x.uid_ps_milestone) for x in personal_social_done]
    temp = []

    for m in personal_social_not_done:
        if m.ps_milestone in str_personal_list:
            temp.append(m)
    for t in temp:
        personal_social_not_done.remove(t)
    personal_social_not_done = personal_social_not_done[0:3]

    # Checklist info (physical)
    physical_done = list(GrossMotorChecklist.objects.all().filter(uid_user=request.user.id))
    physical_in_progress = list(GrossMotorMilestone.objects.all().filter(seven_five__lte=float(age),
                                                                         finish__lte=float(age)))
    physical_not_done = list(GrossMotorMilestone.objects.all())

    c.update({'physical_not_done_len': len(physical_not_done), 'physical_in_progress_len': len(physical_in_progress),
              'physical_done_len': len(physical_done), 'percentage_physical': (len(physical_done)//len(physical_not_done))*100})

    str_physical_list = [str(x.uid_gm_milestone) for x in physical_done]
    temp = []

    for m in physical_not_done:
        if m.gm_milestone in str_physical_list:
            temp.append(m)
    for t in temp:
        physical_not_done.remove(t)
    physical_not_done = physical_not_done[0:3]

    c.update({'child': child, 'age': age, 'weight': weight, 'height': height,
              'personal_social_not_done': personal_social_not_done, 'personal_social_done': personal_social_done,
              'physical_not_done': physical_not_done, 'physical_done': physical_done})
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
        return HttpResponseRedirect('/register-finish')
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
        weight_height_data = list(WeightAndHeightData.objects.all().filter(uid_child=child_data))
        teeth_data = list(TeethData.objects.all().filter(uid_child=child_data))
        head_data = list(HeadData.objects.all().filter(uid_child=child_data))
        c.update({'child_data': child_data, 'birthday': birthday, 'weight_height_data': weight_height_data,
                  'teeth_data': teeth_data, 'head_data': head_data})

    except:
        pass
        print("lewat except")

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

        weight_list = []
        height_list = []
        date_wh_list = []
        teeth_list = []
        date_teeth_list = []
        head_list = []
        date_head_list = []

        counter = 1
        while None not in weight_list:
            weight_list.append(request.POST.get('inputWeight{}'.format(counter)))
            height_list.append(request.POST.get('inputHeight{}'.format(counter)))
            date_wh_list.append(request.POST.get('inputWeightHeightDate{}'.format(counter)))
            counter += 1

        counter = 1
        while None not in teeth_list:
            teeth_list.append(request.POST.get('inputTeeth{}'.format(counter)))
            date_teeth_list.append(request.POST.get('inputTeethDate{}'.format(counter)))
            counter += 1

        counter = 1
        while None not in head_list:
            head_list.append(request.POST.get('inputHead{}'.format(counter)))
            date_head_list.append(request.POST.get('inputHeadDate{}'.format(counter)))
            counter += 1

        checker = [fullname, nickname, gender, birthday, weight_list, height_list, date_wh_list, teeth_list,
                   date_teeth_list, head_list, date_head_list]
        print(checker)
        
        if None or '' or [None] in checker:
            return render_to_response('redirect.html', {'tag': 'incomplete'})
        else:
            # Check existing objects
            try:
                child = ChildData.objects.get(uid_user=request.user.id)
                child.fullname = fullname
                child.nickname = nickname
                child.gender = gender
                child.birthday = birthday

            except:
                # Create multiple instances based on data
                child = ChildData.objects.create(uid_user=request.user, fullname=fullname, nickname=nickname,
                                                 gender=gender, birthday=birthday)
            for i in range(len(weight_list[:-1])):
                WeightAndHeightData.objects.create(uid_child=child, weight=weight_list[i], height=height_list[i],
                                                   date_w_and_h=date_wh_list[i])
            for i in range(len(teeth_list[:-1])):
                TeethData.objects.create(uid_child=child, teeth=teeth_list[i], date_teeth=date_teeth_list[i])
            for i in range(len(head_list[:-1])):
                HeadData.objects.create(uid_child=child, head_size=head_list[i], date_head=date_teeth_list[i])

            return HttpResponseRedirect('/milestones/physical')
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def milestone_details_view(request):
    return render_to_response('milestone-details.html')


def register_finish(request):
    return render_to_response('register-finish-fix.html')


def send_email(request):
    send_mail('MINERVA Email Test', 'Does it work?', settings.EMAIL_HOST_USER, ['kitto.adinatha@gmail.com'],
              fail_silently=False,)
    return HttpResponseRedirect('/')


def homepage_pass_check(request):
    password = request.POST.get('inputPasswordCheck')
    user_id = request.user.id
    print(user_id, password)
    user_db = User.objects.get(id=request.user.id, password=password)
    print(user_db)
    if str(request.user.id, password) == str(user_db.id, user_db.password):
        return HttpResponseRedirect('/physical-input')


def growth_detail(request):
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
    age = re.match(r'([0-9])\w+', str((date - child.birthday) / 30)).group()

    # Checklist info (cognitive)
    personal_social_done = list(PersonalSocialChecklist.objects.all().filter(uid_user=request.user.id))
    personal_social_in_progress = list(PersonalSocialMilestone.objects.all().filter(seven_five__lte=float(age),
                                                                                    finish__lte=float(age)))
    personal_social_not_done = list(PersonalSocialMilestone.objects.all())

    c.update({'personal_social_not_done_len': len(personal_social_not_done),
              'personal_social_in_progress_len': len(personal_social_in_progress),
              'personal_social_done_len': len(personal_social_done)})

    str_personal_list = [str(x.uid_ps_milestone) for x in personal_social_done]
    temp = []

    for m in personal_social_not_done:
        if m.ps_milestone in str_personal_list:
            temp.append(m)
    for t in temp:
        personal_social_not_done.remove(t)
    personal_social_not_done = personal_social_not_done[0:3]

    # Checklist info (physical)
    physical_done = list(GrossMotorChecklist.objects.all().filter(uid_user=request.user.id))
    physical_in_progress = list(GrossMotorMilestone.objects.all().filter(seven_five__lte=float(age),
                                                                         finish__lte=float(age)))
    physical_not_done = list(GrossMotorMilestone.objects.all())

    c.update({'physical_not_done_len': len(physical_not_done), 'physical_in_progress_len': len(physical_in_progress),
              'physical_done_len': len(physical_done)})

    str_physical_list = [str(x.uid_gm_milestone) for x in physical_done]
    temp = []

    for m in physical_not_done:
        if m.gm_milestone in str_physical_list:
            temp.append(m)
    for t in temp:
        physical_not_done.remove(t)
    physical_not_done = physical_not_done[0:3]

    c.update({'child': child, 'age': age, 'weight': weight, 'height': height,
              'personal_social_not_done': personal_social_not_done, 'personal_social_done': personal_social_done,
              'physical_not_done': physical_not_done, 'physical_done': physical_done})
    return render_to_response('growth-detail.html', c)
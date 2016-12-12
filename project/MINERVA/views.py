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

    checker = [first_name, last_name, username, email, password, password2]

    if '' in checker or password != password2:
        return render_to_response('redirect.html', {'tag': 'register'})

    send_mail("Welcome to MINERVA!",
              "You are registered to MINERVA, your personal child development tracker service. \n"
              "PLEASE DO NOT REPLY THIS E-MAIL", settings.EMAIL_HOST_USER, [email])
    try:
        User.objects.create_user(first_name=first_name, last_name=last_name, email=email, username=username, password=password)
        user = auth.authenticate(username=username, password=password)
        auth.login(request, user)
        return HttpResponseRedirect('/physical-input')

    except:
        return render_to_response('redirect.html', {'tag': 'user-exists'})


def gm_milestone_view(request):
    c = {}
    c.update(csrf(request))
    user_id = request.user
    if not user_id.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    milestone_list = GrossMotorMilestone.objects.raw('SELECT * FROM "MINERVA_grossmotormilestone"')
    mc = GrossMotorChecklist.objects.all()
    milestone_checklist = []
    for m in mc:
        if m.uid_user == user_id:
            milestone_checklist.append(str(m.uid_gm_milestone))

    c.update({'milestone_list': milestone_list, 'milestone_checklist': milestone_checklist})

    return render_to_response('physical-milestones.html', c)


def gm_milestone_view_update(request):
    c = {}
    c.update(csrf(request))
    user_id = request.user

    if not user_id.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    try:
        child = ChildData.objects.get(uid_user=request.user)
    except ChildData.DoesNotExist:
        return render_to_response('redirect.html', {'tag': 'no_child'})

    milestone_list = GrossMotorMilestone.objects.raw('SELECT * FROM "MINERVA_grossmotormilestone"')
    mc = GrossMotorChecklist.objects.all()
    milestone_checklist = []
    for m in mc:
        if m.uid_user == user_id:
            milestone_checklist.append(str(m.uid_gm_milestone))

    date = datetime.date.today()
    age = re.match(r'([0-9])\w+', str((date - child.birthday) / 30))

    if age is None:
        age = re.match(r'([0-9])', str((date - child.birthday) / 30)).group()
    else:
        age = age.group()

    c.update({'milestone_list': milestone_list, 'milestone_checklist': milestone_checklist, 'child': child})

    return render_to_response('physical-milestones-update.html', c)


def gm_milestone_auth(request):
    if not request.user.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    checklist = request.POST.getlist('checklist')
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    c = ChildData.objects.get(uid_user=request.user)

    gross_motor_done = list(GrossMotorChecklist.objects.all().filter(uid_user=request.user.id))
    gm_done_id = [str(x.uid_gm_milestone) for x in gross_motor_done]

    for id in checklist:
        m = GrossMotorMilestone.objects.get(id=id)
        if str(m.gm_milestone) not in gm_done_id:
            GrossMotorChecklist.objects.create(uid_gm_milestone=m, uid_user=request.user, uid_child=c, timestamp=date)

    return HttpResponseRedirect('/milestones/personal-social')


def gm_milestone_auth_update(request):
    if not request.user.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    checklist = request.POST.getlist('checklist')
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    c = ChildData.objects.get(uid_user=request.user)

    gross_motor_done = list(GrossMotorChecklist.objects.all().filter(uid_user=request.user.id))

    for m in gross_motor_done:
        m.delete()

    for id in checklist:
        m = GrossMotorMilestone.objects.get(id=id)
        GrossMotorChecklist.objects.create(uid_gm_milestone=m, uid_user=request.user, uid_child=c,timestamp=date)

    return HttpResponseRedirect('/milestones/physical-update')


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
              'percentage_personal_social': int((len(personal_social_done)/len(personal_social_not_done))*100)})

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
              'physical_done_len': len(physical_done), 'percentage_physical': int((len(physical_done)/len(physical_not_done))*100)})

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

    if not user_id.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    milestone_list = PersonalSocialMilestone.objects.raw('SELECT * FROM "MINERVA_personalsocialmilestone"')
    mc = PersonalSocialChecklist.objects.all()
    milestone_checklist = []
    for m in mc:
        if m.uid_user == user_id:
            milestone_checklist.append(str(m.uid_ps_milestone))

    c.update({'milestone_list': milestone_list, 'milestone_checklist': milestone_checklist})

    return render_to_response('personal-social-milestones.html', c)


def ps_milestone_view_update(request):
    c = {}
    c.update(csrf(request))
    user_id = request.user

    if not user_id.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})
    try:
        child = ChildData.objects.get(uid_user=request.user)
    except ChildData.DoesNotExist:
        return render_to_response('redirect.html', {'tag': 'no_child'})

    milestone_list = PersonalSocialMilestone.objects.raw('SELECT * FROM "MINERVA_personalsocialmilestone"')
    mc = PersonalSocialChecklist.objects.all()
    milestone_checklist = []
    for m in mc:
        if m.uid_user == user_id:
            milestone_checklist.append(str(m.uid_ps_milestone))

    date = datetime.date.today()
    age = re.match(r'([0-9])\w+', str((date - child.birthday) / 30))

    if age is None:
        age = re.match(r'([0-9])', str((date - child.birthday) / 30)).group()
    else:
        age = age.group()

    c.update({'milestone_list': milestone_list, 'milestone_checklist': milestone_checklist, 'age': float(age),
              'child': child})

    return render_to_response('personal-social-milestones-update.html', c)


def ps_milestone_auth(request):
    if not request.user.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    checklist = request.POST.getlist('checklist')
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    c = ChildData.objects.get(uid_user=request.user)
    print(checklist)

    personal_social_done = list(PersonalSocialChecklist.objects.all().filter(uid_user=request.user.id))
    ps_done_id = [str(x.uid_ps_milestone) for x in personal_social_done]

    for id in checklist:
        m = PersonalSocialMilestone.objects.get(id=id)
        if str(m.ps_milestone) not in ps_done_id:
            PersonalSocialChecklist.objects.create(uid_ps_milestone=m, uid_user=request.user, uid_child=c, timestamp=date)
    return HttpResponseRedirect('/register-finish')


def ps_milestone_auth_update(request):
    if not request.user.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    checklist = request.POST.getlist('checklist')
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    c = ChildData.objects.get(uid_user=request.user)

    personal_social_done = list(PersonalSocialChecklist.objects.all().filter(uid_user=request.user.id))

    for m in personal_social_done:
        m.delete()

    for id in checklist:
        m = PersonalSocialMilestone.objects.get(id=id)
        PersonalSocialChecklist.objects.create(uid_ps_milestone=m, uid_user=request.user, uid_child=c, timestamp=date)
    return HttpResponseRedirect('/milestones/personal-social-update')


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

        for l in range(len(weight_height_data)):
            weight_height_data[l].date_w_and_h = weight_height_data[l].date_w_and_h.isoformat()

        teeth_data = list(TeethData.objects.all().filter(uid_child=child_data))
        for l in range(len(teeth_data)):
            teeth_data[l].date_teeth = teeth_data[l].date_teeth.isoformat()

        head_data = list(HeadData.objects.all().filter(uid_child=child_data))
        for l in range(len(head_data)):
            head_data[l].date_head = head_data[l].date_head.isoformat()

        c.update({'child_data': child_data, 'birthday': birthday, 'weight_height_data': weight_height_data,
                  'teeth_data': teeth_data, 'head_data': head_data})

    except:
        pass
        print("lewat except")

    return render_to_response('physical-data-input.html', c)


def physical_input_view_update(request):
    c = {}
    c.update(csrf(request))
    user_id = request.user.id

    if not request.user.is_authenticated():
        return render_to_response('redirect.html', {'tag': 'logout'})

    try:
        child_data = ChildData.objects.get(uid_user=user_id)
        birthday = str(child_data.birthday)

        weight_height_data = list(WeightAndHeightData.objects.all().filter(uid_child=child_data))

        for l in range(len(weight_height_data)):
            weight_height_data[l].date_w_and_h = weight_height_data[l].date_w_and_h.isoformat()

        teeth_data = list(TeethData.objects.all().filter(uid_child=child_data))
        for l in range(len(teeth_data)):
            teeth_data[l].date_teeth = teeth_data[l].date_teeth.isoformat()

        head_data = list(HeadData.objects.all().filter(uid_child=child_data))
        for l in range(len(head_data)):
            head_data[l].date_head = head_data[l].date_head.isoformat()

        c.update({'child_data': child_data, 'birthday': birthday, 'weight_height_data': weight_height_data,
                  'teeth_data': teeth_data, 'head_data': head_data})

    except:
        pass
        print("lewat except")

    return render_to_response('physical-data-input-update.html', c)


def physical_input_auth(request):
    if request.user.is_authenticated():
        fullname = request.POST.get('fullname')
        nickname = request.POST.get('nickname')
        gender = request.POST.get('gender')
        birthday = request.POST.get('birthday')

        weight_list = request.POST.getlist('inputWeight')
        height_list = request.POST.getlist('inputHeight')
        date_wh_list = request.POST.getlist('inputWeightHeightDate')

        teeth_list = request.POST.getlist('inputTeeth')
        date_teeth_list = request.POST.getlist('inputTeethDate')

        head_list = request.POST.getlist('inputHead')
        date_head_list = request.POST.getlist('inputHeadDate')

        checker = [fullname, nickname, gender, birthday, weight_list, height_list, date_wh_list, teeth_list,
                   date_teeth_list, head_list, date_head_list]

        if None or '' or [] in checker:
            return render_to_response('redirect.html', {'tag': 'incomplete'})
        else:
            # Check existing objects
            try:
                child = ChildData.objects.get(uid_user=request.user.id)
                child.fullname = fullname
                child.nickname = nickname
                child.gender = gender
                child.birthday = birthday

                old_wh = WeightAndHeightData.objects.all().filter(uid_child=child)
                old_teeth = TeethData.objects.all().filter(uid_child=child)
                old_head = HeadData.objects.all().filter(uid_child=child)

                # delete old data to be replaced by updated one
                for o in old_wh:
                    o.delete()

                for o in old_teeth:
                    o.delete()

                for o in old_head:
                    o.delete()

            except:
                print("lewat except")
                child = ChildData.objects.create(uid_user=request.user, fullname=fullname, nickname=nickname,
                                                 gender=gender, birthday=birthday)

            # Create multiple instances based on data
            for i in range(len(weight_list)):
                WeightAndHeightData.objects.create(uid_child=child, weight=weight_list[i], height=height_list[i],
                                                   date_w_and_h=date_wh_list[i])
            for i in range(len(teeth_list)):
                TeethData.objects.create(uid_child=child, teeth=teeth_list[i], date_teeth=date_teeth_list[i])

            for i in range(len(head_list)):
                HeadData.objects.create(uid_child=child, head_size=head_list[i], date_head=date_teeth_list[i])

            return HttpResponseRedirect('/milestones/physical')
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def physical_input_auth_update(request):
    if request.user.is_authenticated():
        fullname = request.POST.get('fullname')
        nickname = request.POST.get('nickname')
        gender = request.POST.get('gender')
        birthday = request.POST.get('birthday')

        weight_list = request.POST.getlist('inputWeight')
        height_list = request.POST.getlist('inputHeight')
        date_wh_list = request.POST.getlist('inputWeightHeightDate')

        teeth_list = request.POST.getlist('inputTeeth')
        date_teeth_list = request.POST.getlist('inputTeethDate')

        head_list = request.POST.getlist('inputHead')
        date_head_list = request.POST.getlist('inputHeadDate')

        checker = [fullname, nickname, gender, birthday, weight_list, height_list, date_wh_list, teeth_list,
                   date_teeth_list, head_list, date_head_list]
        print(checker)

        if None or '' or [] in checker:
            return render_to_response('redirect.html', {'tag': 'incomplete-update'})
        else:
            # Check existing objects
            try:
                child = ChildData.objects.get(uid_user=request.user.id)
                child.fullname = fullname
                child.nickname = nickname
                child.gender = gender
                child.birthday = birthday

                old_wh = WeightAndHeightData.objects.all().filter(uid_child=child)
                old_teeth = TeethData.objects.all().filter(uid_child=child)
                old_head = HeadData.objects.all().filter(uid_child=child)

                # delete old data to be replaced by updated one
                for o in old_wh:
                    o.delete()

                for o in old_teeth:
                    o.delete()

                for o in old_head:
                    o.delete()

            except:
                print("lewat except")
                child = ChildData.objects.create(uid_user=request.user, fullname=fullname, nickname=nickname,
                                                 gender=gender, birthday=birthday)

            # Create multiple instances based on data
            for i in range(len(weight_list)):
                WeightAndHeightData.objects.create(uid_child=child, weight=weight_list[i], height=height_list[i],
                                                   date_w_and_h=date_wh_list[i])
            for i in range(len(teeth_list)):
                TeethData.objects.create(uid_child=child, teeth=teeth_list[i], date_teeth=date_teeth_list[i])

            for i in range(len(head_list)):
                HeadData.objects.create(uid_child=child, head_size=head_list[i], date_head=date_teeth_list[i])

            return HttpResponseRedirect('/physical-input-update')
    else:
        return render_to_response('redirect.html', {'tag': 'logout'})


def reset_password(request):
    return render_to_response('forget-password.html')


def milestone_details_view(request):
    return render_to_response('milestone-details.html')


def register_finish(request):
    return render_to_response('register-finish-fix.html')


def send_email(request):
    # Testing
    send_mail('MINERVA Email Test', 'Does it work?', settings.EMAIL_HOST_USER, ['kitto.adinatha@gmail.com'],
              fail_silently=False,)
    return HttpResponseRedirect('/')


def homepage_pass_check(request):
    # Testing
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

    date = datetime.date.today()

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

    c.update({'child': child, 'age': age, 'weight': weight, 'height': height})

    # Weight and height list for graph
    w_h_list_query = WeightAndHeightData.objects.filter(uid_child=child,
                                                        date_w_and_h__lte=date,
                                                        date_w_and_h__gte=date - datetime.timedelta(
                                                            6 * 365 / 12)).order_by('date_w_and_h')
    # Teeth data
    teeth_list_query = TeethData.objects.filter(uid_child=child, date_teeth__lte=date,
                                                date_teeth__gte=date - datetime.timedelta(6 * 365 / 12)).order_by('date_teeth')

    # Head circumference data
    head_list_query = HeadData.objects.filter(uid_child=child, date_head__lte=date,
                                              date_head__gte=date - datetime.timedelta(6 * 365 / 12)).order_by('date_head')
    w_h_date_list = []
    w_list = []
    h_list = []
    teeth_date_list = []
    teeth_list = []
    head_date_list = []
    head_list = []

    # Weight and height
    for datapoint in w_h_list_query:
        w_h_date_list.append(datapoint.date_w_and_h.isoformat())
        w_list.append(int(datapoint.weight))
        h_list.append(int(datapoint.height))
    c.update({'child': child, 'w_h_date_list': w_h_date_list, 'w_list': w_list, 'h_list': h_list})

    # Teeth
    for data in teeth_list_query:
        teeth_date_list.append(data.date_teeth.isoformat())
        teeth_list.append(int(data.teeth))
    c.update({'teeth_list': teeth_list, 'teeth_date_list': teeth_date_list})

    # Head
    for data in head_list_query:
        head_date_list.append(data.date_head.isoformat())
        head_list.append(int(data.head_size))
    c.update({'head_list': head_list, 'head_date_list': head_date_list})
    return render_to_response('growth-detail.html', c)


def milestone_detail(request):
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
    age = re.match(r'([0-9])\w+', str((date - child.birthday) / 30))

    if age is None:
        age = re.match(r'([0-9])', str((date - child.birthday) / 30)).group()
    else:
        age = age.group()

    # Weight and height list for graph
    # Done
    w_h_list_query = WeightAndHeightData.objects.filter(uid_child=child,
                                                        date_w_and_h__lte=date,
                                                        date_w_and_h__gte=date - datetime.timedelta(
                                                            6 * 365 / 12)).order_by('date_w_and_h')
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
              'percentage_personal_social': int((len(personal_social_done) / len(personal_social_not_done)) * 100)})

    str_personal_list = [str(x.uid_ps_milestone) for x in personal_social_done]
    temp = []

    for m in personal_social_not_done:
        if m.ps_milestone in str_personal_list:
            temp.append(m)
    for t in temp:
        personal_social_not_done.remove(t)

    temp = []
    for x in personal_social_in_progress:
        if x.ps_milestone in str_personal_list:
            temp.append(x)
    for t in temp:
        personal_social_in_progress.remove(t)

    # Checklist info (physical)
    physical_done = list(GrossMotorChecklist.objects.all().filter(uid_user=request.user.id))
    physical_in_progress = list(GrossMotorMilestone.objects.all().filter(seven_five__lte=float(age),
                                                                         finish__lte=float(age)))
    physical_not_done = list(GrossMotorMilestone.objects.all())

    physical_late = list(GrossMotorMilestone.objects.all().filter(finish__lte=float(age)))

    c.update({'physical_not_done_len': len(physical_not_done), 'physical_in_progress_len': len(physical_in_progress),
              'physical_done_len': len(physical_done),
              'percentage_physical': int((len(physical_done) / len(physical_not_done)) * 100)})

    str_physical_list = [str(x.uid_gm_milestone) for x in physical_done]
    temp = []

    for m in physical_not_done:
        if m.gm_milestone in str_physical_list:
            temp.append(m)
    for t in temp:
        physical_not_done.remove(t)

    temp = []
    for x in physical_late:
        if x.gm_milestone in str_physical_list:
            temp.append(x)
    for t in temp:
        physical_late.remove(t)

    temp = []
    for x in physical_in_progress:
        if x.gm_milestone in str_physical_list:
            temp.append(x)
    for t in temp:
        physical_in_progress.remove(t)

    c.update({'child': child, 'age': age, 'weight': weight, 'height': height,
              'personal_social_not_done': personal_social_not_done, 'personal_social_done': personal_social_done,
              'physical_not_done': physical_not_done, 'physical_done': physical_done, 'physical_late': physical_late,
              'physical_in_progress': physical_in_progress, 'personal_social_in_progress': personal_social_in_progress,
              'physical_late_len': len(physical_late)})
    return render_to_response('milestone-details.html', c)

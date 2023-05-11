from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.contrib.auth.forms import UserCreationForm

from cls.models import History


from .forms import SearchForm, SignInForm, SignUpForm

from cls.jokeAPI import *
from cls.searchAPI import *



def index(request):
    #get_short_joke() need subscribe api
    joke = get_json_joke()
    data = {'joke': joke}
    
    person_status = False
    if person_status:
        data['history'] = History.objects.all()
    
    return render(request, 'cls/index.html', context=data)


def search(request):
    data = {}
    if request.method == 'GET':
        form = SearchForm(request.GET)
        if form.is_valid():
            query = form.cleaned_data['query']
            result = get_search_results(query)
            data['result'] = result
            print("--------------")
            print(result)
            print("--------------")
            result1, result2, result3 = split_dict_equally(result)
            
            data['result1'] = result1
            data['result2'] = result2
            data['result3'] = result3
            for recipe in result['results']:
              print(get_product_info(recipe['id']))
             
             # recipe['title'] recipe['id'] recipe['image']
    #print(data['result'])
    return render(request, 'cls/search.html', context=data)


def profile(request):
    return HttpResponse("Profile")


def page_not_found(request, exception):
    return render(request, 'cls/error.html')


def product(request, id):
    data = {}
    info = get_product_info(id)
    data['result'] = info

    
    return render(request, 'cls/product.html', context=data)


def settings(request):
    return HttpResponse("Settings")


def about_us(request):
    return HttpResponse('About us')


def sign(request):
    sign_up_form = SignUpForm()
    sign_in_form = SignInForm()

    if request.method == 'POST':
        if 'sign_up' in request.POST:
            form = SignUpForm(request.POST)
            if form.is_valid():
                form.save()
                email = form.cleaned_data.get('email')
                raw_password = form.cleaned_data.get('password')
                user = authenticate(email=email, password=raw_password)
                login(request, user)
                return redirect('home')
        elif 'sign_in' in request.POST:
            form = SignInForm(data=request.POST)
            if form.is_valid():
                email = form.cleaned_data.get('email')
                raw_password = form.cleaned_data.get('password')
                user = authenticate(email=email, password=raw_password)
                if user is not None:
                    login(request, user)
                    return redirect('home')
    else:
        form = None

    context = {
        'sign_up_form': sign_up_form,
        'sign_in_form': sign_in_form,
        'form': form,
    }

    return render(request, 'cls/sign.html', context)




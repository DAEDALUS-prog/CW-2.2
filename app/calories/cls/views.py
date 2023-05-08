from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.urls import reverse

from cls.models import History


from .forms import SearchForm

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
            for recipe in result['results']:
              print(get_product_info(recipe['id']))
             
             # recipe['title'] recipe['id'] recipe['image']
    #print(data['result'])
    return render(request, 'cls/search.html', context=data)




def sign(request):
    return render(request, 'cls/sign.html')


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



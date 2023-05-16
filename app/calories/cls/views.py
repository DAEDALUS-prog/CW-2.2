from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.views import View

from .models import Person
from .forms import SearchForm, SignInForm, SignUpForm

from .jokeAPI import *
from .searchAPI import *


class IndexView(View):
    def get(self, request):
        joke = get_json_joke()
        data = {'joke': joke}

        person_status = False
        if person_status:
            History = None
            data['history'] = History.objects.all()

        return render(request, 'cls/index.html', context=data)


class SearchView(View):
    def get(self, request):
        data = {}
        form = SearchForm(request.GET)
        if form.is_valid():
            query = form.cleaned_data['query']
            result = get_search_results(query)
            data['result'] = result
            #save_products(result)
            result1, result2, result3 = split_dict_equally(result)
            data['result1'] = result1
            data['result2'] = result2
            data['result3'] = result3
            for recipe in result['results']:
                print(get_product_info(recipe['id']))
        return render(request, 'cls/search.html', context=data)


class ProfileView(View):
    def get(self, request):
        return render(request, 'cls/profile.html')


def page_not_found(request, exception):
    return render(request, 'cls/error.html')


class ProductView(View):
    def get(self, request, id):
        data = {}
        info = get_product_info(id)
        data['result'] = info
        return render(request, 'cls/product.html', context=data)


class SettingsView(View):
    def get(self, request):
        return render(request, 'cls/settings.html')


class AboutUsView(View):
    def get(self, request):
        return render(request, 'cls/about-us.html')


class SignView(View):
    def get(self, request):
        # Отображение страницы авторизации/регистрации
        print(1)
        return render(request, 'cls/sign.html')

    def post(self, request):
        print(2)
        if 'sign_up' in request.POST:
            # Обработка регистрации пользователя
            email = request.POST['email']
            name = request.POST['name']
            password = request.POST['password']

            # Проверка, существует ли пользователь с таким email
            if Person.objects.filter(email=email).exists():
                # Пользователь уже зарегистрирован
                return HttpResponse("USER EMAIL IS EXISTS")

            # Создание нового пользователя
            user = Person(email=email, name=name, password=password, status=1)
            user.save()

            # Вход в систему после успешной регистрации
            login(request, user)
            return redirect('home')

        elif 'sign_in' in request.POST:
            # Обработка аутентификации пользователя
            email = request.POST['email']
            password = request.POST['password']

            # Проверка правильности введенных данных
            user = authenticate(request, email=email, password=password)
            if user is not None:
                # Аутентификация успешна
                login(request, user)
                return redirect('home')
            else:
                # Неправильные данные пользователя
                return HttpResponse("USER 1")

        else:
            # Некорректный запрос
                return HttpResponse("USER 2")

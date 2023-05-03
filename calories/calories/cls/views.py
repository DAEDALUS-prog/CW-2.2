from django.http import HttpResponse
from django.shortcuts import render

def index(request):
    return HttpResponse("<h2>Hello, World!</h2>")


def sign_in(request):
    return HttpResponse('Sign in')


def sign_up(request):
    return HttpResponse('Sign up')


def profile(request):
    return HttpResponse("Profile")


def product(request):
    return HttpResponse("product")


def settings(request):
    return HttpResponse("Settings")


def about_us(request):
    return HttpResponse('About us')
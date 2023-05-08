from django.urls import path, re_path
from .views import *

urlpatterns = [
    path('', index),
    re_path(r'^sign', sign),
    re_path(r'^profile/', profile),
    path('search/', search, name='search'),
    re_path(r'^settings/', settings, name='settings'),
    path('product/<int:id>/', product, name='product'),
    path('about-us/', about_us, name='about-us'),
]


from django.urls import path, re_path
from .views import *

urlpatterns = [
    path('', IndexView.as_view(), name='home'),
    re_path(r'^sign', SignView.as_view(), name='sign'),
    re_path(r'^profile/', ProfileView.as_view(), name='profile'),
    path('search/', SearchView.as_view(), name='search'),
    path('settings/', SettingsView.as_view(), name='settings'),
    path('product/<int:id>/', ProductView.as_view(), name='product'),
    path('about-us/', AboutUsView.as_view(), name='about-us'),
]

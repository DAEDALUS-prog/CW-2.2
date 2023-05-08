from django.contrib import admin
from django.urls import path, include
from cls.views import page_not_found

urlpatterns = [
    path('', include('cls.urls')),
    path('admin/', admin.site.urls),
]

handler404 = page_not_found
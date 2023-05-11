from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm

from cls.models import Person


class SearchForm(forms.Form):
    query = forms.CharField(label='Search', max_length=30)


class SignUpForm(UserCreationForm):
    email = forms.EmailField(max_length=30, required=True)

    class Meta:
        model = Person
        fields = ('email', 'name', 'password')


class SignInForm(AuthenticationForm):
    class Meta:
        model = Person
        fields = ('email', 'password')

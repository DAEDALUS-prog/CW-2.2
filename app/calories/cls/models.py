from django.db import models


class Person(models.Model):
    email = models.EmailField(max_length=30)
    name = models.CharField(max_length=20)
    password = models.CharField(max_length=100)
    status = models.IntegerField()
    
    
class Product(models.Model):
    name = models.CharField(max_length=20)
    ccal = models.FloatField()
    fat = models.FloatField()
    proteins = models.FloatField()
    carbohydrates = models.FloatField()
    image = models.ImageField()
    

class History(models.Model):
    person = models.ForeignKey(Person, on_delete=models.CASCADE)
    desciption = models.TextField(max_length=150)
    
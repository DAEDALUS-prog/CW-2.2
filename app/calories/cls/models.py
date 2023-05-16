from django.db import models
from cls.searchAPI import get_product_info


class Person(models.Model):
    email = models.EmailField(max_length=30)
    name = models.CharField(max_length=20)
    password = models.CharField(max_length=100)
    status = models.IntegerField(default=1)
    image = models.ImageField(default='cls/image/none-profile.png')

    
    
class Product(models.Model):
    name = models.CharField(max_length=20)
    ccal = models.FloatField()
    fat = models.FloatField()
    proteins = models.FloatField()
    carbohydrates = models.FloatField()
    image = models.ImageField()
              
    

    
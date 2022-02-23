from django.db import models

# Create your models here.
class Desarrolladora(models.Model):
    name = models.CharField(max_length=250)

class Genero(models.Model):
    genero = models.CharField(max_length=150)

class Games(models.Model):
    name = models.CharField(max_length=250)
    desarrolladora = models.ManyToManyField(Desarrolladora)
    year = models.IntegerField(4)
    description = models.CharField(max_length=500)
    genero = models.ForeignKey(Genero, on_delete=models.PROTECT)
    precio = models.IntegerField(4)


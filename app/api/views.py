from django.shortcuts import render
from django.http import HttpResponse

from rest_framework import viewsets
from rest_framework import permissions
from rest_framework import filters
from .serializers import GameSerializer, DesarrolladoraSerializer, GeneroSerializer
from .models import *

# Create your views here.

def index(request):
    return HttpResponse("Hello world! A ver")


class GameViewSet(viewsets.ModelViewSet):
    search_fields = ["name", "description"]
    filter_backends = (filters.SearchFilter,)
    queryset = Games.objects.all()
    serializer_class = GameSerializer

class DesarrolladoraViewSet(viewsets.ModelViewSet):
    queryset = Desarrolladora.objects.all()
    serializer_class = DesarrolladoraSerializer

class GeneroViewSet(viewsets.ModelViewSet):
    queryset = Genero.objects.all()
    serializer_class = GeneroSerializer
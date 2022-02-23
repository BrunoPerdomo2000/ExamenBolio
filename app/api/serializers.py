from .models import *
from rest_framework import serializers

class GameSerializer(serializers.ModelSerializer):
    class Meta:
        model = Games # Modelo a sacar
        fields = ['id', 'name', 'desarrolladora', 'year', 'description','genero','precio'] # Campos a recuperar
    
   


class DesarrolladoraSerializer(serializers.ModelSerializer):
    class Meta:
        model = Desarrolladora # Modelo a sacar
        fields = ['id', 'name'] # Campos a recuperar

class GeneroSerializer(serializers.ModelSerializer):
    class Meta:
        model = Genero # Modelo a sacar
        fields = ['id', 'genero'] # Campos a recuperar
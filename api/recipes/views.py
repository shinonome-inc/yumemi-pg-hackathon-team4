from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.permissions import AllowAny

from .models import Recipe
from .serializers import RecipeSerializer

# Create your views here.
class RecipeViewSet(viewsets.ModelViewSet):
    queryset = Recipe.objects.all()
    serializer_class = RecipesSerializer
    authentication_classes = []  # 認証なし
    permission_classes = [AllowAny]  # 誰でもアクセス可能
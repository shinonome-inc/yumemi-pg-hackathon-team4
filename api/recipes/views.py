from rest_framework import viewsets
from .models import Recipe, Ingredient, GatheringStep, CookingStep
from .serializers import RecipeSerializer, IngredientSerializer, GatheringStepSerializer, CookingStepSerializer
from rest_framework.permissions import AllowAny

class RecipeViewSet(viewsets.ModelViewSet):
    queryset = Recipe.objects.all()
    serializer_class = RecipeSerializer
    authentication_classes = []  # 認証なし
    permission_classes = [AllowAny]  # 誰でもアクセス可能

class IngredientViewSet(viewsets.ModelViewSet):
    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializer
    authentication_classes = []  # 認証なし
    permission_classes = [AllowAny]  # 誰でもアクセス可能

class GatheringStepViewSet(viewsets.ModelViewSet):
    queryset = GatheringStep.objects.all()
    serializer_class = GatheringStepSerializer
    authentication_classes = []  # 認証なし
    permission_classes = [AllowAny]  # 誰でもアクセス可能

class CookingStepViewSet(viewsets.ModelViewSet):
    queryset = CookingStep.objects.all()
    serializer_class = CookingStepSerializer
    authentication_classes = []  # 認証なし
    permission_classes = [AllowAny]  # 誰でもアクセス可能

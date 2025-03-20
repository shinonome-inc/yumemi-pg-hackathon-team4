from rest_framework import viewsets
from rest_framework.permissions import AllowAny, IsAuthenticated

from authentication.authentication import FirebaseAuthentication

from .models import CookingStep, GatheringStep, Ingredient, Recipe
from .serializers import (CookingStepSerializer, GatheringStepSerializer,
                          IngredientSerializer, RecipeSerializer)


class RecipeViewSet(viewsets.ModelViewSet):
    queryset = Recipe.objects.all()
    serializer_class = RecipeSerializer
    authentication_classes = [FirebaseAuthentication]  # Firebase 認証を適用
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

    def perform_update(self, serializer):
        serializer.save(user=self.request.user)


class IngredientViewSet(viewsets.ModelViewSet):
    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializer


class GatheringStepViewSet(viewsets.ModelViewSet):
    queryset = GatheringStep.objects.all()
    serializer_class = GatheringStepSerializer


class CookingStepViewSet(viewsets.ModelViewSet):
    queryset = CookingStep.objects.all()
    serializer_class = CookingStepSerializer

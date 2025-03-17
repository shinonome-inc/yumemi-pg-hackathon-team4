from rest_framework import viewsets
from .models import Recipe, Ingredient, GatheringStep, CookingStep
from .serializers import RecipeSerializer, IngredientSerializer, GatheringStepSerializer, CookingStepSerializer
from rest_framework.permissions import AllowAny

from authentication.authentication import FirebaseAuthentication
from rest_framework.permissions import IsAuthenticated

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
    authentication_classes = [FirebaseAuthentication]  # Firebase 認証を適用
    permission_classes = [IsAuthenticated]

class GatheringStepViewSet(viewsets.ModelViewSet):
    queryset = GatheringStep.objects.all()
    serializer_class = GatheringStepSerializer
    authentication_classes = [FirebaseAuthentication]  # Firebase 認証を適用
    permission_classes = [IsAuthenticated]

class CookingStepViewSet(viewsets.ModelViewSet):
    queryset = CookingStep.objects.all()
    serializer_class = CookingStepSerializer
    authentication_classes = [FirebaseAuthentication]  # Firebase 認証を適用
    permission_classes = [IsAuthenticated]






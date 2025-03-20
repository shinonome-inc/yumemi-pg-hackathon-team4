
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import RecipeViewSet, IngredientViewSet, GatheringStepViewSet, CookingStepViewSet

router = DefaultRouter()
router.register(r'recipes', RecipeViewSet)
router.register(r'ingredients', IngredientViewSet)
router.register(r'gathering-steps', GatheringStepViewSet)
router.register(r'cooking-steps', CookingStepViewSet)

urlpatterns = [
    path('', include(router.urls)),
]

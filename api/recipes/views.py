from rest_framework import viewsets
from .models import Recipe
from .serializers import RecipeSerializer, CommentSerializer
from rest_flamework.permissions import IsAuthenticate


class RecipeViewSet(viewsets.ModelViewSet):
    serializer_class = RecipeSerializer
    permission_classes = []

    def get_queryset(self):
        sort_param = self.request.query_params.get("sort", None)
        queryset = Recipe.objects.all()
        if sort_param == "likes":
            queryset = queryset.order_by("-likes_count")
        if sort_param =="new":
            queryset = queryset.order_by("-created_at")
        if sort_param == "old":
            queryset = queryset.order_by("created_at")
        return queryset


    

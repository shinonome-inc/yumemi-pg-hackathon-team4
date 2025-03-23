from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from recipes.models import Recipe

from .models import Comment, Like
from .serializers import CommentSerializer
from rest_framework.permissions import IsAuthenticated
from authentication.authentication import FirebaseAuthentication


class LikeRecipeView(APIView):
    authentication_classes = [FirebaseAuthentication]  # Firebase 認証を適用
    permission_classes = [IsAuthenticated]
    def post(self, request, recipe_id):
        recipe = get_object_or_404(Recipe, id=recipe_id)
        user = request.user
        like, created = Like.objects.get_or_create(recipe=recipe, user=user)
        if created:
            return JsonResponse({"message": "Recipe liked successfully."}, status=201)
        return JsonResponse({"message": "Recipe already liked."}, status=200)

    def delete(self, request, recipe_id):
        recipe = get_object_or_404(Recipe, id=recipe_id)
        user = request.user
        like = Like.objects.filter(recipe=recipe, user=user)
        if like.exists():
            like.delete()
            return JsonResponse({"message": "Like removed successfully."}, status=200)
        return JsonResponse({"message": "Like not found."}, status=404)


class CommentRecipeView(APIView):
    authentication_classes = [FirebaseAuthentication]  # Firebase 認証を適用
    permission_classes = [IsAuthenticated]
    def post(self, request, recipe_id):
        recipe = get_object_or_404(Recipe, id=recipe_id)
        user = request.user
        content_text = request.data.get("content_text")
        image_url = request.data.get("image_url", "")
        Comment.objects.create(
            recipe=recipe, user=user, content_text=content_text, image_url=image_url
        )
        return JsonResponse({"message": "Comment added successfully."}, status=201)

    def get(self, request, recipe_id):
        recipe = get_object_or_404(Recipe, id=recipe_id)
        comments = Comment.objects.filter(recipe=recipe)
        serializer = CommentSerializer(comments, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def put(self, request, recipe_id, comment_id):
        recipe = get_object_or_404(Recipe, id=recipe_id)
        comment = get_object_or_404(
            Comment, id=comment_id, recipe=recipe, user=request.user
        )
        content_text = request.data.get("content_text")
        image_url = request.data.get("image_url", "")
        comment.content_text = content_text
        comment.image_url = image_url
        comment.save()
        return JsonResponse({"message": "Comment updated successfully."}, status=200)

    def delete(self, request, recipe_id, comment_id):
        recipe = get_object_or_404(Recipe, id=recipe_id)
        comment = get_object_or_404(
            Comment, id=comment_id, recipe=recipe, user=request.user
        )
        comment.delete()
        return JsonResponse({"message": "Comment deleted successfully."}, status=200)

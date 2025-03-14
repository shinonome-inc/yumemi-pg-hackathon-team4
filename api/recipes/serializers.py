from rest_framework import serializers
from .models import Recipe,Comment

class RecipeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Recipe
        fields = ['title','thumbnail_image_urls','description','tips','AI_comment']

class CommentSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Comment
        fields = [ 'content_text', 'image_url']
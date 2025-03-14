from rest_framework import serializers
from .models import Recipe

class RecipeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Recipe
        fields = ['id','title','thumbnail_image_urls','description','tips','AI_comment','ingredients','cooking_steps','gathering_steps','created_at','updated_at']
        read_only_fields = ["id",'AI_comment',"created_at",'updated_at']

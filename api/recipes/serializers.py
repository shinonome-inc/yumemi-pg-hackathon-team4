from rest_framework import serializers
from .models import Recipe, Ingredient, GatheringStep, CookingStep


#class RecipeSerializer(serializers.ModelSerializer):
    #class Meta:
        #model = Recipe
        #fields = ['id','title','thumbnail_image_url','description','tips','AI_comment','ingredients','cooking_steps','gathering_steps','created_at','updated_at']
        #read_only_fields = ["id",'AI_comment',"created_at",'updated_at']
class IngredientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingredient
        fields = 'all'

class GatheringStepSerializer(serializers.ModelSerializer):
    class Meta:
        model = GatheringStep
        fields = 'all'

class CookingStepSerializer(serializers.ModelSerializer):
    class Meta:
        model = CookingStep
        fields = 'all'

class RecipeSerializer(serializers.ModelSerializer):
    ingredients = IngredientSerializer(many=True, read_only=True)
    gathering_steps = GatheringStepSerializer(many=True, read_only=True)
    cooking_steps = CookingStepSerializer(many=True, read_only=True)

    class Meta:
        model = Recipe
        fields = 'all'
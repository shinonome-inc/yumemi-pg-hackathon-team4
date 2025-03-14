from rest_framework import serializers
from .models import Recipe, Ingredient, GatheringStep, CookingStep

class IngredientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingredient
        fields = ['id', 'ingredient_name', 'quantity']
        read_only_fields = ['id']

class GatheringStepSerializer(serializers.ModelSerializer):
    class Meta:
        model = GatheringStep
        fields = ['id', 'image_url', 'description']
        read_only_fields = ['id']

class CookingStepSerializer(serializers.ModelSerializer):
    class Meta:
        model = CookingStep
        fields = ['id', 'image_url', 'description']
        read_only_fields = ['id']
        

class RecipeSerializer(serializers.ModelSerializer):
    ingredients = IngredientSerializer(many=True)
    gathering_steps = GatheringStepSerializer(many=True)
    cooking_steps = CookingStepSerializer(many=True)

    class Meta:
        model = Recipe
        fields = '__all__'
        read_only_fields = ['id', 'created_at', 'updated_at']
    
    def create(self, validated_data):
        ingredients_data = validated_data.pop('ingredients')
        gathering_steps_data = validated_data.pop('gathering_steps')
        cooking_steps_data = validated_data.pop('cooking_steps')
        
        recipe = Recipe.objects.create(**validated_data)
        
        for ingredient_data in ingredients_data:
            Ingredient.objects.create(recipe=recipe, **ingredient_data)
        
        for gathering_step_data in gathering_steps_data:
            GatheringStep.objects.create(recipe=recipe, **gathering_step_data)
        
        for cooking_step_data in cooking_steps_data:
            CookingStep.objects.create(recipe=recipe, **cooking_step_data)
        
        return recipe

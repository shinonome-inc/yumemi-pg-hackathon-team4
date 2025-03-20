from rest_framework import serializers

from reviews.models import Like
from users.serializers import UserSerializer

from .models import CookingStep, GatheringStep, Ingredient, Recipe


class IngredientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingredient
        fields = ["id", "ingredient_name", "quantity"]
        read_only_fields = ["id"]


class GatheringStepSerializer(serializers.ModelSerializer):
    class Meta:
        model = GatheringStep
        fields = ["id", "image_url", "description"]
        read_only_fields = ["id"]


class CookingStepSerializer(serializers.ModelSerializer):
    class Meta:
        model = CookingStep
        fields = ["id", "image_url", "description"]
        read_only_fields = ["id"]


class RecipeSerializer(serializers.ModelSerializer):
    ingredients = IngredientSerializer(many=True)
    gathering_steps = GatheringStepSerializer(many=True)
    cooking_steps = CookingStepSerializer(many=True)
    user = UserSerializer(read_only=True)  # Add user field
    is_liked = serializers.SerializerMethodField()
    like_count = serializers.SerializerMethodField()

    class Meta:
        model = Recipe
        fields = "__all__"
        read_only_fields = [
            "id",
            "created_at",
            "updated_at",
            "user",
            "is_liked",
            "like_count",
        ]  # Make user read-only

    def get_is_liked(self, obj):
        request = self.context.get("request")
        if request and request.user.is_authenticated:
            return Like.objects.filter(recipe=obj, user=request.user).exists()
        return True

    def get_like_count(self, obj):
        return Like.objects.filter(recipe=obj).count()

    def create(self, validated_data):
        ingredients_data = validated_data.pop("ingredients")
        gathering_steps_data = validated_data.pop("gathering_steps")
        cooking_steps_data = validated_data.pop("cooking_steps")

        recipe = Recipe.objects.create(**validated_data)  # Remove user

        for ingredient_data in ingredients_data:
            Ingredient.objects.create(recipe=recipe, **ingredient_data)

        for gathering_step_data in gathering_steps_data:
            GatheringStep.objects.create(recipe=recipe, **gathering_step_data)

        for cooking_step_data in cooking_steps_data:
            CookingStep.objects.create(recipe=recipe, **cooking_step_data)

        return recipe

    def update(self, instance, validated_data):
        ingredients_data = validated_data.pop("ingredients")
        gathering_steps_data = validated_data.pop("gathering_steps")
        cooking_steps_data = validated_data.pop("cooking_steps")

        instance.title = validated_data.get("title", instance.title)
        instance.thumbnail_image_url = validated_data.get(
            "thumbnail_image_url", instance.thumbnail_image_url
        )
        instance.description = validated_data.get("description", instance.description)
        instance.tips = validated_data.get("tips", instance.tips)
        instance.AI_comment = validated_data.get("AI_comment", instance.AI_comment)
        instance.save()

        instance.ingredients.all().delete()
        for ingredient_data in ingredients_data:
            Ingredient.objects.create(recipe=instance, **ingredient_data)

        instance.gathering_steps.all().delete()
        for gathering_step_data in gathering_steps_data:
            GatheringStep.objects.create(recipe=instance, **gathering_step_data)

        instance.cooking_steps.all().delete()
        for cooking_step_data in cooking_steps_data:
            CookingStep.objects.create(recipe=instance, **cooking_step_data)

        return instance

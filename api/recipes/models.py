from django.db import models

from users.models import User


# Create your models here.
class Recipe(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="recipes")
    title = models.CharField(max_length=255)
    thumbnail_image_url = models.URLField(blank=True)
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    tips = models.TextField(blank=True)
    AI_comment = models.TextField(blank=True)
    servings = models.IntegerField(default=1)  # 何人前なのかを示すフィールド
    flavor_review = models.TextField(blank=True)  # 食レポを追加
    
    


class Ingredient(models.Model):
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, related_name="ingredients"
    )
    ingredient_name = models.CharField(max_length=255)
    quantity = models.CharField(max_length=255)


class GatheringStep(models.Model):
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, related_name="gathering_steps"
    )
    image_url = models.URLField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)


class CookingStep(models.Model):
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, related_name="cooking_steps"
    )
    image_url = models.URLField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)

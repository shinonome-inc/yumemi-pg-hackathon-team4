from django.db import models

from users.models import User


# Create your models here.
class Recipe(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="recipes")
    title = models.CharField(max_length=255)
    thumbnail_image_url = models.URLField(blank=True)
    description = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    tips = models.TextField(blank=True)
    AI_comment = models.TextField(blank=True)


class Ingredient(models.Model):
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, related_name="ingredients"
    )
    ingredient_name = models.CharField(max_length=255)
    quantity = models.CharField(max_length=255)


class Gathering_Steps(models.Model):
    recipr = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, related_name="gathering_steps"
    )
    image_url = models.URLField(blank=True)
    description = models.TextField(blank=True)


class Cooking_Steps(models.Model):
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, related_name="cooking_steps"
    )
    image_url = models.URLField(blank=True)
    description = models.TextField(blank=True)

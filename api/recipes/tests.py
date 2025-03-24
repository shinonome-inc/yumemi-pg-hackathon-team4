from django.urls import reverse
from rest_framework import status
from rest_framework.test import APIClient, APITestCase

from recipes.models import Recipe
from reviews.models import Like
from users.models import User


# 認証は切り離してテストを行った
class RecipeTests(APITestCase):
    def setUp(self):
        self.client = APIClient()
        self.user = User.objects.create_user(
            username="testuser", password="testpass", email="testuser@example.com"
        )
        self.client.force_authenticate(user=self.user)  # 認証を通す

        self.recipe_data = {
            "title": "Test Recipe",
            "thumbnail_image_url": "http://example.com/image.jpg",
            "description": "Test description",
            "tips": "Test tips",
            "AI_comment": "Test AI comment",
            "servings": 2,
            "flavor_review": "Test flavor review",
            "ingredients": [
                {"ingredient_name": "Test Ingredient", "quantity": "1 cup"}
            ],
            "gathering_steps": [
                {
                    "description": "Test gathering step",
                    "image_url": "http://example.com/gathering.jpg",
                }
            ],
            "cooking_steps": [
                {
                    "description": "Test cooking step",
                    "image_url": "http://example.com/cooking.jpg",
                }
            ],
        }

    def test_create_recipe(self):
        url = reverse("recipe-list")
        response = self.client.post(url, self.recipe_data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Recipe.objects.count(), 1)
        self.assertEqual(Recipe.objects.get().title, "Test Recipe")

    def test_get_recipe(self):
        recipe = Recipe.objects.create(
            user=self.user, title="Test Recipe", description="Test description"
        )
        url = reverse("recipe-detail", args=[recipe.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data["title"], recipe.title)

    def test_update_recipe(self):
        recipe = Recipe.objects.create(
            user=self.user, title="Test Recipe", description="Test description"
        )
        url = reverse("recipe-detail", args=[recipe.id])
        updated_data = self.recipe_data.copy()
        updated_data["title"] = "Updated Recipe"
        response = self.client.put(url, updated_data, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        recipe.refresh_from_db()
        self.assertEqual(recipe.title, "Updated Recipe")

    def test_delete_recipe(self):
        recipe = Recipe.objects.create(
            user=self.user, title="Test Recipe", description="Test description"
        )
        url = reverse("recipe-detail", args=[recipe.id])
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Recipe.objects.count(), 0)

    def test_like_recipe(self):
        recipe = Recipe.objects.create(
            user=self.user, title="Test Recipe", description="Test description"
        )
        Like.objects.create(recipe=recipe, user=self.user)
        url = reverse("recipe-detail", args=[recipe.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue(response.data["liked_by_me"])
        self.assertEqual(response.data["likes_counts"], 1)

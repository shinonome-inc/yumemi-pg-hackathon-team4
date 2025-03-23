from django.urls import reverse
from rest_framework import status
from rest_framework.test import APIClient, APITestCase

from recipes.models import Recipe
from users.models import User

from .models import Comment, Like


class ReviewTests(APITestCase):
    def setUp(self):
        self.client = APIClient()
        self.user = User.objects.create_user(
            username="testuser", password="testpass", email="testuser@example.com"
        )
        self.recipe = Recipe.objects.create(
            title="Test Recipe", description="Test Description", user=self.user
        )
        self.client.force_authenticate(user=self.user)

        self.comment_data = {
            "content_text": "This is a test comment.",
            "image_url": "http://example.com/image.jpg",
        }

    def test_create_like(self):
        url = reverse("like_recipe", args=[self.recipe.id])
        response = self.client.post(url, self.like_data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Like.objects.count(), 1)
        self.assertEqual(Like.objects.get().recipe.id, self.recipe.id)

    def test_delete_like(self):
        like = Like.objects.create(recipe=self.recipe, user=self.user)
        url = reverse("like_recipe", args=[self.recipe.id])
        response = self.client.delete(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(Like.objects.count(), 0)

    def test_create_comment(self):
        url = reverse("post_get_recipe", args=[self.recipe.id])
        response = self.client.post(url, self.comment_data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Comment.objects.count(), 1)
        self.assertEqual(Comment.objects.get().content_text, "This is a test comment.")

    def test_get_comments(self):
        url = reverse("post_get_recipe", args=[self.recipe.id])
        response = self.client.get(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_update_comment(self):
        comment = Comment.objects.create(
            recipe=self.recipe, user=self.user, content_text="Test Comment"
        )
        url = reverse("update_delete_comment", args=[self.recipe.id, comment.id])
        updated_data = {
            "content_text": "Updated Comment",
            "image_url": "http://example.com/updated.jpg",
        }
        response = self.client.put(url, updated_data, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_delete_comment(self):
        comment = Comment.objects.create(
            recipe=self.recipe, user=self.user, content_text="Test Comment"
        )
        url = reverse("update_delete_comment", args=[self.recipe.id, comment.id])
        response = self.client.delete(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(Comment.objects.count(), 0)

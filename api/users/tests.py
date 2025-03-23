# from django.urls import path, include, re_path
# from rest_framework.routers import DefaultRouter
# from rest_framework.test import APITestCase, APIClient
# from rest_framework import status
# from django.contrib.auth import get_user_model
# from django.urls import reverse
# from .views import UserViewSet

# User = get_user_model()

# class UserTests(APITestCase):
#     def setUp(self):
#         self.client = APIClient()
#         self.user = User.objects.create_user(
#             username="testuser", password="testpass", email="testuser@example.com"
#         )
#         self.client.force_authenticate(self.user)
#         self.post_user_data = {
#             "username": "test_new_user",
#             "image_url": "http://example.com/image.jpg",
#             "profile_description": "This is a test user.",
#         }

#     def test_get_user(self):
#         url = reverse("user-detail", args=[self.user.id])
#         response = self.client.get(url, format="json")
#         self.assertEqual(response.status_code, status.HTTP_200_OK)
#         self.assertEqual(response.data["email"], self.user.email)

#     def test_update_user(self):
#         url = reverse("user-detail", args=[self.user.id])
#         updated_data = {
#             "username": "updateduser",
#             "image_url": "http://example.com/updated.jpg",
#             "profile_description": "This is an updated user.",
#         }
#         response = self.client.put(url, updated_data, format="json")
#         self.assertEqual(response.status_code, status.HTTP_200_OK)
#         self.assertEqual(User.objects.get(id=self.user.id).username, "updateduser")

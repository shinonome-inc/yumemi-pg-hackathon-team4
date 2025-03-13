from django.test import TestCase

# Create your tests here.
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from .models import User

class UserTests(APITestCase):
    def setUp(self):
        self.post_user_data = {
            'email': 'test@example.com',
            'username': 'testuser',
            'image_url': 'http://example.com/image.jpg',
            'profile_description': 'This is a test user.'
        }
      

    def test_create_user(self):
        url = reverse('user-list')
        response = self.client.post(url, self.post_user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(User.objects.get().email, 'test@example.com')

    def test_get_user(self):
        user = User.objects.create_user(**self.post_user_data)
        url = reverse('user-detail', args=[user.id])
        response = self.client.get(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['email'], user.email)

    def test_update_user(self):
        user = User.objects.create_user(**self.post_user_data)
        url = reverse('user-detail', args=[user.id])
        updated_data = self.post_user_data.copy()
        updated_data['username'] = 'updateduser'
        updated_data['image_url'] = 'http://example.com/updated.jpg'
        updated_data['profile_description'] = 'This is an updated user.'
        response = self.client.put(url, updated_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(User.objects.get().username, 'updateduser')

    def test_delete_user(self):
        user = User.objects.create_user(**self.post_user_data)
        url = reverse('user-detail', args=[user.id])
        response = self.client.delete(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(User.objects.count(), 0)
        
        
from rest_framework import serializers
from .models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'email', 'username', 'image_url', 'profile_description', 'created_at']
        read_only_fields = ['id', 'created_at']

    # def create(self, validated_data):
    #     user = User.objects.create_user(
    #         email=validated_data['email'],
    #         # password=validated_data.get('password'),
    #         username=validated_data['username'],
    #         image_url=validated_data.get('image_url', ''),
    #         profile_description=validated_data.get('profile_description', '')
    #     )
    #     return user
    
    
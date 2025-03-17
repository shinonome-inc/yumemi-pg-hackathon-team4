from rest_framework import serializers
from django.contrib.auth import get_user_model

User = get_user_model()

class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=False)
    class Meta:
        model = User
        fields = ["id", "email", "username", "image_url", "profile_description", "firebase_uid", "created_at"]
        read_only_fields = ["id", "firebase_uid", "email","created_at"]

    def update(self, instance, validated_data):
        instance.username = validated_data.get("username", instance.username)
        instance.image_url = validated_data.get("image_url", instance.image_url)
        instance.profile_description = validated_data.get("profile_description", instance.profile_description)
        instance.save()
        return instance


from rest_framework import serializers
from .models import User

class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=False)
    
    class Meta:
        model = User
        fields = ['id', 'email', 'username', 'image_url', 'profile_description', 'created_at']
        read_only_fields = ['id', 'created_at']
        
    def validate(self, attrs):
        request = self.context.get('request')
        if request and request.method == 'POST' and 'email' not in attrs:
            raise serializers.ValidationError({"email": "This field is required."})
        return attrs
    
    
from django.contrib.auth import get_user_model
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from authentication.authentication import FirebaseAuthentication

from .serializers import UserSerializer

User = get_user_model()


# ユーザープロフィール更新+ユーザー情報取得のために使用
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    authentication_classes = [FirebaseAuthentication]  # Firebase 認証を適用
    permission_classes = [IsAuthenticated]

    lookup_field = "firebase_uid"

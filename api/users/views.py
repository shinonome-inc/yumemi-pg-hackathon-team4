from rest_framework import viewsets
from rest_framework.permissions import AllowAny

from .models import User
from .serializers import UserSerializer


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    authentication_classes = []  # 認証なし
    permission_classes = [AllowAny]  # 誰でもアクセス可能

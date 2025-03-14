import firebase_admin.auth
from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed

from django.contrib.auth import get_user_model

User = get_user_model() 


class FirebaseAuthentication(BaseAuthentication):
    def authenticate(self, request):
        auth_header = request.headers.get("Authorization")

        if not auth_header:
            return None

        id_token = auth_header.split(" ").pop()  # "Bearer <token>" の <token> 部分を取得

        try:
            decoded_token = firebase_admin.auth.verify_id_token(id_token)
            uid = decoded_token["uid"]
        except Exception:
            raise AuthenticationFailed("Invalid Firebase ID token")

        # Djangoのユーザーと紐付ける（カスタムモデルを使う場合は適宜変更）
        user, created = User.objects.get_or_create(username=uid)

        return user, None

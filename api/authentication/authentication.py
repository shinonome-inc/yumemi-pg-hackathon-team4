from django.contrib.auth import get_user_model
from firebase_admin import auth
from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed

User = get_user_model()


class FirebaseAuthentication(BaseAuthentication):
    def authenticate(self, request):
        auth_header = request.headers.get("Authorization")
        if not auth_header or not auth_header.startswith("Bearer "):
            return None  # 認証情報がない場合は他の認証方式に委ねる

        id_token = auth_header.split("Bearer ")[1].strip()

        try:
            decoded_token = auth.verify_id_token(id_token)
            firebase_uid = decoded_token.get("uid")
            if not firebase_uid:
                raise AuthenticationFailed("Invalid Firebase ID token")
        except Exception:
            raise AuthenticationFailed("Invalid Firebase ID token")

        # Firebase UID から Django ユーザーを取得 or 作成
        user, created = User.objects.get_or_create(
            firebase_uid=firebase_uid,
            defaults={
                "email": decoded_token.get("email", ""),
                "username": decoded_token.get("name", "") or f"user_{firebase_uid[:8]}",
            },
        )

        return (user, None)

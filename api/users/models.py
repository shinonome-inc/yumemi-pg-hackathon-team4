
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models

class UserManager(BaseUserManager):
    def create_user(self, email, firebase_uid=None, username="", password=None, **extra_fields):
        if not email:
            raise ValueError("Email is required")
        email = self.normalize_email(email)
        user = self.model(email=email, firebase_uid=firebase_uid, username=username, **extra_fields)
        
        # Firebase で認証するので password は不要
        if password:
            user.set_password(password)

        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        return self.create_user(email, username="admin", password=password, **extra_fields)

class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)

    username = models.CharField(max_length=255, blank=True)

    image_url = models.URLField(blank=True)
    profile_description = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    # Firebase のユーザー ID を保存
    firebase_uid = models.CharField(max_length=255, unique=True, blank=True, null=True)
    
    objects = UserManager()

    # Django の認証用設定
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["username"]

    def __str__(self):
        return self.username or self.email

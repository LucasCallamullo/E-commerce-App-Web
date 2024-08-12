from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser

from django.contrib.auth.models import BaseUserManager


class CustomUserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('The Email field must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self.create_user(email, password, **extra_fields)


class CustomUser(AbstractUser):
    username = None  # Elimina el campo 'username'
    email = models.EmailField(unique=True)  # Campo de email único
    phone = models.CharField(max_length=20, blank=True, null=True)
    province = models.CharField(max_length=50, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)

    # Usa 'email' en lugar de 'username' para autenticación
    USERNAME_FIELD = "email"

    # No se requieren campos adicionales para crear un superusuario
    REQUIRED_FIELDS = []

    # Tenemos que pasarle la nueva base
    objects = CustomUserManager()

    def __str__(self):
        return self.email  # Retorna el correo electrónico como representación del usuario

from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework.serializers import ModelSerializer
from .models import *


class MyTokenObtainPairSerializer(TokenObtainPairSerializer):

    def validate(self, attrs):
        data = super().validate(attrs)
        refresh = self.get_token(self.user)
        data['refresh'] = str(refresh)
        data['token'] = str(refresh.access_token)
        data['username'] = self.user.username
        if self.user.role:
            data['role'] = self.user.role.title
        if self.user.name:
            data['name'] = self.user.name
        return data


class UserSerializer(ModelSerializer):
    role = serializers.CharField(source='role.title', read_only=True)
    avatar = serializers.CharField(source='avatar.url.url', read_only=True)


    class Meta:
        model = UserInfo
        fields = ['id', 'username', 'name', 'gender', 'age', 'phone', 'role', 'avatar', 'date_joined']


class CharacterSerializer(ModelSerializer):
    section = serializers.CharField(source='section.title', read_only=True)

    class Meta:
        model = Characters
        fields = '__all__'


class MenuSerializer(ModelSerializer):
    class Meta:
        model = Menu
        fields = '__all__'

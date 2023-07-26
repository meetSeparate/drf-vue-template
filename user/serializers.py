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
        return data


class UserSerializer(ModelSerializer):
    class Meta:
        model = UserInfo
        fields = ['id', 'username', 'name', 'gender', 'age', 'phone', 'role', 'date_joined']


class CharacterSerializer(ModelSerializer):
    class Meta:
        model = Characters
        fields = '__all__'


class MenuSerializer(ModelSerializer):
    parent_menu_id = serializers.CharField(source='parent_menu.id', read_only=True)
    another_name = serializers.CharField(allow_null=True)
    reveal = serializers.CharField(allow_null=True)
    path = serializers.CharField(allow_null=True)
    menu_name = serializers.CharField(allow_null=True)
    component_address = serializers.CharField(allow_null=True)
    redirect = serializers.CharField(allow_null=True)
    menu_icon = serializers.CharField(allow_null=True)

    class Meta:
        model = Menu
        fields = '__all__'
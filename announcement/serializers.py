from rest_framework import serializers
from .models import Announcement
from user.models import UserInfo


class AnnouncementSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source='user.username', read_only=True)

    class Meta:
        model = Announcement
        fields = '__all__'

    def create(self, validated_data, username):
        user = UserInfo.objects.get(username=username)
        return Announcement.objects.create(**validated_data, user_id=user.id)

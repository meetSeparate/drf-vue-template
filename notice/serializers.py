from rest_framework.serializers import ModelSerializer
from notice.models import Notice


class NoticeSerializer(ModelSerializer):
    class Meta:
        model = Notice
        fields = ['id', 'avatar', 'title', 'datetime', 'description', 'type']
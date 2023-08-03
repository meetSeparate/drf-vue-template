from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from announcement.models import Announcement
from announcement.serializers import AnnouncementSerializer


class AnnouncementView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        res = {
            'code': 500,
            'msg': 'success',
            'data': []
        }

        anno_query = Announcement.objects.all()
        ser = AnnouncementSerializer(instance=anno_query, many=True)
        res['code'] = 200
        res['data'] = ser.data
        return Response(res)

    def post(self, request):
        res = {
            'code': 500,
            'msg': '新增成功',
            'data': {}
        }
        content = request.data.get('content')
        color = request.data.get('color')
        size = request.data.get('size')
        Announcement.objects.create(content=content, color=color, size=size, user=request.user)
        res['code'] = 200
        return Response(res)

    def delete(self, request):
        res = {
            'code': 500,
            'msg': '删除成功',
            'data': {}
        }

        id = request.data.get('id')
        anno = Announcement.objects.filter(id=id)
        anno.delete()
        res['code'] = 200
        return Response(res)

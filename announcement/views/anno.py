from rest_framework.views import APIView
from rest_framework.response import Response
from announcement.models import Announcement
from announcement.serializers import AnnouncementSerializer


class AnnouncementView(APIView):
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

        ser = AnnouncementSerializer(data=request.data)
        if ser.is_valid():
            username = request.data.get('username')
            ser.create(validated_data=ser.validated_data, username=username)
            res['code'] = 200
        else:
            res['msg'] = ser.errors
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

from rest_framework.views import APIView
from rest_framework.response import Response
from notice.models import Notice
from user.serializers import UserSerializer


class UserNoticeView(APIView):
    def get(self, request):
        res = {
            'code': 500,
            'msg': '获取成功',
            'data': []
        }

        id = request.GET.get('id')
        user_list = Notice.objects.filter(id=id).first().user.all()
        ser = UserSerializer(instance=user_list, many=True)
        res['data'] = ser.data
        res['code'] = 200
        return Response(res)

    def delete(self, request):
        res = {
            'code': 500,
            'msg': '删除成功',
            'data': []
        }
        notice_id = request.data.get('noticeId')
        user_id = request.data.get('userId')
        notice_obj = Notice.objects.filter(id=notice_id).first()
        notice_obj.user.remove(user_id)
        res['code'] = 200
        return Response(res)

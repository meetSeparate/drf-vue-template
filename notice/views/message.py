from rest_framework.views import APIView
from rest_framework.response import Response
from notice.models import Notice
from user.models import UserInfo
from notice.serializers import NoticeSerializer


class NoticeView(APIView):
    def post(self, request):
        res = {
            'code': 500,
            'msg': '发送成功',
            'data': {}
        }
        user_list = request.data.get('multipleSelection')
        notice_type = request.data.get('type')
        avatar = request.data.get('avatar')
        title = request.data.get('title')
        description = request.data.get('description')
        notice_obj = Notice.objects.create(type=notice_type, avatar=avatar, title=title, description=description)
        for i in user_list:
            notice_obj.user.add(i)
        res['code'] = 200
        return Response(res)

    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': [],
            'count': 1,
            'user': []
        }
        user_obj = UserInfo.objects.filter(id=request.user.id).first()
        user_notice = user_obj.notice_set.all()
        ser = NoticeSerializer(instance=user_notice, many=True)
        res['data'] = ser.data
        res['count'] = user_notice.count()
        return Response(res)
from rest_framework.views import APIView
from rest_framework.response import Response
from notice.models import Notice


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
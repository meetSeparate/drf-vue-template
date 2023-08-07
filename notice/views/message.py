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
        return Response(res)
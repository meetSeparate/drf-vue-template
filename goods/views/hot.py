from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions
from goods.models import Recommend


class GoodsHotView(APIView):
    permission_classes = [permissions.AllowAny]
    res = {
        'code': 500,
        'msg': '操作成功',
        'result': []
    }

    def get(self, request):
        result = Recommend.objects.all()[:4]
        self.res['result'] = []
        for recommend in result:
            self.res['result'].append({
                'id': recommend.id,
                'title': recommend.title,
                'alt': recommend.alt,
                'pictures': 'http://127.0.0.1:8000' + recommend.picture.url,
            })
        self.res['code'] = 200
        return Response(self.res)

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions
from goods.models import Goods


class GoodsNewView(APIView):
    permission_classes = [permissions.AllowAny]
    res = {
        'code': 500,
        'msg': '操作成功',
        'data': None
    }

    def get(self, request):
        result = Goods.objects.order_by('create_date')[:4]
        self.res['data'] = []
        for good in result:
            self.res['data'].append({
                'id': good.id,
                'name': good.name,
                'desc': good.desc,
                'picture': 'http://127.0.0.1:8000' + good.picture.url,
                'price': good.price,
                'orderNum': good.orderNum
            })
        self.res['code'] = 200
        return Response(self.res)

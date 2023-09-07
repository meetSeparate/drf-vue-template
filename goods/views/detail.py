from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework.response import Response
from goods.models import Goods, GoodsSpecs
from goods.utils.util import get_all_category


class GoodsDetailView(APIView):
    permission_classes = [permissions.AllowAny]
    res = {
        'code': 500,
        'msg': '操作成功',
        'data': None
    }

    def get(self, request):
        id = request.GET.get('id')
        good_obj = Goods.objects.filter(id=id).first()
        self.res = {
            'id': good_obj.id,
            'name': good_obj.name,
            'desc': good_obj.desc,
            'oldPrice': good_obj.old_price,
            'price': good_obj.price,
            'saleCount': good_obj.salesCount,
            'collectCount': good_obj.collectionCount,
            'commentCount': good_obj.commentCount,
            'category': get_all_category(good_obj),
        }


        return Response(self.res)

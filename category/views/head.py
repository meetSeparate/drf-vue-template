from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework.response import Response
from category.models import Category
from category.utils.get_sub_category import get_sub_category


class CategoryHeadView(APIView):
    permission_classes = [permissions.AllowAny]
    res = {
        'code': 500,
        'msg': '操作成功',
        'data': None
    }

    def get(self, request):
        category_list = Category.objects.filter(parent_category=None)
        self.res['data'] = get_sub_category(category_list, 9, 1)
        self.res['code'] = 200
        return Response(self.res)


class CategoryView(APIView):
    permission_classes = [permissions.AllowAny]

    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': []
        }
        category_list = Category.objects.filter(parent_category=None)
        goods = []
        for category in category_list:
            for good in category.goods.all().order_by('?'):
                goods.append({
                    'id': good.id,
                    'desc': good.desc,
                    'discount': 9,
                    'name': good.name,
                    'picture': f'http://127.0.0.1:8000{good.picture.url}',
                    'price': good.price,
                    'orderNum': 1
                })
            res['result'].append({
                'icon': f'http://127.0.0.1:8000{category.picture.url}',
                'id': category.id,
                'name': category.name,
                'goods': goods
            })
        return Response(res)

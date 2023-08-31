from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from category.models import Category
from category.utils.get_sub_category import get_goods


class CategoryDetailsView(APIView):
    permission_classes = [permissions.AllowAny]
    res = {
        'code': 500,
        'msg': '操作成功',
        'data': {}
    }

    def get(self, request):
        id = request.GET.get('id')
        category_obj = Category.objects.filter(id=id).first()
        info = []
        for category in category_obj.category_set.all():
            info.append({
                'id': category.id,
                'name': category.name,
                'picture': 'http://127.0.0.1:8000' + category.picture.url,
                'goods': get_goods(category.goods.all())
            })
        self.res['data'] = {
            'id': category_obj.id,
            'name': category_obj.name,
            'picture': category_obj.picture.url,
            'children': info
        }
        self.res['code'] = 200
        return Response(self.res)

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
        self.res['data'] = get_sub_category(category_list)
        self.res['code'] = 200
        return Response(self.res)
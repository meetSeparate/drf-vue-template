from rest_framework.views import APIView
from rest_framework.response import Response
from goods.models import Goods
from api.config.pagination import Pagination
from rest_framework import permissions


class GuessView(APIView):
    permission_classes = [permissions.AllowAny]

    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {
                'counts': 43,
                'page': 1,
                'pageSize': 10,
                'pages': 2,
                'items': []
            }
        }

        page = int(request.GET.get('page'))
        pageSize = int(request.GET.get('pageSize'))
        res['result']['page'] = page
        res['result']['pageSize'] = pageSize
        counts = Goods.objects.count()
        res['result']['counts'] = counts

        pager = Pagination(current_page=page, limit=pageSize, all_count=counts)
        pages = counts // pageSize + 1
        goods_list = Goods.objects.order_by('?')[pager.start:pager.end]

        for good in goods_list:
            res['result']['items'].append({
                'id': good.id,
                'name': good.name,
                'desc': good.desc,
                'picture': f'http://127.0.0.1:8000{good.picture.url}',
                'orderNum': good.orderNum,
                'price': good.price
            })
        res['result']['pages'] = pages

        return Response(res)

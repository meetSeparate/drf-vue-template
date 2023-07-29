from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions
from api.utils.get_route import get_route


class RouteView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        res = {
            'code': 500,
            'msg': '获取成功',
            'data': []
        }
        menu_list = get_route(request.user)
        res['data'] = menu_list
        res['code'] = 200
        return Response(res)


from rest_framework.views import APIView
from rest_framework.response import Response
from user.utils.sub_menu import sub_menu_list
from user.serializers import MenuSerializer


class MenuView(APIView):
    def get(self, request):
        res = {
            'code': 500,
            'msg': '获取成功',
            'data': []
        }

        menu_list = sub_menu_list()
        ser = MenuSerializer(instance=menu_list, many=True)
        res['code'] = 200
        res['data'] = ser.data
        return Response(res)

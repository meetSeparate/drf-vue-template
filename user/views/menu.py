from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from user.utils.sub_menu import get_sub_menu
from user.serializers import MenuSerializer


class MenuView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        res = {
            'code': 500,
            'msg': '获取成功',
            'data': []
        }

        menu_list = get_sub_menu()
        res['code'] = 200
        res['data'] = menu_list
        return Response(res)

    def post(self, request):
        res = {
            'code': 500,
            'msg': '新增成功',
            'data': []
        }
        ser = MenuSerializer(data=request.data)
        if ser.is_valid():
            ser.save()
            res['code'] = 200
        else:
            res['msg'] = ser.errors
        return Response(res)

from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from user.utils.sub_menu import get_sub_menu
from user.serializers import MenuSerializer
from user.models import Menu


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

    def put(self, request):
        res = {
            'code': 500,
            'msg': '修改成功',
            'data': []
        }
        value = int(request.data.get('value'))
        menu_query = Menu.objects.filter(id=value).first()
        ser = MenuSerializer(instance=menu_query, data=request.data)
        if ser.is_valid():
            ser.save()
            res['code'] = 200
        else:
            res['msg'] = ser.errors
        return Response(res)

    def delete(self, request):
        res = {
            'code': 500,
            'msg': '删除成功',
            'data': []
        }
        value = int(request.data.get('value'))
        menu_obj = Menu.objects.filter(id=value)
        menu_obj.delete()
        res['code'] = 200
        return Response(res)


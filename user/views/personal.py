from rest_framework.views import APIView
from rest_framework.response import Response
from user.serializers import UserSerializer
from user.models import UserInfo


class PersonalView(APIView):
    def get(self, request):
        res = {
            'code': 500,
            'data': {}
        }

        ser = UserSerializer(instance=request.user)
        res['data'] = ser.data
        res['code'] = 200
        return Response(res)

    def put(self, request):
        res = {
            'code': 500,
            'msg': '修改成功',
            'data': {}
        }
        id = request.data.get('id')
        user_obj = UserInfo.objects.filter(id=id).first()
        ser = UserSerializer(instance=user_obj, data=request.data)
        if ser.is_valid():
            ser.save()
            res['data'] = ser.data
            res['code'] = 200
        else:
            res['msg'] = '未知错误'
        return Response(res)
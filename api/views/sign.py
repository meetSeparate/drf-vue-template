from rest_framework.views import APIView
from user.models import UserInfo
from rest_framework.response import Response


class SignView(APIView):
    permission_classes = []

    def post(self, request):
        res = {
            'code': 500,
            'msg': '注册成功',
            'data': []
        }

        username = request.data.get('username')
        password = request.data.get('password')
        re_password = request.data.get('rePassword')

        if password != re_password:
            res['msg'] = '两次密码输入不一致'
            return Response(res)

        user = UserInfo.objects.filter(username=username)
        if user:
            res['msg'] = '该用户名已存在'
            return Response(res)

        UserInfo.objects.create_user(username=username, password=password)
        res['code'] = 200
        return Response(res)

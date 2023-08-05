from django.contrib import auth
from rest_framework.views import APIView
from rest_framework.response import Response


class EditPasswordView(APIView):
    def post(self, request):
        res = {
            "msg": '密码修改成功！',
            'self': None,
            'code': 412,
        }
        old_password = request.data.get('oldPassword')
        new_password = request.data.get('newPassword')
        user = auth.authenticate(username=request.user.username, password=old_password)
        if not user:
            res['msg'] = '原密码输入错误'
            return Response(res, status=300)
        new_user = request.user
        new_user.set_password(new_password)
        new_user.save()
        auth.logout(request)

        res['code'] = 0
        return Response(res)
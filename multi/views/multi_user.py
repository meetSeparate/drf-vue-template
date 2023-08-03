from rest_framework.views import APIView
from rest_framework.response import Response
from user.models import UserInfo


class MultiDeleteUserView(APIView):
    def delete(self, request):
        res = {
            'code': 500,
            'msg': '删除成功',
            'data': {}
        }

        multi_data = request.data.get('multiData')
        for info in multi_data:
            user_query = UserInfo.objects.filter(id=info)
            user_query.delete()
        res['code'] = 200
        return Response(res)
from rest_framework.views import APIView
from rest_framework.response import Response
from user.models import Characters


class MultiDeleteRoleView(APIView):
    def delete(self, request):
        res = {
            'code': 500,
            'msg': '删除成功',
            'data': {}
        }

        multi_data = request.data.get('multiData')
        for info in multi_data:
            role_query = Characters.objects.filter(id=info)
            role_query.delete()
        res['code'] = 200
        return Response(res)
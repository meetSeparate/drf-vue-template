from rest_framework.views import APIView
from rest_framework.response import Response
from user.models import UserInfo

class SalaryUserView(APIView):
    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': []
        }

        name = request.GET.get('name')
        user_list = UserInfo.objects.filter(name__contains=name)

        for user in user_list:
            res['data'].append({
                'id': user.id,
                'name': user.name
            })

        return Response(res)
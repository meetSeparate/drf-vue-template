from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions
from api.config.pagination import Pagination
from user.serializers import UserSerializer
from user.models import UserInfo, Characters


class UserView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        res = {
            'code': 500,
            'msg': ' success',
            'data': [],
            'total': 7
        }
        username = request.GET.get('username')
        currentPage = int(request.GET.get('currentPage'))
        pageSize = int(request.GET.get('pageSize'))
        if username:
            user_query = UserInfo.objects.filter(username__contains=username)
        else:
            user_query = UserInfo.objects.all()
        total = user_query.count()
        pager = Pagination(
            limit=int(pageSize),
            all_count=int(total),
            current_page=int(currentPage)
        )

        user_list = user_query[pager.start: pager.end]
        serializer = UserSerializer(instance=user_list, many=True)
        res['data'] = serializer.data
        res['total'] = total
        res['code'] = 200
        return Response(res)

    def post(self, request):
        res = {
            'code': 500,
            'msg': '增加成功',
            'data': {}
        }
        role = request.data.get('role')
        char = Characters.objects.filter(title=role).first()
        user = UserInfo.objects.create_user(username=request.data.get('username'),
                                            password=request.data.get('password'))
        user.role = char
        user.save()
        ser = UserSerializer(instance=user, data=request.data)
        if ser.is_valid():
            ser.save()
            res['code'] = 200
            res['data'] = ser.data
        else:
            res['msg'] = ser.errors
        return Response(res)

    def put(self, request):
        res = {
            'code': 500,
            'msg': '编辑成功',
            'data': {}
        }
        id = request.data.get('id')
        role = request.data.get('role')
        char = Characters.objects.filter(title=role).first()
        user_obj = UserInfo.objects.filter(id=id).first()
        user_obj.role = char
        user_obj.save()
        ser = UserSerializer(instance=user_obj, data=request.data)
        if ser.is_valid():
            ser.save()
            res['code'] = 200
            res['data'] = ser.data
        else:
            res['msg'] = ser.errors
        return Response(res)

    def delete(self, request):
        id = request.data.get('id')
        user_query = UserInfo.objects.filter(id=id)
        user_query.delete()
        return Response({})


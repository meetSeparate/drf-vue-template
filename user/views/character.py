from rest_framework import permissions
from rest_framework.views import APIView
from api.config.pagination import Pagination
from user.models import Characters
from user.serializers import CharacterSerializer
from rest_framework.response import Response


class CharacterView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def __init__(self, **kwargs):
        self.res = {
            'code': 500,
            'msg': '操作成功',
            'data': []
        }
        super().__init__(**kwargs)

    def get(self, request):

        limit = request.query_params.get('currentSize')
        page = request.query_params.get('currentPage')
        character_name = request.query_params.get('searchInfo')

        if character_name:
            character_query = Characters.objects.filter(title__contains=character_name)
        else:
            character_query = Characters.objects.all()

        total = character_query.count()
        pager = Pagination(
            limit=int(limit),
            all_count=int(total),
            current_page=int(page)
        )

        character_list = character_query[pager.start: pager.end]
        ser = CharacterSerializer(instance=character_list, many=True)
        total_ser = CharacterSerializer(instance=character_query, many=True)

        self.res['data'] = ser.data
        self.res['total_data'] = total_ser.data
        self.res['total'] = total
        self.res['code'] = 200

        return Response(self.res)

    def post(self, request):
        permission = request.data.get('permissions')
        title = request.data.get('title')
        note = request.data.get('note')
        character = Characters.objects.create(title=title, note=note)
        character.menu.add(*permission)
        self.res['code'] = 200
        return Response(self.res)

    def put(self, request):
        id = request.data.get('id')
        permission = request.data.get('permissions')
        title = request.data.get('title')
        note = request.data.get('note')
        char = Characters.objects.filter(id=id)
        char.update(title=title, note=note)
        char.first().menu.set(permission)
        self.res['code'] = 200
        return Response(self.res)

    def delete(self, request):
        id = request.data.get('id')
        char = Characters.objects.filter(id=id)
        char.delete()
        self.res['code'] = 200
        return Response(self.res)
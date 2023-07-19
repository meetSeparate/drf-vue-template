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

        self.res['data'] = ser.data
        self.res['total'] = total
        self.res['code'] = 200

        return Response(self.res)






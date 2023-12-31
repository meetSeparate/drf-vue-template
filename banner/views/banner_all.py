from rest_framework.views import APIView
from rest_framework.response import Response
from banner.models import Banner
from rest_framework import permissions


class BannerAllView(APIView):
    permission_classes = [permissions.AllowAny]
    res = {
        'code': 500,
        'msg': '操作成功',
        'result': []
    }

    def get(self, request):
        self.res['result'] = []
        banner_list = Banner.objects.all()
        for banner in banner_list:
            self.res['result'].append({
                'id': banner.id,
                'imgUrl': 'http://127.0.0.1:8000' + banner.banner_url.url,
                'type': banner.type,
                'hrefUrl': banner.category.id
            })
        self.res['code'] = 200
        return Response(self.res)

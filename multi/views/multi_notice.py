from rest_framework.views import APIView
from rest_framework.response import Response
from notice.models import Notice


class MultiDeleteNoticeView(APIView):
    def delete(self, request):
        res = {
            'code': 500,
            'msg': '删除成功',
            'data': {}
        }

        multi_data = request.data.get('multiData')
        for info in multi_data:
            notice_query = Notice.objects.filter(id=info)
            notice_query.delete()
        res['code'] = 200
        return Response(res)
from rest_framework.views import APIView
from rest_framework.response import Response
from notice.models import Notice
from api.config.pagination import Pagination
from notice.serializers import NoticeSerializer


class AllNoticeView(APIView):
    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': [],
            'total': 1,
            'user': []
        }
        title = request.GET.get('title')
        currentPage = int(request.GET.get('currentPage'))
        pageSize = int(request.GET.get('pageSize'))
        if title:
            notice_list = Notice.objects.filter(title__contains=title)
        else:
            notice_list = Notice.objects.all()
        total = notice_list.count()
        pager = Pagination(
            limit=int(pageSize),
            all_count=int(total),
            current_page=int(currentPage)
        )
        notice_query = notice_list[pager.start:pager.end]
        ser = NoticeSerializer(instance=notice_query, many=True)
        print(ser.data)
        res['data'] = ser.data
        res['total'] = total
        return Response(res)

    def delete(self, request):
        res = {
            'code': 200,
            'msg': '删除成功',
            'data': {}
        }
        id = request.data.get('id')
        notice_obj = Notice.objects.filter(id=id)
        notice_obj.delete()
        return Response(res)


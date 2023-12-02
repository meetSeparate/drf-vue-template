from rest_framework.views import APIView
from rest_framework.response import Response
from user.models import DetectionRecord


class RecodeView(APIView):
    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': []
        }

        record_list = DetectionRecord.objects.all()
        for record in record_list:
            res['data'].append({
                'id': record.id,
                'image': f'http://127.0.0.1:8000{record.image.url.url}',
                'mask': f'http://127.0.0.1:8000{record.mask.url.url}',
                'date': str(record.create_date)[:10]
            })
        return Response(res)


    def delete(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }

        id = request.data.get('id')
        record_query = DetectionRecord.objects.filter(id=id)
        record_query.delete()

        return Response(res)
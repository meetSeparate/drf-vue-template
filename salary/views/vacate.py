from rest_framework.views import APIView
from rest_framework.response import Response
from salary.models import Vacate


class VacateView(APIView):
    def post(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }
        start_time = request.data.get('startTime')
        end_time = request.data.get('endTime')
        purpose = request.data.get('purpose')

        Vacate.objects.create(user=request.user, start_time=start_time, end_time=end_time, purpose=purpose)
        return Response(res)

    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': []
        }
        name = request.GET.get('name')
        vacate_list = Vacate.objects.filter(user__name__contains=name)
        for vacate in vacate_list:
            res['data'].append({
                'id': vacate.id,
                'section': vacate.user.role.section.title,
                'role': vacate.user.role.title,
                'name': vacate.user.name,
                'start': str(vacate.start_time)[:16],
                'end': str(vacate.end_time)[:16],
                'purpose': vacate.purpose,
                'status': vacate.status
            })
        return Response(res)

    def delete(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }

        id = request.data.get('id')

        vacate_query = Vacate.objects.filter(id=id)
        vacate_query.delete()
        return Response(res)


    def put(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }

        id = request.data.get('id')
        status = request.data.get('status')
        vacate_query = Vacate.objects.filter(id=id)
        vacate_query.update(status=status)
        return Response(res)
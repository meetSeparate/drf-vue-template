from rest_framework.views import APIView
from rest_framework.response import Response
from salary.models import SalaryModel

class SalaryView(APIView):
    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': []
        }
        name = request.GET.get('name')
        salary_list = SalaryModel.objects.filter(user__name__contains=name)
        for salary in salary_list:
            res['data'].append({
                'id': salary.id,
                'userId': salary.user.id,
                'section': salary.user.role.section.title,
                'role': salary.user.role.title,
                'name': salary.user.name,
                'base': salary.base,
                'present': salary.present,
                'should_issued': salary.should_issued,
                'provide_age': salary.provide_age,
                'treatment': salary.treatment,
                'unemployed': salary.unemployed,
                'lodging': salary.lodging,
                'income_tax': salary.income_tax,
                'real_issued': salary.real_issued,
            })
        return Response(res)

    def post(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }
        user_id = request.data.get('userId')
        base = request.data.get('base')
        present = request.data.get('present')
        should_issued = request.data.get('should_issued')
        provide_age = request.data.get('provide_age')
        treatment = request.data.get('treatment')
        unemployed = request.data.get('unemployed')
        lodging = request.data.get('lodging')
        income_tax = request.data.get('income_tax')
        real_issued = request.data.get('real_issued')

        SalaryModel.objects.create(base=base, present=present, should_issued=should_issued, provide_age=provide_age, treatment=treatment,
                                   unemployed=unemployed, lodging=lodging, income_tax=income_tax, real_issued=real_issued, user_id=user_id)

        return Response(res)

    def delete(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }
        id = request.data.get('id')
        salary_query = SalaryModel.objects.filter(id=id)
        salary_query.delete()
        return Response(res)


    def put(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }
        id = request.data.get('id')
        base = request.data.get('base')
        present = request.data.get('present')
        should_issued = request.data.get('should_issued')
        provide_age = request.data.get('provide_age')
        treatment = request.data.get('treatment')
        unemployed = request.data.get('unemployed')
        lodging = request.data.get('lodging')
        income_tax = request.data.get('income_tax')
        real_issued = request.data.get('real_issued')

        salary_query = SalaryModel.objects.filter(id=id)

        salary_query.update(base=base, present=present, should_issued=should_issued, provide_age=provide_age, treatment=treatment,
                                   unemployed=unemployed, lodging=lodging, income_tax=income_tax, real_issued=real_issued)

        return Response(res)
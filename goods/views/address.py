from rest_framework.views import APIView
from rest_framework.response import Response
from goods.models import Address


class AddressView(APIView):
    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': []
        }
        id = request.GET.get('id')
        if id:
            address_list = Address.objects.filter(id=id)
        else:
            address_list = Address.objects.filter(user=request.user)
        for address in address_list:
            res['result'].append({
                'id': address.id,
                'receiver': address.receiver,
                'contact': address.concat,
                'provinceCode': address.provinceCode,
                'cityCode': address.cityCode,
                'countyCode': address.countyCode,
                'address': address.address,
                'isDefault': address.isDefault,
                'fullLocation': address.fullLocation,
            })
        if id:
            res['result'] = res['result'][0]
        return Response(res)

    def post(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {}
        }

        receiver = request.data.get('receiver')
        concat = request.data.get('contact')
        provinceCode = request.data.get('provinceCode')
        cityCode = request.data.get('cityCode')
        countyCode = request.data.get('countyCode')
        address = request.data.get('address')
        isDefault = request.data.get('isDefault')
        fullLocation = request.data.get('fullLocation')

        Address.objects.create(receiver=receiver, concat=concat, provinceCode=provinceCode,
                               cityCode=cityCode, countyCode=countyCode, address=address,
                               isDefault=isDefault, fullLocation=fullLocation, user=request.user)
        return Response(res)

    def delete(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {}
        }

        id = request.data.get('id')
        address_query = Address.objects.filter(id=id)
        address_query.delete()

        return Response(res)

    def put(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {}
        }

        id = request.data.get('id')
        address_query = Address.objects.filter(id=id)
        address_query.update(**request.data)
        return Response(res)

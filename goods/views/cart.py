from rest_framework.views import APIView
from rest_framework.response import Response
from goods.models import UserCart
from rest_framework import permissions


class GoodsCartView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }

        sku_id = request.data.get('skuId')
        buy_number = request.data.get('count')

        UserCart.objects.create(sku_id=sku_id, buy_num=buy_number, user=request.user)

        return Response(res)

    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': []
        }

        cart_list = UserCart.objects.filter(user=request.user)
        for cart in cart_list:
            specs = []
            for spec in cart.sku.specs.all():
                specs.append(spec.name)
            res['result'].append({
                'id': cart.sku.shop.id,
                'skuId': cart.sku.id,
                'name': cart.sku.shop.name,
                'picture': f'http://127.0.0.1:8000{cart.sku.shop.picture.url}',
                'count': cart.buy_num,
                'price': cart.sku.price,
                'nowPrice': cart.sku.price,
                'stock': cart.sku.inventory,
                'selected': cart.selected,
                'attrsText': ','.join(specs),
                'isEffective': True
            })
        return Response(res)

    def put(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }
        selected = request.data.get('selected')
        cart_query = UserCart.objects.filter(user=request.user)
        cart_query.update(selected=selected)
        return Response(res)

    def delete(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }

        ids = request.data.get('ids')
        for id in ids:
            cart_query = UserCart.objects.filter(id=id)
            cart_query.delete()
        return Response(res)

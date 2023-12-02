from rest_framework.views import APIView
from rest_framework.response import Response
from goods.models import UserCart, OrderPre


class OrderPreView(APIView):
    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {}
        }

        sku_id = request.GET.get('skuId')
        count = request.GET.get('count')
        if sku_id:
            cart = UserCart.objects.create(sku_id=sku_id, user=request.user, buy_num=count)
            OrderPre.objects.create(cart=cart, user=request.user)
            UserCart.objects.filter(id=cart.id)
        else:
            cart_list = UserCart.objects.filter(user=request.user, selected=True)
            for order in cart_list:
                OrderPre.objects.create(cart=order, user=request.user)

        goods = []
        summary = {
            'totalPrice': 0,
            'postFee': 10,
            'totalPayPrice': 10
        }
        order_pre_list = OrderPre.objects.filter(user=request.user)
        for order in order_pre_list:
            summary['totalPrice'] += order.cart.sku.price
            specs = []
            for spec in order.cart.sku.specs.all():
                specs.append(spec.name)
            goods.append({
                'id': order.cart.sku.shop.id,
                'attrsText': ','.join(specs),
                'count': order.cart.buy_num,
                'name': order.cart.sku.shop.name,
                'payPrice': order.cart.sku.price,
                'picture': f'http://127.0.0.1:8000{order.cart.sku.shop.picture.url}',
                'price': order.cart.sku.old_price,
                'skuId': order.cart.sku.id,
                'totalPayPrice': order.cart.sku.price,
                'totalPrice': order.cart.sku.price
            })
        summary['totalPayPrice'] = summary['totalPrice'] + 10
        # 从预订单列表中拿数据
        res['result'] = {
            'goods': goods,
            'summary': summary,
            'userAddresses': []
        }
        return Response(res)

    def delete(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'data': {}
        }

        order_pre_query = OrderPre.objects.filter(user=request.user)
        order_pre_query.delete()
        return Response(res)

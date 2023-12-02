from rest_framework.views import APIView
from rest_framework.response import Response
from goods.models import Order, OrderMiddle, GoodsSkus


class OrderView(APIView):
    def post(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {
                'id': 1
            }
        }

        addressId = request.data.get('addressId')
        buyerMessage = request.data.get('buyerMessage')
        deliveryTimeType = request.data.get('deliveryTimeType')
        goods = request.data.get('goods')

        order = Order.objects.create(user=request.user, address_id=addressId, state=1, countdown=3600, postFee=10,
                                     payChannel='在线支付微信支付', buyerMessage=buyerMessage,
                                     deliverTime=deliveryTimeType)
        total_money = 0
        for good in goods:
            sku_obj = GoodsSkus.objects.filter(id=good['skuId']).first()
            total_money += (sku_obj.price * good['count'])
            order_middle = OrderMiddle.objects.create(skus=sku_obj, buy_num=good['count'])
            order.order_middle.add(order_middle)
        order.totalMoney = total_money
        order.payMoney = total_money + 10
        order.save()
        res['result']['id'] = order.id
        return Response(res)

    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {}
        }
        id = request.GET.get('id')
        if id:
            order = Order.objects.filter(id=id).first()
            skus = []
            for middle in order.order_middle.all():
                sku_obj = GoodsSkus.objects.filter(id=middle.skus.id).first()
                specs = []
                for spec in sku_obj.specs.all():
                    specs.append(spec.name)
                skus.append({
                    'id': sku_obj.id,
                    'spuId': sku_obj.shop.id,
                    'name': sku_obj.shop.name,
                    'attrsText': ','.join(specs),
                    'quantity': middle.buy_num,
                    'curPrice': sku_obj.price,
                    'image': f'http://127.0.0.1:8000{sku_obj.shop.picture.url}'
                })
            res['result'] = {
                'id': order.id,
                'orderState': order.state,
                'countdown': order.countdown,
                'skus': skus,
                'receiverContact': order.address.receiver,
                'receiverMobile': order.address.concat,
                'receiverAddress': order.address.fullLocation,
                'createTime': str(order.create_time)[:17],
                'totalMoney': order.totalMoney,
                'postFee': order.postFee,
                'payMoney': order.payMoney
            }
        else:
            res['result'] = []
            status = int(request.GET.get('status'))
            if status == 0:
                order_list = Order.objects.filter(user=request.user)
            else:
                order_list = Order.objects.filter(user=request.user, state=status)
            for order in order_list:
                skus = []
                for middle in order.order_middle.all():
                    sku_obj = GoodsSkus.objects.filter(id=middle.skus.id).first()
                    specs = []
                    for spec in sku_obj.specs.all():
                        specs.append(spec.name)
                    skus.append({
                        'id': sku_obj.id,
                        'spuId': sku_obj.shop.id,
                        'name': sku_obj.shop.name,
                        'attrsText': ','.join(specs),
                        'quantity': middle.buy_num,
                        'curPrice': sku_obj.price,
                        'image': f'http://127.0.0.1:8000{sku_obj.shop.picture.url}'
                    })
                res['result'].append({
                    'id': order.id,
                    'orderState': order.state,
                    'countdown': order.countdown,
                    'skus': skus,
                    'receiverContact': order.address.receiver,
                    'receiverMobile': order.address.concat,
                    'receiverAddress': order.address.fullLocation,
                    'createTime': str(order.create_time)[:16],
                    'totalMoney': order.totalMoney,
                    'postFee': order.postFee,
                    'payMoney': order.payMoney,
                    'shopCount': len(skus),
                })
        return Response(res)

    def delete(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {}
        }

        id = request.data.get('id')
        order_query = Order.objects.filter(id=id)
        order_query.delete()

        return Response(res)

    def put(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {}
        }

        id = request.data.get('id')
        status = request.data.get('status')

        order = Order.objects.filter(id=id).first()
        order.state = status
        order.save()

        return Response(res)

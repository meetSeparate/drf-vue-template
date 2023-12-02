from rest_framework.views import APIView
from rest_framework.response import Response
from goods.models import UserCart


class CartDetailView(APIView):
    def put(self, request, id):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {}
        }

        count = request.data.get('count')
        selected = request.data.get('selected')
        cart_obj = UserCart.objects.filter(sku_id=id, user=request.user).first()
        if count:
            cart_obj.buy_num = count
        if selected:
            cart_obj.selected = selected
        cart_obj.save()

        return Response(res)
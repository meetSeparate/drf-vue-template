from rest_framework.views import APIView
from rest_framework import permissions
from rest_framework.response import Response
from goods.models import Goods, ShopDetailImage, GoodsSkus, GoodsSpecs, GoodsProperty
from goods.utils.util import get_all_category


class GoodsDetailView(APIView):
    permission_classes = [permissions.AllowAny]

    def get(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': {}
        }
        id = request.GET.get('id')
        # 商品图片
        pictures = []
        picture_list = ShopDetailImage.objects.filter(shop_id=id)
        if not picture_list.first():
            picture_list = ShopDetailImage.objects.filter(shop_id=46)
        for picture in picture_list:
            pictures.append(f'http://127.0.0.1:8000{picture.image.url}')

        # 商品规格specs
        specs = [
            {
                'id': '1433233',
                'name': '规格',
                'values': []
            },
            {
                'id': '1433234',
                'name': '尺码',
                'values': []
            },
            {
                'id': '1433235',
                'name': '颜色',
                'values': []
            },

        ]
        specs_list = GoodsSpecs.objects.filter(shop_id=id)
        if not specs_list.first():
            specs_list = GoodsSpecs.objects.filter(shop_id=46)
        for spec in specs_list:
            for item in specs:
                if str(spec.get_spec_type_display()) == item['name']:
                    item['values'].append({
                        'name': spec.name,
                        'desc': spec.desc,
                        'picture': f'http://127.0.0.1:8000{spec.picture.url}'
                    })
        specs_result = []
        for item in specs:
            if item['values']:
                specs_result.append(item)
        # skus组合列表
        skus = []
        skus_list = GoodsSkus.objects.filter(shop_id=id)
        if not skus_list.first():
            skus_list = GoodsSkus.objects.filter(shop_id=46)

        for sku in skus_list:
            sku_specs = []
            for spec in sku.specs.all():
                sku_specs.append({
                    'name': spec.name,
                    'valueName': spec.name
                })
            skus.append({
                'id': str(sku.id),
                'inventory': sku.inventory,
                'price': sku.price,
                'oldPrice': sku.old_price,
                'picture': "",
                'skuCode': sku.id,
                'specs': sku_specs
            })
        properties = []
        property_list = GoodsProperty.objects.filter(shop_id=id)
        if not property_list.first():
            property_list = GoodsProperty.objects.filter(shop_id=46)
        for property in property_list:
            properties.append({
                'name': property.name,
                'value': property.value
            })

        good_obj = Goods.objects.filter(id=id).first()
        if not good_obj:
            good_obj = Goods.objects.filter(id=46).first()
        res['result'] = {
            'id': str(good_obj.id),
            'name': good_obj.name,
            'desc': good_obj.desc,
            'oldPrice': good_obj.old_price,
            'price': good_obj.price,
            'saleCount': good_obj.salesCount,
            'collectCount': good_obj.collectionCount,
            'commentCount': good_obj.commentCount,
            'category': get_all_category(good_obj),
            'mainPictures': pictures,
            'specs': specs_result,
            'skus': skus,
            'properties': properties
        }

        return Response(res)

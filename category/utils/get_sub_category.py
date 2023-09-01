
def get_sub_category(data_list, number, index):
    result = []
    for data in data_list:
        if index == 1:
            goods_list = data.goods.all().order_by('?')[:number]
        else:
            goods_list = data.goods.all()
        result.append({
            'id': data.id,
            'name': data.name,
            'picture': 'http://127.0.0.1:8000'+data.picture.url,
            'goods': get_goods(goods_list),
            'children': get_sub_category(data.category_set.all(), number, index+1),
            'saleInfo': data.saleInfo
        })
    return result

def get_goods(goods_list):
    lis = []
    for good in goods_list:
        lis.append({
            'id': good.id,
            'name': good.name,
            'desc': good.desc,
            'picture': 'http://127.0.0.1:8000'+good.picture.url,
            'orderNum': good.orderNum,
            'price': good.price
        })
    return lis
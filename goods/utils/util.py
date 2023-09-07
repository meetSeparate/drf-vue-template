def get_all_category(good_obj):
    result = []
    category = good_obj.category_set.first()
    result.append(get_category_detail(category))
    if category.parent_category:
        result.append(get_category_detail(category.parent_category))
    return result

def get_category_detail(category):
    return {
        'id': category.id,
        'name': category.name
    }


def get_specs(good_obj):

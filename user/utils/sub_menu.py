from user.models import Menu


def serializer_menu(menu_query):
    middle_list = []
    for menu in menu_query:
        middle_list.append({
            'value': menu.id,
            'label': menu.label,
            'reveal': menu.reveal,
            'path': menu.path,
            'name': menu.menu_name,
            'component': f'() => import(../views/{menu.component_address})',
            'redirect': menu.redirect,
            'meta': {
                'title': menu.label,
                'isMenu': menu.type == '菜单',
                'icon': menu.menu_icon
            },
            'status': menu.status,
            'children': serializer_menu(menu.menu_set.all())
        })
    return middle_list


def get_sub_menu():
    menu_query = Menu.objects.filter(parent_menu=None)
    menu_list = serializer_menu(menu_query)
    return menu_list

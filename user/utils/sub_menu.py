from user.models import Menu


def serializer_menu(menu_query):
    middle_list = []
    for menu in menu_query:
        if menu.parent_menu:
            parent_menu_id = menu.parent_menu.id
        else:
            parent_menu_id = None
        middle_list.append({
            'value': menu.id,
            'label': menu.label,
            'another_name': menu.another_name,
            'type': menu.type,
            'reveal': menu.reveal,
            'path': menu.path,
            'menu_name': menu.menu_name,
            'component_address': menu.component_address,
            'redirect': menu.redirect,
            'menu_icon': menu.menu_icon,
            'status': menu.status,
            'parent_menu_id': parent_menu_id,
            'children': serializer_menu(menu.menu_set.all())
        })
    return middle_list


def get_sub_menu():
    menu_query = Menu.objects.filter(parent_menu=None)
    menu_list = serializer_menu(menu_query)
    return menu_list

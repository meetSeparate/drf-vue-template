
def serializer_menu(menu_query):
    middle_list = []
    for menu in menu_query:
        middle_list.append({
            'path': menu.path,
            'name': menu.menu_name,
            'component': menu.component_address,
            'redirect': menu.redirect,
            'meta': {
                'title': menu.label,
                'isMenu': menu.type != '按钮',
                'icon': menu.menu_icon
            },
            'children': serializer_menu(menu.menu_set.all())
        })
    return middle_list


def get_route(user):
    menu_query = user.role.menu.filter(parent_menu_id=1).order_by('sequence')
    menu_list = serializer_menu(menu_query)
    return menu_list

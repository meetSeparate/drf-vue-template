from user.models import Menu


def sub_menu_list():
    menu_query = Menu.objects.all()

    menu_list = []
    get_sub_menu(menu_query, menu_list)
    return menu_list


def get_sub_menu(menu_query, menu_list):
    for menu in menu_query:
        if not menu.parent_menu:
            # 查找根路由下的所有子路由
            lis = []
            menu.children = lis
            get_sub_menu(menu.children, menu_list)
            menu_list.append(menu)

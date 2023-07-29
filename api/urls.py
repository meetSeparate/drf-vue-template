from django.urls import path, include
from api.views import login, sign, route
from user.views import users, personal, character, menu
from announcement.views import anno

# 导入 simplejwt 提供的几个验证视图类
from rest_framework_simplejwt.views import (
    TokenRefreshView,
    TokenVerifyView
)

urlpatterns = [
    path('auth/', include('rest_framework.urls', namespace='rest_framework')),
    # 获取Token的接口
    path('login/', login.MyObtainTokenPairView.as_view(), name='token_obtain_pair'),
    # 刷新Token有效期的接口
    path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    # 验证Token的有效性
    path('token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    # 用户接口
    path('user/', users.UserView.as_view()),
    path('personal/', personal.PersonalView.as_view()),
    # 获取公告
    path('announcement/', anno.AnnouncementView.as_view()),
    # 获取所有角色信息
    path('character/', character.CharacterView.as_view()),
    # 获取所有菜单
    path('menu/', menu.MenuView.as_view()),
    # 注册接口
    path('sign/', sign.SignView.as_view()),
    # 获取当前角色对应菜单路由
    path('route/', route.RouteView.as_view())
]

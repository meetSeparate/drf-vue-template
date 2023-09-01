from django.urls import path, include
from api.views import login, sign, route
from user.views import users, personal, character, menu
from announcement.views import anno
from multi.views import multi_user, multi_role, multi_notice
from notice.views import message, all_message, user_notice
from category.views import head, category_details
from banner.views import banner_all

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
    path('route/', route.RouteView.as_view()),
    # 批量删除用户
    path('multi_user/', multi_user.MultiDeleteUserView.as_view()),
    # 批量删除角色
    path('multi_role/', multi_role.MultiDeleteRoleView.as_view()),
    # 批量删除消息
    path('multi_notice/', multi_notice.MultiDeleteNoticeView.as_view()),
    # 发送消息
    path('notice/', message.NoticeView.as_view()),
    # 消息管理
    path('all_notice/', all_message.AllNoticeView.as_view()),
    # 获取消息对应用户
    path('user_notice/', user_notice.UserNoticeView.as_view()),
    # 获取Web端首页分类数据
    path('categoryHead/', head.CategoryHeadView.as_view()),
    # 获取某分类下所有二级分类
    path('categoryDetails/', category_details.CategoryDetailsView.as_view()),
    # 获取首页轮播图
    path('banner/', banner_all.BannerAllView.as_view()),
]

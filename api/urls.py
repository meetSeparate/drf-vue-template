from django.urls import path, include, re_path
from api.views import login, sign, route
from user.views import users, personal, character, menu, file, detect, reocrd
from announcement.views import anno
from multi.views import multi_user, multi_role, multi_notice
from notice.views import message, all_message, user_notice
from category.views import head, category_details
from banner.views import banner_all
from goods.views import new, hot, good, detail, guess, cart, cart_detail, order_pre, address, order

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
    # 小程序端获取首页分类数据
    path('category/', head.CategoryView.as_view()),
    # 获取某分类下所有二级分类
    path('categoryDetails/', category_details.CategoryDetailsView.as_view()),
    # 获取首页轮播图
    path('banner/', banner_all.BannerAllView.as_view()),
    # 获取新鲜好物
    path('new/', new.GoodsNewView.as_view()),
    # 获取人气推荐
    path('hot/', hot.GoodsHotView.as_view()),
    path('good/', good.GoodView.as_view()),
    path('guess/', guess.GuessView.as_view()),
    path('goodsDetail/', detail.GoodsDetailView.as_view()),
    path('cart/', cart.GoodsCartView.as_view()),
    path('order/', order.OrderView.as_view()),
    path('order_pre/', order_pre.OrderPreView.as_view()),
    path('address/', address.AddressView.as_view()),
    re_path(r'cart_detail/(?P<id>\d+)', cart_detail.CartDetailView.as_view()),
    path('file/', file.ImageView.as_view()),
    path('upload/', file.MaskView.as_view()),
    path('record/', reocrd.RecodeView.as_view()),
    path('detect/', detect.DetectView.as_view()),
]

from rest_framework_simplejwt.views import TokenObtainPairView
from user.serializers import MyTokenObtainPairSerializer


class MyObtainTokenPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer

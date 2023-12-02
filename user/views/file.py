from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from user.models import ImageDrawing, MaskDrawing


class ImageView(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request):
        res = {
            'code': 200,
            'url': '',
            'id': 1
        }

        file = request.FILES.get('file')
        image = ImageDrawing.objects.create(url=file)
        res['url'] = f'http://127.0.0.1:8000/{image.url.url}'
        res['id'] = image.id
        return Response(res)


class MaskView(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request):
        res = {
            'code': 200,
            'url': '',
            'id': 1
        }

        file = request.FILES.get('file')
        image = MaskDrawing.objects.create(url=file)
        res['url'] = f'http://127.0.0.1:8000/{image.url.url}'
        res['id'] = image.id
        return Response(res)
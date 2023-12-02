from rest_framework.views import APIView
from rest_framework.response import Response
from user.models import ImageDrawing
from gradio_client import Client


class DetectView(APIView):
    def post(self, request):
        res = {
            'code': 200,
            'msg': 'success',
            'result': '',
        }
        origin_id = request.data.get('originId')
        content = request.data.get('describeContent')
        client = Client("https://facebook-musicgen.hf.space/")
        if origin_id:
            music = ImageDrawing.objects.filter(id=origin_id).first()
            result = client.predict(
                content,  # str  in 'Describe your music' Textbox component
                str(music.url.url)[1:],
                # str (filepath or URL to file) in 'File' Audio component
                fn_index=0
            )
        else:
            result = client.predict(
                content,  # str  in 'Describe your music' Textbox component
                # str (filepath or URL to file) in 'File' Audio component
                fn_index=0
            )
        print(result)
        res['result'] = result
        return Response(res)

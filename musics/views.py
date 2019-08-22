from django.shortcuts import render

# Create your views here.
def hello_view(request):
    return render(request, 'hello_django.html', {
        'data': "Hello Django ",
    })


from musics.models import Music
from musics.serializers import MusicSerializer

from rest_framework import viewsets


# Create your views here.
class MusicViewSet(viewsets.ModelViewSet):
    queryset = Music.objects.all()
    serializer_class = MusicSerializer
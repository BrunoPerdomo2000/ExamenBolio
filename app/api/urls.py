from django.urls import include, path
from . import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'games', views.GameViewSet)
router.register(r'desarroladora', views.DesarrolladoraViewSet)
router.register(r'genero', views.GeneroViewSet)

urlpatterns = [
    # path('', views.index, name='index')
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]
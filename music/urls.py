from django.urls import path
from .views import ListSongsView
from .views import LoginView, RegisterUsers  #  ListCreateSongsView, SongsDetailView,

urlpatterns = [
    path('songs/',      ListSongsView.as_view(), name="songs-all"),
    path('auth/login/', LoginView.as_view(),     name="auth-login"),
    path('auth/register/', RegisterUsers.as_view(), name="auth-register"),
]
1

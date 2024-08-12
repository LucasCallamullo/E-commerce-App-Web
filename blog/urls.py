from django.urls import path

from blog import views

# Esto es para supportear las imagenes de este servicio ?
from django.conf import settings
from django.conf.urls.static import static


from .views import PostCreateView


urlpatterns = [
    path('blog/', views.blog, name="Blog"),

    path('blog/categoria/<category_id>/', views.categoria, name="Categoria"),

    path('blog/post_create/', PostCreateView.as_view(), name='Post_create'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

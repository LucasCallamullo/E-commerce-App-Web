from django.shortcuts import render

# Create your views here.
from blog.models import Categoria, Post


from django.urls import reverse_lazy
from django.views.generic import CreateView
from .forms import PostForm


class PostCreateView(CreateView):
    model = Post
    form_class = PostForm
    template_name = 'blog/post_create.html'
    # Redirige a una página de éxito después de crear el post
    success_url = reverse_lazy('Blog')

    def form_valid(self, form):
        # Mantiene la relación con el usuario
        form.instance.autor = self.request.user
        # Almacenar el nombre completo del autor
        form.instance.autor_name = f"{self.request.user.first_name} {self.request.user.last_name}"
        return super().form_valid(form)


def blog(request):
    # Recuperar todos los servicios de la base de datos
    query_posts = Post.objects.all()

    # Obtener todas las categorías distintas asociadas a los posts
    # categories = Categoria.objects.filter(post__in=query_posts).distinct()

    # Obtener todas las categorías
    categories_all = Categoria.objects.all()  # Obtiene todas las categorías disponibles

    # Crear un diccionario para pasar a la plantilla
    context = {
        "posts": query_posts,
        # "categories": categories,
        "categories_all": categories_all
    }

    # Renderizar la plantilla con el contexto
    return render(request, "blog/blog.html", context)


def categoria(request, category_id):

    # obtengo el id de Categoria para poder filtrar los posts
    cat_id = Categoria.objects.get(id=category_id)
    posts_query = Post.objects.filter(categorias=cat_id)

    # Obtener todas las categorías
    categories_all = Categoria.objects.all()  # Obtiene todas las categorías disponibles

    dict_contexto = {"categories_all": categories_all, "posts": posts_query}

    return render(request, "blog/categoria.html", dict_contexto)





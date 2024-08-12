



# z_example_to_update_a_field.py

# Paso 1 - Llamar a la consola
# python manage.py shell

# Paso 2 - Importar nuestro script desde la app que lo creamos
# from blog.z_example_to_update_a_field import *

from blog.models import Post
from registros.models import CustomUser

# Paso 3 - Actualizar el campo autor_name en todos los posts
for post in Post.objects.all():
    # Obtén el usuario asociado al post
    user = CustomUser.objects.get(id=post.autor.id)

    # Actualiza el campo autor_name con el nombre completo
    post.autor_name = f"{user.first_name} {user.last_name}"
    post.save()

    # Para ver el progreso
    print(f"Updated {post.id} with autor_nombre: {post.autor_name}")


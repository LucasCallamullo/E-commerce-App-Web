

from django.shortcuts import render, redirect
from django.views.generic import View

from django.contrib import messages
from django.contrib.auth import login, logout, authenticate


from django.shortcuts import render, redirect

from registros.forms import CustomUserCreationForm
from registros.forms import LoginForm


from django.http import JsonResponse


def registro_widget(request):

    if request.method == 'POST':
        # Initialize the form with the POST data
        form = LoginForm(request.POST)

        # Validate the form data
        if form.is_valid():
            # Extract email and password from cleaned form data
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']

            # Authenticate the user with the provided email and password
            user = authenticate(request, email=email, password=password)

            # If authentication is successful then Log the user in
            if user is not None:
                login(request, user)

                # Check if the request is an AJAX request
                if request.headers.get('x-requested-with') == 'XMLHttpRequest':
                    # Return a JSON response indicating success for AJAX requests
                    return JsonResponse({'success': True, 'error': f'Welcome {email} for back.'})

                # Redirect to the home page for standard form submissions
                return redirect('Home')

            # If authentication is NOT successful
            else:
                # For AJAX requests, return a JSON response with an error message
                if request.headers.get('x-requested-with') == 'XMLHttpRequest':
                    return JsonResponse({'success': False, 'error': 'Invalid email or password.'})

                # For standard form submissions, add an error message and redirect
                messages.error(request, "Invalid email or password.")
                return redirect('Home')
        else:
            # If the form is not valid and it's an AJAX request, return an error message in JSON
            if request.headers.get('x-requested-with') == 'XMLHttpRequest':
                return JsonResponse({'success': False, 'error': 'Form is not valid.'})

            # For standard form submissions, add an error message and redirect
            messages.error(request, "Form is not valid.")
            return redirect('Home')

    # If the request method is not POST and it's an AJAX request, return an error message in JSON
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return JsonResponse({'success': False, 'error': 'Invalid request method.'})

    # For non-AJAX requests or GET requests, render the login form template
    return render(request, 'Home', {'form': LoginForm()})


def registro_widget2(request):
    """
    Handles user login by processing a POST request containing login credentials.

    This view processes the form submission for logging in a user. It validates
    the form, authenticates the user with the provided email and password, and
    if authentication is successful, logs the user in and redirects them to the
    homepage. If authentication fails or if the request method is not POST, the
    user is redirected to a 'success_page' or the current page to display error messages.

    :param request: The HTTP request object containing the POST data.
    :return: A redirect response to either the homepage or a page to show error messages.
    """
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            # Authenticate the user using the email and password provided in the form
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            user = authenticate(request, email=email, password=password)

            # Log the user in if authentication is successful
            if user is not None:
                login(request, user)

                # Redirect to the homepage after successful login
                return redirect('Home')

            else:
                # Add an error message if authentication fails
                messages.error(request, "Invalid email or password.")

                # Si el formulario no es válido o la autenticación falla, redirige a la misma página
                return redirect(request.META.get('HTTP_REFERER', 'Home'))



    # En caso de GET, redirige a la página principal o muestra un error
    # return redirect('Home')


def cerrar_session(request):
    """
    Logs out the user and redirects them to the homepage or another page after logging out.

    This view handles the logout process by calling the `logout` function to end
    the user's session. After logging out, the user is redirected to the homepage
    or any other specified page.

    :param request: The HTTP request object used to process the logout request.
    :return: A redirect response to the homepage or another specified page after logout.
    """
    logout(request)
    return redirect('Home')


def registro(request):

    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            # Guardar el usuario y encriptar la contraseña usando el método `save` del formulario.
            form.save()

            # Autenticar al usuario usando el email
            email = form.cleaned_data['email']
            password = form.cleaned_data['password1']
            user = authenticate(email=email, password=password)

            # Iniciar sesión del usuario
            if user is not None:
                login(request, user)

            # Redirigir a la página principal.
            return redirect('Home')

        else:
            print(request.POST)  # Esto imprimirá los datos enviados en la solicitud POST.
            print("\n\n")
            print(form.errors)  # Imprime los errores del formulario en la consola para depurar.

        form_submitted = True

    else:
        form = CustomUserCreationForm()
        form_submitted = False

    context = {'form': form, 'form_submitted': form_submitted}

    return render(request, 'registros/registro.html', context)












class VRegistro(View):

    def get(self, request):
        form = CustomUserCreationForm()
        return render(request, "registros/registro.html", {'form': form})

    def post(self, request):
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('Home')  # Cambia esto a la URL que desees después de registrar al usuario
        return render(request, "registros/registro.html", {'form': form})

    """ 
    def post(self, request):
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():

            email = request.POST["email"]
            password = request.POST["password1"]
            user = authenticate(email=email, password=password)

            if user is not None:
                login(request, user)
                # user = form.save()

            messages.success(request, "Registro exitoso. ¡Bienvenido!")
            return redirect('Home')  # Asegúrate de que 'Home' sea la URL correcta

        # Mostrar errores de formulario solo si el formulario no es válido
        for field, errors in form.errors.items():
            for error in errors:
                messages.error(request, error)

        return render(request, "registros/registro.html", {'form': form})
        
def login_user(request):
    # return render(request, "authenticate/login.html")
    return render(request, "registros/registro.html")
        """

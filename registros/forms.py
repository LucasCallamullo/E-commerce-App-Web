

from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import password_validation

from registros.models import CustomUser


class LoginForm(forms.Form):
    """
        Este es el formulario para logearse con una cuenta ya creada
    """
    email = forms.EmailField(
        label="Email",
        widget=forms.EmailInput(attrs={'placeholder': 'Correo electrónico', 'required': True}),
        error_messages={'invalid': 'La dirección de correo electrónico no es válida.'}
    )
    password = forms.CharField(
        label="Password",
        widget=forms.PasswordInput(attrs={'placeholder': 'Contraseña', 'required': True}),
    )


class CustomUserCreationForm(UserCreationForm):
    """
        Esto es parte del formulario para registrarse con una nueva cuenta

    """

    PROVINCIAS_CHOICES = [
        ('', 'Selecciona una provincia'),
        ('Buenos Aires', 'Buenos Aires'),
        ('Catamarca', 'Catamarca'),
        ('Chaco', 'Chaco'),
        ('Chubut', 'Chubut'),
        ('CABA', 'Ciudad Autónoma de Buenos Aires'),
        ('Córdoba', 'Córdoba'),
        ('Corrientes', 'Corrientes'),
        ('Entre Ríos', 'Entre Ríos'),
        ('Formosa', 'Formosa'),
        ('Jujuy', 'Jujuy'),
        ('La Pampa', 'La Pampa'),
        ('La Rioja', 'La Rioja'),
        ('Mendoza', 'Mendoza'),
        ('Misiones', 'Misiones'),
        ('Neuquén', 'Neuquén'),
        ('Río Negro', 'Río Negro'),
        ('Salta', 'Salta'),
        ('San Juan', 'San Juan'),
        ('San Luis', 'San Luis'),
        ('Santa Cruz', 'Santa Cruz'),
        ('Santa Fe', 'Santa Fe'),
        ('Santiago del Estero', 'Santiago del Estero'),
        ('Tierra del Fuego', 'Tierra del Fuego'),
        ('Tucumán', 'Tucumán')
    ]

    # le damos algunos formatos posibles
    email = forms.CharField(max_length=50, error_messages={
        'invalid': 'Ingrese una dirección de correo electrónico válida.'
    })
    first_name = forms.CharField(max_length=30)
    last_name = forms.CharField(max_length=30)
    phone = forms.CharField(max_length=20)
    province = forms.ChoiceField(choices=PROVINCIAS_CHOICES, required=False)  # Campo opcional
    address = forms.CharField(max_length=250, required=False)  # Campo opcional

    # se realiza esto para "eliminar" la doble validacion de password
    password1 = forms.CharField(widget=forms.PasswordInput)
    password2 = None

    class Meta:
        # declaramos nuestro .models CustomUser y le pasamos los campos a completar que recuperamos
        model = CustomUser
        fields = ('email', 'password1', 'first_name', 'last_name', 'phone', 'province', 'address')

    def __init__(self, *args, **kwargs):

        super().__init__(*args, **kwargs)

        # les asignamos un tipo de clase a todos nuestros widgets p/ trabajar con css
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})

    def save(self, commit=True):
        user = super().save(commit=False)
        # Configurar la contraseña encriptada
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user

    def clean_password1(self):
        # Metodo necesario para poder eliminar la validacion doble del password2
        password1 = self.cleaned_data.get('password1')
        try:
            password_validation.validate_password(password1, self.instance)
        except forms.ValidationError as error:

            # Method inherited from BaseForm
            self.add_error('password1', error)
        return password1

    def clean_email(self):
        # metodo necesario para poder autenticar el email
        email = self.cleaned_data.get('email')
        if CustomUser.objects.filter(email=email).exists():
            raise forms.ValidationError("Este correo electrónico ya está en uso.")
        return email



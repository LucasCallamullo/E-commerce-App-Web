

from django import forms


class FormularioContacto(forms.Form):
    """
    https://docs.djangoproject.com/en/5.0/topics/forms/
    Definir formulario nombre, por uno que querramos

    nombre = forms.CharField(label="Nombre", required=True)
    email = forms.CharField(label="E-mail", required=True)
    contenido = forms.CharField(label="Contenido", widget=forms.Textarea, required=True)

    """

    nombre = forms.CharField(label="Nombre", required=True)
    email = forms.EmailField(label="Email", required=True)
    celular = forms.CharField(label="Celular", required=False)
    producto = forms.CharField(label="Producto relacionado con tu consulta", required=False)
    contenido = forms.CharField(label="Mensaje", widget=forms.Textarea, required=True)



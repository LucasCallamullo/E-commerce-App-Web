

from django.shortcuts import render, redirect


from contacto.forms import FormularioContacto


# Para mandar mails informativos
from django.core.mail import EmailMessage
from ecommerce.settings import EMAIL_HOST_USER


# Create your views here.
def contacto(request):
    form_cont = FormularioContacto()
    contexto = {"form_contacto": form_cont}

    if request.method == "POST":
        formulario_contacto = FormularioContacto(data=request.POST)
        if formulario_contacto.is_valid():
            nombre = request.POST.get("nombre")
            email = request.POST.get("email")
            contenido = request.POST.get("contenido")

            e_mail = EmailMessage("Mensaje desde APP Django",
                    f"El usuario nombre: {nombre} con la dirección {email} nos dice:\n\n {contenido}",
                                  "", [EMAIL_HOST_USER], reply_to=[email])

            try:
                e_mail.send()
                return redirect("/contacto/?valido")

            except:
                return redirect("/contacto/?no_valido")

    return render(request, "contacto/contacto.html", contexto)
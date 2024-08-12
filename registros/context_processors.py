

from .forms import LoginForm


def login_widget_form(request):
    """
    :param request:
    :return: context

    Notes:
        Pasamos como context processor al widget de registro, ya que es parte de la base html
    """
    login_form = LoginForm()

    context = {
        'login_form': login_form
    }

    return context


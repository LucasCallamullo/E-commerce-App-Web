

from django.urls import path

from registros import views

urlpatterns = [
    # path('registro/', views.VRegistro.as_view(), name="Registro"),
    path('registro/', views.registro, name="Registro"),
    path('registro_widget/', views.registro_widget, name="Registro_widget"),
    path('registtro_cerrar_session/', views.cerrar_session, name="Cerrar_session"),
]


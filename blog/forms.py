

from django import forms
from .models import Post, Categoria


class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ['titulo', 'contenido', 'imagen', 'categorias']
        widgets = {
            'contenido': forms.Textarea(attrs={'cols': 80, 'rows': 10}),
            'categorias': forms.CheckboxSelectMultiple(),  # Para selección múltiple
        }

    categorias = forms.ModelMultipleChoiceField(
        queryset=Categoria.objects.all(),
        widget=forms.CheckboxSelectMultiple(),
        required=True  # Hacer que este campo sea obligatorio
    )

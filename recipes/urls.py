from django.urls import path

from recipes.views import recipe

app_name = 'recipes'

urlpatterns = [
    path('', recipe, name='recipe'),
]
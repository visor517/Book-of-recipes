from django.urls import path

from recipes.views import recipe

app_name = 'recipes'

urlpatterns = [
    path('<int:recipe_id>/', recipe, name='recipe'),
]
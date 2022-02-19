from django.shortcuts import render

from recipes.models import Recipe, RecipeImage, RecipeCategory

context = {}
context['categories'] = RecipeCategory.objects.all().order_by('name')


def index(request, category_id=None):
    context['title'] = 'Книга рецептов'
    recipes = Recipe.objects.all()
    for recipe_item in recipes:
        recipe_item.description = recipe_item.description[:128] + '...'
        recipe_item.image = recipe_item.recipeimage_set.first().image

    context['recipes'] = recipes

    return render(request, 'recipes/index.html', context)


def recipe(request, recipe_id):
    recipe_obj = Recipe.objects.get(id=recipe_id)
    recipe_obj.image = recipe_obj.recipeimage_set.first().image
    context['title'] = recipe_obj.name
    context['recipe'] = recipe_obj

    return render(request, 'recipes/recipe.html', context)

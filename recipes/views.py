from django.shortcuts import render

from recipes.models import Recipe, RecipeImage

context = {}


def index(request):
    context['title'] = 'Книга рецептов'
    recipes = Recipe.objects.all()
    for recipe_item in recipes:
        recipe_item.description = recipe_item.description[:128] + '...'
        recipe_item.image = recipe_item.recipeimage_set.first().image

    context['recipes'] = recipes

    return render(request, 'recipes/index.html', context)


def recipe(request):
    recipe_item = Recipe.objects.first()
    recipe_item.image = recipe_item.recipeimage_set.first().image
    context['title'] = recipe_item.name
    context['recipe'] = recipe_item

    return render(request, 'recipes/recipe.html', context)

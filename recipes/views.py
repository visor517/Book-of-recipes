from django.shortcuts import render
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from recipes.models import Recipe, Ingredient


def index(request, page=1):
    context = {
        'title': 'Книга рецептов',
        'ingredients': Ingredient.objects.all().order_by('name'),
    }

    recipes = Recipe.objects.prefetch_related('ingredients')

    if request.method == 'POST':
        try:
            search = request.POST.get('search')
        except:
            search = None
        try:
            ingredients = request.POST.getlist('ingredients')
        except:
            ingredients = None

        if search:
            recipes = recipes.filter(name__icontains=search)

        if ingredients:
            for ingredient in ingredients:
                recipes = recipes.filter(ingredients__pk=ingredient)

    for recipe_item in recipes:
        recipe_item.description = recipe_item.description[:128] + '...'  # сокращаем описание

    paginator = Paginator(recipes, 6)
    try:
        recipes_paginator = paginator.page(page)
    except PageNotAnInteger:
        recipes_paginator = paginator.page(1)
    except EmptyPage:
        recipes_paginator = paginator.page(paginator.num_pages)

    context['recipes'] = recipes_paginator

    return render(request, 'recipes/index.html', context)


def recipe(request, recipe_id):
    context = {
        'ingredients': Ingredient.objects.all().order_by('name'),
    }
    recipe_obj = Recipe.objects.prefetch_related("ingredients").get(id=recipe_id)
    context['title'] = recipe_obj.name
    context['recipe'] = recipe_obj

    return render(request, 'recipes/recipe.html', context)

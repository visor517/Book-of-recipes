from django.shortcuts import render
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from recipes.models import Recipe, Ingredient


def index(request, page=1):
    context = {
        'title': 'Книга рецептов',
        'ingredients': Ingredient.objects.all().order_by('name'),
    }

    query = Q()
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
            query.add(
                Q(name__contains=search.lower()), Q.AND
            )

        if ingredients:
            for ingredient_id in ingredients:
                query.add(
                    Q(ingredients__pk=ingredient_id), Q.AND
                )

    recipes = Recipe.objects.prefetch_related('ingredients').filter(query)
    for recipe_item in recipes:
        recipe_item.description = recipe_item.description[:128] + '...'  # сокращаем описание

    paginator = Paginator(recipes, 3)
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

from django.shortcuts import render


def index(request):
    return render(request, 'recipes/index.html')


def recipe(request):
    return render(request, 'recipes/recipe.html')

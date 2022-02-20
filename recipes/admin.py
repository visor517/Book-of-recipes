from django.contrib import admin

from recipes.models import Recipe, RecipeImage, Ingredient

admin.site.register(Recipe)
admin.site.register(RecipeImage)
admin.site.register(Ingredient)

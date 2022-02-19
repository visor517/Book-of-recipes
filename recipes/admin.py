from django.contrib import admin

from recipes.models import RecipeCategory, Recipe, RecipeImage, Ingredient, RecipeIngredient

admin.site.register(RecipeCategory)
admin.site.register(Recipe)
admin.site.register(RecipeImage)
admin.site.register(Ingredient)
admin.site.register(RecipeIngredient)

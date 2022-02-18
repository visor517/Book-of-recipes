from django.contrib import admin

from recipes.models import RecipeCategory, Recipe, RecipeImage

admin.site.register(RecipeCategory)
admin.site.register(Recipe)
admin.site.register(RecipeImage)

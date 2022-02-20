from django.db import models


class Recipe(models.Model):
    name = models.CharField("Название", max_length=256)
    description = models.TextField("Описание")
    ingredients = models.ManyToManyField("Ingredient", related_name="ingredient_recipes", verbose_name="Ингредиенты")

    def __str__(self):
        return f'{self.name}'


class RecipeImage(models.Model):
    recipe = models.ForeignKey("Recipe", on_delete=models.CASCADE, verbose_name="Рецепт")
    image = models.ImageField("Изображение", upload_to='recipes_images')

    def __str__(self):
        return f'Image {self.id} for {self.recipe.name}'


class Ingredient(models.Model):
    name = models.CharField("Ингредиент", max_length=32, unique=True)

    def __str__(self):
        return f'{self.name}'

from django.db import models


class Recipe(models.Model):
    name = models.CharField("Название", max_length=256)
    description = models.TextField("Описание")
    image = models.ImageField("Изображение", upload_to='recipes_images')
    ingredients = models.ManyToManyField("Ingredient", related_name="ingredient_recipes", verbose_name="Ингредиенты")

    def __str__(self):
        return f'{self.name}'


class Ingredient(models.Model):
    name = models.CharField("Ингредиент", max_length=32, unique=True)

    def __str__(self):
        return f'{self.name}'

    # для сортировки в админке
    class Meta:
        ordering = ('name',)

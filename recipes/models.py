from django.db import models


class RecipeCategory(models.Model):
    name = models.CharField(max_length=64, unique=True)
    description = models.TextField(blank=True, null=True)

    def __str__(self):
        return f'{self.name}'


class Recipe(models.Model):
    category = models.ForeignKey(RecipeCategory, on_delete=models.PROTECT)
    name = models.CharField(max_length=256)
    description = models.TextField()

    def __str__(self):
        return f'{self.name} | {self.category.name}'


class RecipeImage(models.Model):
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='recipes_images')

    def __str__(self):
        return f'Image {self.id} for {self.recipe.name}'


class Ingredient(models.Model):
    name = models.CharField(max_length=32, unique=True)

    def __str__(self):
        return f'{self.name}'


class RecipeIngredient(models.Model):
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
    ingridient = models.ForeignKey(Ingredient, on_delete=models.PROTECT)
    value = models.IntegerField(blank=True, null=True)
    measure = models.CharField(max_length=16, blank=True, null=True)

    def __str__(self):
        return f'{self.recipe.name} - {self.ingridient.name}'

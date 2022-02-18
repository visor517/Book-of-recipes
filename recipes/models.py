from django.db import models


class RecipeCategory(models.Model):
    alias = models.CharField(max_length=16, unique=True, primary_key=True)  # собираюсь использовать в url
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

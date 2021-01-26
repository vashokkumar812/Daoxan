from django.contrib import admin
from .models import Product
from .models import Category
# Register your models here.
class ProductAdmin(admin.ModelAdmin):
    list_display = ['__str__', 'slug']
    class Meta:
        model: Product

admin.site.register(Product)
admin.site.register(Category)
import random
import os
from django.db import models
from django.db.models import Q
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db.models.signals import pre_save,post_save
from django.urls import reverse

from ecommerce.utils import unique_slug_generator

class Category(models.Model):
    name = models.CharField(max_length=25)
    myfile=models.FileField(upload_to="media/",null=True,blank=True)

    def __str__(self):
        return self.name


def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext

def upload_image_path(instance, filename):
    new_filename =random.randint(1,2000000)
    name, ext = get_filename_ext(filename)
    final_filename ='{new_filename}{ext}'.format(new_filename=new_filename,ext=ext)
    return "products/{new_filename}/{final_filename}".format(new_filename=new_filename, final_filename=final_filename)

class ProductManager(models.Manager):
    def featured(self):
        return self.get_queryset().filter(featured=True)
    def get_by_id(self,pk):
        qs = self.get_queryset().filter(pk=pk)
        if qs.count() ==1:
            return qs.first()
        return None
    def search(self, query):
        lookups = Q(title__icontains=query) | \
                  Q(description__icontains=query) | \
                  Q(price__icontains=query) | \
                  Q(tag__title__icontains=query)
        return self.get_queryset().filter(lookups).distinct()

class Product(models.Model):
    category_id = models.ForeignKey(Category, on_delete=models.SET_NULL,null=True)
    product_id = models.CharField(
        max_length=5000, blank=True, null=True, verbose_name=u"Product id",
    )
    title = models.CharField(max_length=1200)
    slug = models.SlugField(blank=True, unique=True)
    description = models.CharField(blank=True, null=True,max_length=1000)
    product_type = models.IntegerField(
        null=False,
        blank=False,
        default=1,
        verbose_name=u"Type",
        validators=[MinValueValidator(1), MaxValueValidator(2)],
    )

    packaging_size = models.CharField(max_length=500, default=0, blank=True)
    variety = models.CharField(max_length=300, default=0, blank=True)
    price = models.IntegerField(default=0)
    image = models.ImageField(upload_to=upload_image_path, null=True, blank=True)
    featured = models.BooleanField(default=False)
    active = models.BooleanField(default=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    quantity = models.CharField(max_length=1000,default="")
    variant_of = models.ForeignKey("self",on_delete=models.SET_NULL,null=True,blank=True,db_constraint=False)

    objects = ProductManager()

    def get_absolute_url(self):
        return reverse("detail", kwargs={"slug": self.slug})

    def get_all_products_by_id(category_id):
        if category_id:
            return Product.objects.filter(category_id = category_id)
        else:
            return Product.objects.all()

    def __str__(self):
        return self.title


def product_pre_save_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = unique_slug_generator(instance)

pre_save.connect(product_pre_save_receiver, sender=Product)


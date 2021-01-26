import ast

from django.db import models
from django.conf import settings
from django.db.models.signals import pre_save, post_save, m2m_changed
from products.models import Product
# Create your models here.
User = settings.AUTH_USER_MODEL

class CartItem(models.Model):
    cart = models.ForeignKey("Cart",on_delete=models.SET_NULL,null=True,db_constraint=False)
    product = models.ForeignKey(Product,on_delete=models.SET_NULL,null=True,db_constraint=False)
    quantity = models.PositiveIntegerField(default=0)
    price = models.FloatField(default=0)
    class Meta:
        unique_together = ("cart",'product')


class CartManager(models.Manager):

    def new_or_get(self, request):
        cart_id = request.session.get("cart_id", None)
        qs = self.get_queryset().filter(id=cart_id)
        if qs.count() == 1:
            new_obj = False
            cart_obj = qs.first()
            if request.user.is_authenticated and cart_obj.user is None:
                cart_obj.user = request.user
                cart_obj.save()
        else:
            cart_obj = Cart.objects.new_cart(user=request.user)
            new_obj = True
            request.session['cart_id'] = cart_obj.id
        return cart_obj, new_obj

    def new_cart(self, user=None):
        user_obj = None
        if user is not None:
            if user.is_authenticated:
                user_obj = user
        return self.model.objects.create(user=user_obj)

class Cart(models.Model):
    user       = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL,db_constraint=False)
    products   = models.ManyToManyField(Product, through="CartItem")
    subtotal   = models.DecimalField(default=0.00, max_digits=10, decimal_places=2)
    total      = models.DecimalField(default=0.00, max_digits=10, decimal_places=2)
    updated    = models.DateTimeField(auto_now=True)
    timestamp  = models.DateTimeField(auto_now_add=True)

    objects = CartManager()
    def __str__(self):
        return str(self.id)


def m2m_changed_cart_receiver(sender, instance, action, *args, **kwargs):
    if action =='post_add' or action =='post_remove' or action =='post_clear':
        products = instance.products.all()
        print(products)
        total = 0
        
        for x in products:
            cartitem = instance.products.through.objects.get(cart = instance, product=x)
            print(cartitem)
            total += float((cartitem.price) )
            print(cartitem.price)
            print(total)
        if instance.subtotal != total:
            instance.subtotal = total
            instance.save()

        instance.total = total
        instance.save()

m2m_changed.connect(m2m_changed_cart_receiver, sender=Cart.products.through)

def pre_save_cart_receiver(sender, instance, *args, **kwargs):
    instance.total = instance.subtotal

pre_save.connect(pre_save_cart_receiver, sender=Cart)



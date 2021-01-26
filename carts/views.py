from django.shortcuts import render, redirect
from .models import Cart, CartItem
from django.http import JsonResponse
from products.models import Product
from orders.models import Order
from django.shortcuts import get_object_or_404
from accounts.form import LoginForm, GuestForm
from billing.models import BillingProfile
from accounts.models import GuestEmail
from addresses.forms import AddressForm
from addresses.models import Address
from django.http.response import HttpResponse
from django.middleware.csrf import get_token
from django.http import HttpResponse
# Create your views here.
import razorpay

def cart_detail_api_view(request):
    cart_obj, new_obj = Cart.objects.new_or_get(request)
    products = [{"id":x.id,"url":x.get_absolute_url(),"name": x.title, "price": x.price,'quantity':x.quantity,'orderq':
    cart_obj.products.through.objects.filter(product=x).first().quantity}
                for x in cart_obj.products.all()]
    cartupdate =list(cart_obj.products.through.objects.all().values_list('quantity', flat=True))
    
    
    cart_data = {"products": products, "subtotal": cart_obj.subtotal, "total": cart_obj.total,'cartupdate':cartupdate}
    return JsonResponse(cart_data)


def cart_home(request):
    cart_obj, new_obj = Cart.objects.new_or_get(request)
    cartupdate =list(cart_obj.products.through.objects.all().values_list('quantity', flat=True))
    
    items = CartItem.objects.filter(cart=cart_obj)
    

    return render(request, "carts/home.html", {"cart_obj":cart_obj,"cart":items,'cartupdate':cartupdate})


def cart_update(request):
    product_id = request.POST.get('product_id')
    print(request.POST.get('remove'))
    if True:
        product_obj = Product.objects.get(id=product_id)
        
        cart_obj, new_obj = Cart.objects.new_or_get(request)
        
        if request.POST.get('remove') != None:
            cart_obj.products.remove(product_obj)
            product_added = False
        else:
            cartupdate = cart_obj.products.through.objects.get_or_create(cart = cart_obj,product=product_obj)[0]
            
            cartupdate.quantity += 1
            cartupdate.price = product_obj.price * cartupdate.quantity
            cartupdate.save()
            cart_obj.products.add(product_obj)
            product_added = True
            
        request.session['cart_items'] = cart_obj.products.count()
        if True:
            json_data = {
                "added": product_added,
                "id": product_obj.pk,
                "token":get_token(request),
                "removed": not product_added,
                "cartItemCount": cart_obj.products.count()
            }
            return JsonResponse(json_data)
    return redirect("home")

def checkout_home(request):
    cart_obj, cart_created = Cart.objects.new_or_get(request)
    order_obj = None
    if cart_created or cart_obj.products.count() == 0:
        redirect("home")

    login_form = LoginForm()
    guest_form = GuestForm()
    address_form = AddressForm()
    billing_address_id = request.session.get("billing_address_id", None)
    shipping_address_id = request.session.get("shipping_address_id", None)
    billing_profile, billing_profile_created = BillingProfile.objects.new_or_get(request)
    address_qs = None

    if billing_profile is not None:
        if request.user.is_authenticated:
            address_qs = Address.objects.filter(billing_profile=billing_profile)
            order_obj, order_obj_created = Order.objects.new_or_get(billing_profile, cart_obj)
            if shipping_address_id:
                order_obj.shipping_address_id = get_object_or_404(Address, id=shipping_address_id)
                del request.session["shipping_address_id"]
            if billing_address_id:
                order_obj.billing_address_id = get_object_or_404(Address, id=billing_address_id).pk
                del request.session["billing_address_id"]
            if billing_address_id or shipping_address_id:
                order_obj.save()

    if request.method == "POST":
        is_done = order_obj.check_done()
        if is_done:
            order_obj.mark_paid()
            request.session['cart_items'] = 0
            del request.session['cart_id']
            return redirect("success")
    client = razorpay.Client(auth=("rzp_test_a5Nnfg9X58dFwH","VVjjK2VK385i0LBcZFy4vzN7"))
    response = client.order.create(dict(amount=100,currency="INR"))
    razorpay_order_id = response['id']
    razorpay_status = response['status']

    print(response['id'])
    context = {
        "object": order_obj,
        "billing_profile": billing_profile,
        "login_form": login_form,
        "guest_form":guest_form,
        "address_form": address_form,
        "address_qs": address_qs,
    }
    if razorpay_status == "created":
        context['razorpay_order_id'] = razorpay_order_id
        context['razorpay_amount']=str(cart_obj.total)
    # return HttpResponse("hello")
    return render(request, "carts/checkout_home.html", context)


def checkout_done_view(request):
    response = request.POST
    params_dict = {
        "razorpay_payment_id" :response['razorpay_payment_id'] ,
    "razorpay_order_id":response['razorpay_order_id'] ,
    "razorpay_signature": response['razorpay_signature']
    }
    client = razorpay.Client(auth=("rzp_test_a5Nnfg9X58dFwH", "VVjjK2VK385i0LBcZFy4vzN7"))
    try:
        status = client.utility.verify_payment_signature(params_dict)
        return render(request,"carts/checkout_done.html")
    except:
        return HttpResponse('Payment Failed!') #This page will be rendered if payment fails!

def remove(request,pk):
    cart_obj, cart_created = Cart.objects.new_or_get(request)
    product_obj = Product.objects.get(pk=pk)
    cart_obj.products.remove(product_obj)
    request.session['cart_items'] = cart_obj.products.count()
    product_added = False
    json_data = {
        "added": product_added,
        "id": request.POST.get(product_obj.pk),
        "token":get_token(request),
        "removed": not product_added,
        "cartItemCount": cart_obj.products.count()
    }
    return redirect('/cart/')
    

def add(request,pk):
    cart_obj, cart_created = Cart.objects.new_or_get(request)
    product_obj = Product.objects.get(pk=pk)
    request.session['cart_items'] = cart_obj.products.count()
    cartupdate = cart_obj.products.through.objects.get_or_create(cart = cart_obj,product=product_obj)[0]
    print(cartupdate)
    cartupdate.quantity += 1
    cartupdate.price = product_obj.price * cartupdate.quantity
    cartupdate.save()
    cart_obj.products.add(product_obj)
    product_added = True
    return redirect('/cart/')
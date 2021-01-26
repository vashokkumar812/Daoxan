from django.conf.urls import url
from django.urls import path

from .views import (cart_home,
                    cart_update,
                    checkout_home,
                    checkout_done_view,remove,add
                   )


urlpatterns = [
    url(r'^$', cart_home, name='home'),
    url(r'^checkout/$', checkout_home, name='checkout'),
    url(r'^checkout/success/$', checkout_done_view, name='success'),
    url(r'^update/$', cart_update, name='update'),
    path('remove/<pk>/', remove, name='remove'),
     path('add/<pk>/', add, name='remove'),

]
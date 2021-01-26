
from django.conf.urls import url

from .views import (ProductListView,
                            ProductDetailSlugView,
                            Product_List_View,
                            )


urlpatterns = [

    url(r'^$', ProductListView.as_view(), name='products'),
    url(r'^list/', Product_List_View, name='product_list'),
    url(r'^(?P<slug>[\w-]+)$', ProductDetailSlugView.as_view(), name='detail'),
]
from django.shortcuts import render
# Create your views here.
from django.db.models import Q
from django.views.generic import ListView

from products.models import Product


def SearchProductView(request):
    method_dict=request.GET
    query = method_dict.get('q', None)
    if query is not None:
        lookups = Q(title__icontains=query) | Q(description__icontains=query)
        x = Product.objects.filter(lookups).distinct()
    query= request.GET.get('q')
    context ={}
    context['query'] = query
    context['object_list'] = x
    return render(request,"search/search_view.html",context)
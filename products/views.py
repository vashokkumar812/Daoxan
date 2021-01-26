from django.contrib.auth.decorators import login_required
from django.http import Http404, HttpResponse
from django.views.generic import ListView, DetailView
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django import template
import pandas as pd
from analytics.mixins import ObjectViewedMixin
import openpyxl
import pandas as pd
import numpy as np
from .models import Product, Category
from carts.models import Cart


class ProductFeaturedView(ListView):
    temp_name = "products/product_list.html"

    def get_queryset(self, *args, **kwargs):
        request = self.request
        return Product.objects.featured()


# class Product_Featured_DetailView(ObjectViewedMixin, DetailView):
#     temp_name = "products/featured_detail.html"
#
#     def get_queryset(self, *args, **kwargs):
#         request = self.request
#         return Product.objects.featured()


class ProductListView(ListView):
    temp_name = "products/product_list.html"

    def get_context_data(self, *args, **kwargs):
        context = super(ProductListView, self).get_context_data(*args, **kwargs)
        request = self.request
        cart_obj, new_obj = Cart.objects.new_or_get(request)
        context['cart'] = cart_obj
        return context

    def get_queryset(self, *args, **kwargs):
        request = self.request
        return Product.objects.all()


def Product_List_View(request):
    queryset = Product.objects.all()
    cat = Category.objects.all()
    categoryID = request.GET.get('category')
    if categoryID:
        categoryID = int(categoryID)
        queryset = Product.get_all_products_by_id(categoryID)
    else:
        queryset = Product.objects.all()
    context = {
        'object_list': queryset,
        'categories': cat
    }
    return render(request, "products/product_list.html", context)


class ProductDetailSlugView(ObjectViewedMixin, DetailView):
    queryset = Product.objects.all()
    temp_name = "products/product_detail.html"

    def get_context_data(self, *args, **kwargs):
        context = super(ProductDetailSlugView, self).get_context_data(*args, **kwargs)
        request = self.request
        cart_obj, new_obj = Cart.objects.new_or_get(request)
        list = Product.objects.all()
        context['cart'] = cart_obj
        context['list'] = list
        return context

    def get_object(self, *args, **kwargs):
        request = self.request
        slug = self.kwargs.get('slug')
        # instance = get_object_or_404(Product, slug=slug, active=True)
        try:
            instance = Product.objects.get(slug=slug, active=True)
        except Product.DoesNotExist:
            raise Http404("Product doesn't exist")
        except Product.MultipleObjectsReturned:
            qs = Product.objects.filter(slug=slug, active=True)
            instance = qs.first()
        except:
            raise Http404("Something went wrong")
        return instance


class ProductDetailView(ObjectViewedMixin, DetailView):
    # queryset = Product.objects.all()
    temp_name = "products/product_detail.html"

    def get_object(self, *args, **kwargs):
        request = self.request
        pk = self.kwargs.get('pk')
        instance = Product.objects.get_by_id(pk=pk)
        if instance is None:
            raise Http404("Product doesn't exist")
        return instance

    # def get_queryset(self, *args, **kwargs):
    #     request = self.request
    #     pk = self.kwargs.get('pk')
    #     return Product.objects.filter(pk=pk)


def Product_Detail_View(request, pk=None, *args, **kwargs):
    instance = Product.objects.get_by_id(pk=pk)
    list = Product.objects.all()
    if instance is None:
        raise Http404("Product doesn't exist")
    context = {
        'object': instance,
        "list": list
    }
    return render(request, "products/product_detail.html", context)


@login_required(login_url="/admin")
def update_products(request, pk=None, *args, **kwargs):
    done = False
    if request.method == "POST":
        if True:
            category_id = request.POST["category_id"]
            cat = Category.objects.get(pk=int(category_id))
            cat.file = request.FILES["excel_file"]

            cat.save()

            # vendor = Vendor.objects.get(vendor_id=vendor_id)
            excel_file = request.FILES["excel_file"]
            # check extension

            # excel_data = list()
            # iterating over the rows and
            # getting value from each cell in row

            df = pd.read_csv(cat.file)
            global currenti
            global new_list
            new_list = pd.DataFrame(
                columns=['id', 'title', 'description', 'variety', 'variant_of', 'price', 'quantity', 'type'])
            currenti = ''

            def addrow(row):
                if type(row[0]) == str:
                    global currenti
                    global new_list
                    # print(row)
                    if currenti == row[0]:
                        rowlist = []

                        rowlist.append(row[0])
                        rowlist.append(row[1])
                        rowlist.append(row[12])
                        rowlist.append(row[4])
                        parentlist = rowlist
                        parentlist.append('parent')
                        parentlist.append(0)
                        parentlist.append('0')
                        parentlist.append(1)
                        rowdf = pd.DataFrame(np.array(parentlist).reshape(-1, len(parentlist)),
                                             columns=['id', 'title', 'description', 'variety', 'variant_of', 'price',
                                                      'quantity', 'type'])
                        # print(rowdf)
                        new_list = new_list.append(rowdf, ignore_index=True)

                    if float(row[2]) == 1:
                        pricelist = [5, 6, 7, 8, 9, 10]
                        for price in pricelist:
                            if float(row[price]) != 0:
                                rowlist = []

                                rowlist.append(row[0])
                                rowlist.append(row[1])
                                rowlist.append(row[12])
                                rowlist.append(row[4])
                                rowlist.append(row[0])
                                rowlist.append(row[price])

                                rowlist.append(df.columns[price].replace('price/ ', ''))
                                rowlist.append(1)
                                rowdf = pd.DataFrame(np.array(rowlist).reshape(-1, len(rowlist)),
                                                     columns=['id', 'title', 'description', 'variety', 'variant_of',
                                                              'price', 'quantity', 'type'])
                                # print(rowdf)
                                new_list = new_list.append(rowdf, ignore_index=True)


                    elif float(row[2]) == 2:
                        pricelist = [13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
                        for price in pricelist:
                            if float(row[price]) != 0:
                                rowlist = []

                                rowlist.append(row[0])
                                rowlist.append(row[1])
                                rowlist.append(row[12])
                                rowlist.append(row[4])
                                rowlist.append(row[0])
                                rowlist.append(row[price])

                                rowlist.append(df.columns[price])
                                rowlist.append(1)
                                rowdf = pd.DataFrame(np.array(rowlist).reshape(-1, len(rowlist)),
                                                     columns=['id', 'title', 'description', 'variety', 'variant_of',
                                                              'price', 'quantity', 'type'])
                                # print(rowdf)
                                new_list = new_list.append(rowdf, ignore_index=True)

            for index, row in df.iterrows():
                currenti = row[0]
                rowlist = []
                addrow(row)
            print(new_list)
            for index, row in new_list.iterrows():
                print(row[4])
                if row[4] == 'parent':
                    print('parent')
                    parentproduct = Product.objects.get_or_create(product_id=row[0], variant_of__pk=None)
                    parentproduct[0].title = row[1]
                    parentproduct[0].product_id = row[0]
                    parentproduct[0].description = row[2]
                    parentproduct[0].product_type = int(row[7])
                    print(parentproduct[0])
                    if row[3] != "null":
                        parentproduct[0].variety = row[3]
                    parentproduct[0].category_id = Category.objects.get(pk=float(request.POST["category_id"]))
                    print(int(row[7]))
                    parentproduct[0].save()
                else:
                    print('variant')
                    parentproduct = Product.objects.get_or_create(variant_of__product_id=row[0],
                                                                  price=int(float(row[5])))
                    parentproduct[0].title = row[1]
                    parentproduct[0].product_id = row[0]
                    parentproduct[0].description = row[2]
                    if row[3] != "null":
                        parentproduct[0].variety = row[3]
                    parentproduct[0].product_type = int(row[7])
                    print(parentproduct[0])
                    parentproduct[0].category_id = Category.objects.get(pk=float(request.POST["category_id"]))
                    parentproduct[0].variant_of = Product.objects.get(product_id=row[0], variant_of=None)

                    parentproduct[0].quantity = row[6]
                    print(int(row[7]))
                    parentproduct[0].save()

                if row[0] == None:
                    done = True
                    messages.success(request, "Update Successful")
                    return render(request, "products/update_products.html", {"done": done})

                # else:
                #     if row[2] == 2:
                #         price_dict = {
                #             "10 gms": float(row[13]),
                #             "25 gms": float(row[14]),
                #             "50 gms": float(row[15]),
                #             "100 gms": float(row[16]),
                #             "150 gms": float(row[17]),
                #             "250 gms": float(row[18]),
                #             "500 gms": float(row[19]),
                #             "2 kg": float(row[20]),
                #             "3 kg": float(row[21]),
                #             "5 kg": float(row[22]),
                #             "25 kg": float(row[23]),
                #         }
                #         # variety = row[4]
                #     elif row[2] == 1:
                #         price_dict = {
                #             "20 seeds": float(row[5]),
                #             "50 seeds": float(row[6]),
                #             "100 seeds": float(row[7]),
                #             "500 seeds": float(row[8]),
                #             "1000 seeds": float(row[9]),
                #             "3000 seeds": float(row[10]),
                #         }

                #     else:
                #         messages.error(
                #             request, "Product type should be 1, or 2.",
                #         )
                #         return redirect("update_products")
                #     # final_dict = ast.literal_eval(price_dict)
                #     #print(type(price_dict))
                #     instance, created = Product.objects.update_or_create(
                #         product_id=str(row[0]),
                #         defaults={
                #             "title": row[1],
                #             "price": price_dict,
                #             "category_id": Category.objects.get(pk=row[3]),
                #             "description": row[12],
                #             "product_type": row[2],
                #             "variety" : row[4]
                #         },
                #     )
                #     count += 1
                #     # for tag in row[13].split(","):
                #     #     instance.tags.add(tag)
        return HttpResponse("Products  uploaded successfully")


    else:
        return render(request, "products/update_products.html", {"done": done})

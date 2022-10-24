import datetime

from django.forms import modelformset_factory
from django.shortcuts import render,redirect,get_object_or_404, HttpResponse
from shoppingapp.forms import *
from django.contrib import messages
import datetime, os
from django.db.models import Q
from django.core.paginator import (Paginator, EmptyPage,PageNotAnInteger,)

def test(request):
    PROJECT_PATH = os.path.abspath(os.path.dirname(__name__))
    dir = PROJECT_PATH.split('\\')
    dir = dir[len(dir)-1]
    print(settings.BASE_DIR, ": ",  dir)

    return HttpResponse("")

def home(request):
    return render(request, 'home.html')

def categoryList(request):
    categories = Categories.objects.all().order_by('id')
    context = {'categories':categories}
    return render(request, 'crud/categoryList.html', context)

def categoryNew(request):
    if request.method == 'POST':
        form = CategoiesForm(data=request.POST, files=request.FILES)
        if form.is_valid():
            form.save()
            return redirect('categoryList')
        else:
            context = {'form': form}
            return render(request, 'crud/categoryNew.html', context)
    else:
        form = CategoiesForm()
        context = {'form': form}
        return render(request, 'crud/categoryNew.html', context)

def categoryUpdate(request, id):
    category = get_object_or_404(Categories, id=id)
    form = CategoiesForm(data=request.POST or None, instance=category)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('categoryList')
        else:
            context = {'form':form}
            return render(request, 'crud/categoryUpdate.html')
    else:
        context = {'form':form}
        return render(request, 'crud/categoryUpdate.html', context)

def categoryDelete(request, id):
    category = get_object_or_404(Categories, id=id)
    form = CategoiesForm(data=request.POST or None, instance=category)
    if request.method == 'POST':
        category.delete()
        return redirect('categoryList')
    else:
        form.deleteForm()
        context = {'form':form, 'category':category}
        return render(request, 'crud/categoryDelete.html', context)


def productList(request):
    products = Products.objects.all().order_by('pid')
    context = {'products':products}
    return render(request, 'crud/productList.html', context)

def productListPage(request, pageNo):
    # page = request.GET.get('page', page)
    items_per_page = 5
    products = Products.objects.all().order_by('pid')
    items_page = Paginator(products, items_per_page)
    context = {'products': items_page.page(pageNo)}
    return render(request, 'crud/productListPage.html', context)

def productNew(request):
    if request.method == 'POST':
        form = ProductsForm(data=request.POST, files=request.FILES)
        if form.is_valid():
            newForm = form.save(commit=False)
            pid = newForm.pid
            # filename = newForm.picture.name
            filepath = newForm.picture.name
            # point = filename.rfind('.')
            # ext = filename[point:]
            point = filepath.rfind('.')
            ext = filepath[point:]
            filenames = filepath.split('/')
            filename = filenames[len(filenames)-1]
            # filename = filename
            newfilename = pid + ext
            newForm.save() # product_tmp/xxx.xxx
            product = get_object_or_404(Products, pid=pid)
            product.picture.name = '/products/'+newfilename # pxxx.xxx
            product.save()

            # บนเซิร์ฟเวอร์ต้องเป็น djangShopping/static/products/'
            # if os.path.exists('static/products/' + newfilename):
            #     os.remove('static/products/' + newfilename)  # file exits, delete it
            # os.rename('products_tmp/'+filename, 'static/products/' + newfilename)
            if os.path.exists('static/products/' + newfilename):
                os.remove('static/products/' + newfilename)  # file exits, delete it
            os.rename('static/products/'+filename, 'static/products/' + newfilename)
        else:
            product = get_object_or_404(Products, pid=request.POST['pid'])
            if product:
                messages.add_message(request, messages.WARNING, "รหัสสินค้าซ้ำกับที่มีอยู่แล้วในระบบ")
                context = {'form': form}
                return render(request, 'crud/productNew.html', context)
        return redirect('productList')
    else:
        form = ProductsForm()
        context = {'form':form }
        return render(request, 'crud/productNew.html', context)

def productUpdate(request, pid):
    product = get_object_or_404(Products, pid=pid)
    picture = product.picture.name  # รูปสินค้าเดิม
    # form = ProductsForm(request.POST or None, instance=product, files=request.FILES)
    if request.method == 'POST':
        form = ProductsForm(request.POST or None, instance=product, files=request.FILES)
        if form.is_valid():
            newForm = form.save(commit=False)
            pid = newForm.pid
            print(newForm.picture.name)
            if newForm.picture.name != picture: #  หากเลือกรูปสินค้าใหม่
                newForm.save()
                filepath = newForm.picture.name
                point = filepath.rfind('.')
                ext = filepath[point:]
                filenames = filepath.split('/')
                filename = filenames[len(filenames) - 1]
                newfilename = pid + ext
                # filename = newForm.picture.name
                # point = filename.rfind('.')
                # ext = filename[point:]
                newfilename =  pid + ext
                product = get_object_or_404(Products, pid=pid)
                product.picture.name = '/products/' +newfilename
                product.save()
                # บนเซิร์ฟเวอร์ต้องเป็น djangShopping/static/products/'
                if os.path.exists('static/products/' + newfilename): # file exits, delete it
                    os.remove('static/products/' +newfilename)
                os.rename('static/products/'+ filename, 'static/products/' +newfilename)
            else:
                newForm.save()
        return redirect('productList')
    else:
        # form = ProductsForm(request.POST or None, instance=product, files=request.FILES)
        form = ProductsForm(instance=product)
        form.updateForm()
        context = {'form': form}
        return render(request, 'crud/productUpdate.html', context)

def productDelete(request, pid):
    product = get_object_or_404(Products, pid=pid)
    picture = product.picture.name  # รูปสินค้าเดิม
    if request.method == 'POST':
        product.delete()
        # บนเซิร์ฟเวอร์ต้องเป็น djangShopping/static/products/'
        # ใน table db เก็บ /products/xxx.xx
        if os.path.exists('static'+picture):  # file exits, delete it
            os.remove('static'+picture)
        return redirect('productList')
    else:
        form = ProductsForm(instance=product)
        form.deleteForm()
        context = {'form': form, 'product':product}
        return render(request, 'crud/productDelete.html', context)

def employeeList(request):
    employees = Employees.objects.all().exclude(Q(position='Administrator')).order_by('eid')
    context = {'employees': employees}
    return render(request, 'crud/employeeList.html', context)

def employeeNew(request):
    if request.method == 'POST':
        form = EmployeesForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('employeeList')
        else:
            context = {'form': form}
            return render(request, 'crud/employeeNew.html', context)
    else:
        form = EmployeesForm()
        context = {'form': form}
        return render(request, 'crud/employeeNew.html', context)

def employeeUpdate(request, eid):
    employee = get_object_or_404(Employees, eid=eid)
    if request.method == 'POST':
        form = EmployeesForm(request.POST or None, instance=employee)
        if form.is_valid():
            form.save()
            return redirect('employeeList')
        else:
            context = {'form': form}
            return render(request, 'crud/employeeUpdate.html', context)
    else:
        form = EmployeesForm(instance=employee)
        form.updateForm()
        context = {'form': form,}
        return render(request, 'crud/employeeUpdate.html', context)

def employeeDelete(request, eid):
    employee = get_object_or_404(Employees, eid=eid)
    if request.method == 'POST':
        employee.delete()
        return redirect('employeeList')
    else:
        form = EmployeesForm(instance=employee)
        form.deleteForm()
        context = {'form': form, 'employee': employee}
        return render(request, 'crud/employeeDelete.html', context)

def customerList(request):
    customers = Customers.objects.all().order_by('cid')
    context = {'customers':customers}
    return render(request, 'crud/customerList.html', context)

def customerRegistration(request):
    if request.method == 'POST':
        form = CustomersForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('userAuthen')
        else:
            context = {'form': form}
            return render(request, 'crud/customerRegister.html', context)
    else:
        form = CustomersForm()
        context = {'form': form}
        return render(request, 'crud/customerRegister.html', context)

def customerUpdate(request, cid):
    customer = get_object_or_404(Customers, cid=cid)
    if request.method == 'POST':
        form = CustomersForm(request.POST or None, instance=customer)
        if form.is_valid():
            form.save()
            if request.session.get('userStatus') == 'customer':
                return redirect('home')
            else:
                return redirect('customerList')
        else:
            context = {'form': form}
            return render(request, 'crud/customerUpdate.html', context)
    else:
        form = CustomersForm(instance=customer)
        form.updateForm()
        context = {'form': form}
        return render(request, 'crud/customerUpdate.html', context)

def userChangePassword(request):
    userId = request.session.get('userId')
    user = None
    if request.method == 'POST':
        form=ChangePasswordForm(request.POST or None)
        if request.session.get('userStatus') == 'customer':
            user = get_object_or_404(Customers, cid=userId)
        else:
            user = get_object_or_404(Employees, eid=userId)
        context = {'form': form}
        if request.POST['oldPassword'] == user.password:
            if request.POST['newPassword'] == request.POST['confirmPassword']:
                user.password = request.POST['newPassword']
                user.save()
                messages.add_message(request, messages.INFO, "เปลี่ยนรหัสผ่านเสร็จเรียบร้อย...")
                return redirect('home')
            else:
                messages.add_message(request, messages.WARNING, "รหัสผ่านใหม่กับรหัสที่ยืนยันไม่ตรงกัน...")
                return render(request, 'userChangePassword.html', context)
        else:
            messages.add_message(request, messages.ERROR, "รหัสผ่านที่ระบุไม่ถูกต้อง...")
            return render(request, 'userChangePassword.html', context)
    else:
        form=ChangePasswordForm(initial={'userId':userId})
        context ={'form':form}
        return render(request, 'userChangePassword.html', context)

def userResetPassword(request, userId):
    user = None
    if request.method == 'POST':
        form=ResetPasswordForm(request.POST or None)
        if request.session.get('userStatus') == 'customer':
            user = get_object_or_404(Customers, cid=userId)
        else:
            user = get_object_or_404(Employees, eid=userId)
        context = {'form': form}
        if request.POST['newPassword'] == request.POST['confirmPassword']:
            user.password = request.POST['newPassword']
            user.save()
            messages.add_message(request, messages.INFO, "เปลี่ยนรหัสผ่านเสร็จเรียบร้อย...")
            return redirect('home')
        else:
            messages.add_message(request, messages.WARNING, "รหัสผ่านใหม่กับรหัสที่ยืนยันไม่ตรงกัน...")
            return render(request, 'userResetPassword.html', context)
    else:
        form=ResetPasswordForm(initial={'userId':userId})
        context ={'form':form}
        return render(request, 'userResetPassword.html', context)


def userAuthen(request):
    if request.method == 'POST':
        userName = request.POST.get("userName")
        userPass = request.POST.get("userPass")
        user = Customers.objects.filter(cid=userName).filter(password=userPass).first()
        # user = get_object_or_404(Customers, cid=userName, password=userPass)
        if user:
            request.session['userId'] = user.cid
            request.session['userName'] = user.name
            request.session['userStatus'] = 'customer'
            # messages.add_message(request, messages.INFO, "Login success..")
            if request.session.get('orderActive'):
                del request.session['orderActive']
                return redirect('checkout')
            else:
                return redirect('home')
        else:
            user = Employees.objects.filter(eid=userName).filter(password=userPass).first()
            if user:
                request.session['userId'] = user.eid
                request.session['userName'] = user.name
                request.session['userStatus'] = user.position
                # messages.add_message(request, messages.INFO, "Login success..")
                return redirect('home')
            else:
                messages.add_message(request, messages.ERROR, "User or Password not Correct!!!..")
                data={'userName':userName}
                return render(request, 'userAuthen.html', data)
    else:
        data = {'userName': ''}
        return render(request, 'userAuthen.html', data)

def userLogout(request):
    del request.session["userId"]
    del request.session["userName"]
    del request.session["userStatus"]
    return  redirect('home')

def productShop(request):
    if request.method == 'POST':
        pid = request.POST.get('pid')
        qnt = int(request.POST.get('qnt'))
        cart = request.session.get('cart')
        if cart:
            quantity = cart.get(pid)
            if quantity:
                cart[pid] = quantity + qnt
            else:
                cart[pid] = qnt
        else:
            cart = {}
            cart[pid] = qnt
        request.session['cart'] = cart
        request.session['count'] = len(cart)
        print(request.session['cart'])
        print(request.session['count'])
        return redirect('productShop')
    else:
        products = Products.objects.all().order_by('pid')
        data = {'products':products}
    return render(request, 'productShop.html', data)


def showBasket(request):
    cart = request.session.get('cart')
    if request.method == 'POST':
        action = request.POST.get('action')
        pid = request.POST.get('pid')
        qnt = int(request.POST.get('qnt'))
        if action=="Update": #กดปุ่ม Update
            if cart[pid]:
                cart[pid] = qnt
        else: # กดปุ่มลบ
            del cart[pid]
        request.session['cart'] = cart
        request.session['count'] = len(cart)
    if len(cart) == 0:
        del request.session['cart']
        del request.session['count']
        del request.session['sum']
        return redirect('productShop')

    cart = request.session.get('cart')
    items = []
    sum=0.00
    for item in cart:
        product = Products.objects.get(pid=item)
        total=product.price * cart[item]
        sum+=total
        request.session['sum'] = sum
        items.append({'product':product, 'quantity':cart[item], 'total':total})
    data={'items':items}
    return render(request, 'showBasket.html',data)

def checkout(request):
    cart = request.session.get('cart')
    items = []
    sum = 0.00
    if cart:
        if not request.session.get('userId'):
            request.session['orderActive'] = True
            return redirect('userAuthen')
        cart = request.session.get('cart')
        date = datetime.datetime.now()
        print("date:", date)
        customer = get_object_or_404(Customers, cid=request.session.get('userId'))
        order = Orders()
        order.odate = date.strftime('%Y-%m-%d %H:%M:%S')
        order.customer = customer
        for item in cart:
            # print(item, cart[item])
            product = Products.objects.get(pid=item)
            total=product.price * cart[item]
            sum+=total
            request.session['sum'] = sum
            items.append({'product':product, 'quantity':cart[item], 'total':total})
        data={'items':items, 'order':order}
        return render(request, 'checkout.html', data)
    else:
        messages.add_message(request, messages.WARNING, "No product in basket!!!..")
        return redirect('productShop')

def order(request):
    cart = request.session.get('cart')
    if cart is None:
        return redirect('productShop')
    items = []
    date = datetime.datetime.now()
    customer = get_object_or_404(Customers, cid=request.session.get('userId'))
    order = Orders()
    order.newOrderId()
    order.odate = date.strftime('%Y-%m-%d %H:%M:%S')
    order.customer = customer
    order.status = "1"
    order.save()
    for item in cart:  # get any key from cart
        product = Products.objects.get(pid=item)
        quantity = cart[item]
        total = product.price * cart[item]
        orderDetail = OrderDetails()
        orderDetail.order = order
        orderDetail.product=product
        orderDetail.oprice=product.price
        orderDetail.quantity = quantity
        orderDetail.save()
        items.append({'product': product, 'quantity': cart[item], 'total': total})
    count = request.session.get('count')
    sum = request.session.get('sum')
    data = {'items': items, 'order': order, 'count':count, 'sum':sum}
    del request.session['cart']
    del request.session['count']
    del request.session['sum']
    return render(request, 'summary.html', data)

def clearBasket(request):
    del request.session['cart']
    del request.session['count']
    del request.session['sum']
    return redirect('productShop')

def showAllOrder(request):
    orders = []
    if request.session.get("userStatus")=='customer':
        customer = get_object_or_404(Customers, cid=request.session.get('userId'))
        orders = Orders.objects.filter(customer=customer).order_by('odate').reverse()
        context = {'customer':customer, 'orders':orders}
        return render(request, 'showAllOrder.html', context)
    else:
        orders = Orders.objects.filter(~Q(status='5')).exclude(status='6').exclude(status='7').order_by('odate').reverse() #อ่านใบสั่งซื้อที่ status 1-4
        context = {'orders': orders}
        return render(request, 'showAllOrder.html', context)

def showOrderDetail(request, oid):
    order = get_object_or_404(Orders, oid=oid)
    if request.method == 'POST':
        return redirect('home')
    else:
        context = {'order': order}
        return render(request, 'showOrderDetail.html', context)
def showHistoryOrder(request):
    orders = []
    orders = Orders.objects.filter(Q(status ='6') | Q(status='7') |Q(status='8'))
    context = {'orders': orders}
    return render(request, 'showHistoryOrder.html', context)

def orderConfirm(request, oid):
    order = get_object_or_404(Orders, oid=oid)
    employee = get_object_or_404(Employees, eid=request.session.get('userId'))
    confirm = Confirms()
    confirm.order = order
    confirm.employee = employee
    confirm.save()
    order.status = '2'
    order.save()
    return redirect('showAllOrder')

def moneyTransfer(request, oid):
    order = get_object_or_404(Orders, oid=oid)
    form = TranfersForm(request.POST or None, files=request.FILES)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            order.status='3'
            order.save()
        return redirect('showAllOrder')
    else:
        form = TranfersForm(initial={'order':order})
        form.setup()
        context = {'form':form, 'order':order }
        return render(request, 'moneyTransfer.html', context)

def moneyAccept(request,oid):
    order = get_object_or_404(Orders, oid=oid)
    employee = get_object_or_404(Employees, eid=request.session.get('userId'))
    accept = Accepts()
    accept.order = order
    accept.employee = employee
    accept.save()
    order.status = '4'
    order.save()
    return redirect('showAllOrder')

def productSend(request, oid):
    order = get_object_or_404(Orders, oid=oid)
    employee = get_object_or_404(Employees, eid=request.session.get("userId"))
    form = SendForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            order.status = '5'
            order.save()
        return redirect('showAllOrder')
    else:
        form = SendForm(initial={'order': order, 'employee':employee})
        context = {'form': form, 'order': order}
        return render(request, 'productSend.html', context)

def orderCancel(request, oid):
    order = get_object_or_404(Orders, oid=oid)
    form = CancelForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            order.status = '6'
            order.save()
        return redirect('showAllOrder')
    else:
        form = CancelForm(initial={'order': order})
        context = {'form': form, 'order': order}
        return render(request, 'orderCancel.html', context)

def orderReject(request, oid):
    order = get_object_or_404(Orders, oid=oid)
    employee = get_object_or_404(Employees, eid=request.session.get("userId"))
    form = RejectForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            order.status = '7'
            order.save()
        return redirect('showAllOrder')
    else:
        form = RejectForm(initial={'order': order, 'employee': employee})
        context = {'form': form, 'order': order}
        return render(request, 'orderReject.html', context)

def testDateTimeStamp(request):
    # -- datetime to timestamp --
    dt = datetime.datetime.now()
    ts = dt.timestamp()
    # -- timestamp to datetime --
    db = datetime.datetime.fromtimestamp(ts, tz=None).strftime("%d-%m-%Y")
    return HttpResponse("date now: "+ str(dt)+  ", time stamp: "+ str(ts)+ " date back: "+ str(db)+", type timestamp: " )

from django.shortcuts import render, redirect
from django.urls import path
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.hashers import check_password

# Create your views here.

def home(request):
    return render(request, 'base/home.html')

def loginPage(request, redirect_path = 'home'):
    context = {}
    redirect_path = request.GET.get('previous', 'home')
    if request.method == 'POST' :
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username = username, password = password)
        if user is not None :
            login(request, user)
            return redirect(redirect_path)
        else :
            messages.error(request, "Invalid Username/Password")
    return render(request, 'base/login.html', context)

def registerPage(request) :
    context = {}
    if request.method == 'POST' :
        username = request.POST.get('username')
        password = request.POST.get('password')
    return render(request, 'base/register.html', context)
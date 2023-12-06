from django.shortcuts import render, redirect
from django.urls import path
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.hashers import check_password

# Create your views here.

def home(request):
    return render(request, 'base/home.html')

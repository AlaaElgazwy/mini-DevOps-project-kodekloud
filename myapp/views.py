from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def mini_project(request):
    return render(request, '/home/alaa/mini_DevOps_project_kodekloud/myapp/templates/index.html')
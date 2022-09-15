"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from ast import Store
from app import views
from django.contrib import admin
from django.urls import path
from app.views import iaescritora, index, create, store, telaLogin, dologin, dashboard, logouts, changePassword, chatterbot , iaescritora, iaartistica


# Define as rotas e funções que serão chamadas
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index),
    path('create/', create),
    path('store/', store ),
    path('telaLogin/', telaLogin),
    path('dologin/', dologin),
    path('dashboard/', dashboard),
    path('logouts/', logouts),
    path('resetPassword/', changePassword),
    path('chatterbot/', chatterbot),
    path('iaartistica/', iaartistica),
    path('iaescritora/', iaescritora),
    path('getResponse/', views.getResponse)
]

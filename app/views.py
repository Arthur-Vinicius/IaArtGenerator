# Importa a Função render da biblioteca django.shortcuts 
from os import name
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.views.decorators.csrf import csrf_exempt

from django.http import HttpResponse

from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer, ChatterBotCorpusTrainer


# Create your views here.

# Retorna a pagina template index.html e renderiza
def index(request):
    return render(request,'index.html')

# Retorna a pagina template create.html e renderiza
def create(request):
    return render(request,'create.html')

# Esta Função verifica no banco de as senhas digitadas são iguais no caso password e password-conf
def store(request):
    # Data é um dicionario.
    data = {}
    # Condição que faz a validação se a senha é gual ou não, se a condição aceita for o if significa que as senhas são diferentes senão as informações são gravadas na variavel user para serem enviadas para o banco de dados e é exibido a mensagen de usuario cadastrado
    if(request.POST['password'] != request.POST['password-conf']):
        data['msg'] = 'As senhas não são iguais!'
        data['class'] = 'alert-danger'
    else: 
        # A variavel user armazena as informações dos posts 
        user = User.objects.create_user(request.POST['user'], request.POST['email'], request.POST['password'])
        user.first_name = request.POST['name']
        # Salva no banco de dados.
        user.save()
        # Define permições para os usuarios no sistema.
        ## user.user_permissions.add((ex: 27,53,1,5,9))
        data['msg'] = 'Usuário cadastrado com sucesso!'
        data['class'] = 'alert-success'
    return render(request,'create.html',data)

# Chamada do template html para renderizar na pagina que será realizado o login.   
def telaLogin(request):
    return render(request, 'telaLogin.html')

# Autenticação de credenciais para validação de login.
def dologin(request):
    data = {}
    user = authenticate(username=request.POST['user'], password=request.POST['password'])
    
    # Condição que valida se o usuário está logado out não.
    if user is not None:
        login(request, user)
        return redirect('/dashboard/')
    else:
        # Se a condição de logado não for atendido é exibido uma mensagem para realizar o login novamente e é renderizada a pagina de login novamente.
        data['msg'] = 'Nome de Usuário ou senha inválidos!'
        data['class'] = 'alert-danger'
        return render(request, 'telaLogin.html', data)

# Chama o arquivo home.html da pasta dashbord para renderização na tela.
def dashboard(request):
    return render(request, 'dashboard/home.html')

# Chama o arquivo telaLogin.html para renderizar na tela indicando que a seção foi encerrada.
def logouts(request):

    # Função para elinimar a seção, remove as informações de login.
    logout(request)
    # Retorna o usuario para a tela de login
    return redirect('/telaLogin/')

# Define a criação de uma rota para a redefinicção de senha.
def changePassword(request):
    # Variavel que recebe as informações do usuario para redefinir a senha.
    user = User.objects.get(email=request.user.email)
    ############ Criar formulario de troca de senha
    user.set_password(request.POST['resetPpassword'])
    user.save()
    logout(request)
    return redirect('/painel/')

def chatterbot(request):
    return render(request,'dashboard/chatterbot.html')

def iaartistica(request):
    return render(request,'dashboard/iaartistica.html')

def iaescritora(request):
    return render(request,'dashboard/iaescritora.html')




bot = ChatBot('tinbot', read_only = False, logic_adapters=[{
        'import_path':'chatterbot.logic.BestMatch',
        # 'default_response': 'Sorry, I am not sure what that means',
        # 'maximum_similarity_threshold':0.90
    }])

#training_list = [
#     "hi",
#     "hi, there",
#     "what's your name",
#     "I'm just a chatbot",
#     "what is your favourite food",
#     "I like pizza",
##     "what's your favourite sport",
#     "volleyball",
#     "do you have children",
#     "no"
#]

#chatterbotCorpusTrainer = ChatterBotCorpusTrainer(bot)
#chatterbotCorpusTrainer.train('chatterbot.corpus.english')

#list_trainer = ListTrainer(bot)
#list_trainer.train(training_list)


def getResponse(request):
    userMessage = request.GET.get('userMessage')
    chatResponse = str(bot.get_response(userMessage))
    return HttpResponse(chatResponse)
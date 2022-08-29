# Definição da imagen base para a criação do container que irá conter a aplicação django web.
FROM python:3.7.9

ENV PYTHONUNBUFFERED 1

# Definição do diretorio que será ultilizado dentro do container para o armazenamento e organização dos arquivos do programa/app. 
WORKDIR /app

RUN pip install -U pip setuptools
  
# Instrução que faz cópia do arquivo de requisitos para o sistema para dentro do sistema.
COPY requirements.txt /app/requirements.txt

# Execução de comandos para a instalação de pacotes e programas para o sistema dentro do container docker. (instalação de pacotes)
RUN pip install -r requirements.txt 
    #&& \
    #pip install chatterbot && \
    #pip install spacy

# Copia do diretorio raiz da maquina host para o diretorio /app dentro do container docker.
COPY . /app

# Instrução para rodar comandos dentro do container.
#CMD ["python manage.py migrate" , "python manage.py runserver 0.0.0.0:8000"]
CMD ["entrypoint.sh"]

EXPOSE 8000
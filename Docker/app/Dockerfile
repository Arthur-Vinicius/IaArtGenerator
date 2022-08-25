FROM python:3.7

RUN apt-get update -y && \
  apt-get install -y python3-pip python3-dev && \
  pip3 install --upgrade pip 

WORKDIR /app

<<<<<<< HEAD:Docker/app/Dockerfile
RUN pip install Django requests django_mysqldb && \
  pip install --upgrade pip && \ 
  pip install chatterbot && \
  pip install spacy

COPY . ./app

EXPOSE 8080

CMD ["python", "manage.py"]
=======
COPY requirements.txt requirements.txt
  
RUN pip3 install -r requirements.txt && \
  #pip3 install Flask requests flask_mysqldb && \
  pip3 install chatterbot && \
  pip3 install spacy

COPY . /app

EXPOSE 8080

CMD ["python", "manage.py", "runserver","0.0.0.0.:8000"]
>>>>>>> b4154282a515a5b91d13ffa9ffe002660cc2252b:app/Dockerfile

# pip install Django==3.2.7

# django-admin startproject project .

# python manage.py startapp app

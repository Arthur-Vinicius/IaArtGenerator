FROM python:3.7

RUN apt-get update -y && \
  apt-get install -y python3-pip python3-dev

WORKDIR /app

RUN pip install Django requests django_mysqldb && \
  pip install --upgrade pip && \ 
  pip install chatterbot && \
  pip install spacy

COPY . ./app

EXPOSE 8080

CMD ["python", "manage.py"]

# pip install Django==3.2.7

# django-admin startproject project .

# python manage.py startapp app
